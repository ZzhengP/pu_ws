#include <pcl/ModelCoefficients.h>
#include <pcl/io/pcd_io.h>
#include <pcl/point_types.h>
#include <pcl/filters/extract_indices.h>
#include <pcl/filters/voxel_grid.h>
#include <pcl/filters/passthrough.h>
#include <pcl/features/normal_3d.h>
#include <pcl/kdtree/kdtree.h>
#include <pcl/sample_consensus/method_types.h>
#include <pcl/sample_consensus/model_types.h>
#include <pcl/segmentation/sac_segmentation.h>
#include <pcl/segmentation/extract_clusters.h>
#include <eigen_conversions/eigen_msg.h>
#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include "std_msgs/String.h"
#include "std_msgs/Float64MultiArray.h"
#include <iostream>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl_ros/point_cloud.h>
#include "visualization_msgs/InteractiveMarker.h"
#include "visualization_msgs/MarkerArray.h"
#include "geometry_msgs/PoseStamped.h"
#include "eigen3/Eigen/Core"
#include "tf/LinearMath/Transform.h"
#include "tf/transform_datatypes.h"

// Cette fonction a pour le but de trouver tous les cylindres dans les points de nuages


typedef pcl::PointXYZ PointT;

typedef pcl::PointCloud<pcl::PointXYZ> PointCloud;

ros::Publisher test_pub;   // déclarer publish en global pour utiliser les donnés dans main fonction
ros::Publisher marker_pub;
ros::Publisher pose_pub;
visualization_msgs::Marker marker;

double get_cylinder_height(const pcl::PointCloud<PointT>::Ptr input_cloud_ptr, PointT* max_pt, PointT* min_pt, const pcl::ModelCoefficients::Ptr coefficients){

        Eigen::Vector3f orientation(coefficients->values[3],coefficients->values[4],coefficients->values[5]);

        Eigen::Vector3f pointOnAxis(coefficients->values[0],coefficients->values[1],coefficients->values[2]);
        Eigen::Vector3f max_point;
        Eigen::Vector3f min_point;
        Eigen::Vector3f pointTranslated;

        pointTranslated=input_cloud_ptr->points[0].getVector3fMap()-pointOnAxis;

        double min=(pointTranslated.dot(orientation))/orientation.norm();
        double max=(pointTranslated.dot(orientation))/orientation.norm();
        min_point=pointOnAxis+min*orientation;
        max_point=pointOnAxis+max*orientation;

        BOOST_FOREACH(const PointT& pt, input_cloud_ptr->points){

        //Translate all points in the direction of the axis point
        pointTranslated=pt.getVector3fMap()-pointOnAxis;

        //Project all points on the unit vector and comparing the scalar product
        if (pointTranslated.dot(orientation)<min){
          min=(pointTranslated.dot(orientation))/orientation.norm();
          //retransform the point to the original axis
          min_point=pointOnAxis+min*orientation;
        }
        if (pointTranslated.dot(orientation)>max){
          max=(pointTranslated.dot(orientation))/orientation.norm();
          //retransform the point to the original axis
          max_point=pointOnAxis+max*orientation;
       }
      }

      //Conversion back to Point Type
        max_pt->x=max_point[0];
        max_pt->y=max_point[1];
        max_pt->z=max_point[2];

        min_pt->x=min_point[0];
        min_pt->y=min_point[1];
        min_pt->z=min_point[2];

    return max-min;


}

void imagecallback(const sensor_msgs::PointCloud2ConstPtr& cloud_ros){

   // All the objects needed
     pcl::PCDReader reader;
     pcl::PassThrough<PointT> pass;
     pcl::NormalEstimation<PointT, pcl::Normal> ne;
     pcl::SACSegmentationFromNormals<PointT, pcl::Normal> seg;
     pcl::PCDWriter writer;
     pcl::ExtractIndices<PointT> extract;
     pcl::ExtractIndices<pcl::Normal> extract_normals;
     pcl::search::KdTree<PointT>::Ptr tree (new pcl::search::KdTree<PointT> ());

     // Datasets
     pcl::PointCloud<PointT>::Ptr cloud (new pcl::PointCloud<PointT>);
     pcl::PointCloud<PointT>::Ptr cloud_filtered (new pcl::PointCloud<PointT>) , cloud_concatene (new pcl::PointCloud<PointT>);
     pcl::PointCloud<pcl::Normal>::Ptr cloud_normals (new pcl::PointCloud<pcl::Normal>);
     pcl::ModelCoefficients::Ptr coefficients_plane (new pcl::ModelCoefficients), coefficients_cylinder (new pcl::ModelCoefficients);
     pcl::PointIndices::Ptr inliers_plane (new pcl::PointIndices);
     pcl::fromROSMsg(*cloud_ros,*cloud);

     // Build a passthrough filter to remove spurious NaNs
     pass.setInputCloud (cloud);
     pass.setFilterFieldName ("z");
     pass.setFilterLimits (0, 2.5);
     pass.filter (*cloud_filtered);
     std::cerr << "PointCloud after filtering has: " << cloud_filtered->points.size () << " data points." << std::endl;

     // Estimate point normals
     ne.setSearchMethod (tree);
     ne.setInputCloud (cloud_filtered);
     ne.setKSearch (100);
     ne.compute (*cloud_normals);

     // Create the segmentation object for the planar model and set all the parameters
     seg.setOptimizeCoefficients (true);
     seg.setModelType (pcl::SACMODEL_NORMAL_PLANE);
     seg.setNormalDistanceWeight (0.1);
     seg.setMethodType (pcl::SAC_RANSAC);
     seg.setMaxIterations (1000);
     seg.setDistanceThreshold (0.03);
     seg.setInputCloud (cloud_filtered);
     seg.setInputNormals (cloud_normals);
     // Obtain the plane inliers and coefficients
     seg.segment (*inliers_plane, *coefficients_plane);
  //   std::cerr << "Plane coefficients: " << *coefficients_plane << std::endl;

     // Extract the planar inliers from the input cloud
     extract.setInputCloud (cloud_filtered);
     extract.setIndices (inliers_plane);
     extract.setNegative (false);  // true if all points except the input indice, false otherwise

     // Write the planar inliers to disk
     pcl::PointCloud<PointT>::Ptr cloud_plane (new pcl::PointCloud<PointT> ());
     extract.filter (*cloud_plane);
   //  std::cerr << "PointCloud representing the planar component: " << cloud_plane->points.size () << " data points." << std::endl;
     if (!cloud_plane->points.empty())
        writer.write ("table_scene_mug_stereo_textured_plane.pcd", *cloud_plane, false);


     // Test pour multi cylinder

        bool mayHaveCylinder = true ;
        std::vector<pcl::ModelCoefficients::Ptr> cylinders_coefficients;
        std::vector<pcl::PointCloud<pcl::PointXYZ>::Ptr> cloud_cylinders;
        do {
             pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_cylinder_test(new pcl::PointCloud<pcl::PointXYZ> ());
             seg.setOptimizeCoefficients(true);
             seg.setModelType(pcl::SACMODEL_CYLINDER);
             seg.setMethodType(pcl::SAC_RANSAC);
             seg.setNormalDistanceWeight(0.1);
             seg.setMaxIterations(1000);
             seg.setDistanceThreshold(0.1);
             seg.setRadiusLimits(0.01,0.4);
             seg.setInputCloud(cloud_filtered);
             seg.setInputNormals(cloud_normals);

             // obtain the cylinder inliers and coefficients

             pcl::ModelCoefficients::Ptr coefficients_cylinder_test (new pcl::ModelCoefficients);
             pcl::PointIndices::Ptr inliers_cylinder_test (new pcl::PointIndices);
             seg.segment(*inliers_cylinder_test, *coefficients_cylinder_test);
             std::cerr << "cylinder coefficients: " << *coefficients_cylinder_test << std::endl;
             extract.setInputCloud(cloud_filtered);
             extract.setIndices(inliers_cylinder_test);
             extract.setNegative(false);
             extract.filter(*cloud_cylinder_test);


             if (cloud_cylinder_test ->points.size() > 5000)
                {
                    cylinders_coefficients.push_back(coefficients_cylinder_test);
                    cloud_cylinder_test->header.frame_id = cloud_ros->header.frame_id;
                    cloud_cylinders.push_back(cloud_cylinder_test);

                    extract.setNegative(true);
                    extract.filter(*cloud_filtered);
                    std::cerr <<"cloud filtered size:" << cloud_filtered->points.size() << std::endl;
                    extract_normals.setNegative(true);
                    extract_normals.setInputCloud(cloud_normals);
                    extract_normals.setIndices(inliers_cylinder_test);
                    extract_normals.filter(*cloud_normals);

                }
             else
                {

                   mayHaveCylinder = false;
                }
           }while(mayHaveCylinder);

           cloud_concatene ->header.frame_id = cloud_ros->header.frame_id ;
          std::cout<<"Il y a en tout " <<cloud_cylinders.size()<<"cylindre"<< std::endl;
          for (int i(0); i < cloud_cylinders.size(); i ++ )
             {

                *cloud_concatene +=  *cloud_cylinders[i];

             }
          visualization_msgs::Marker marker;


          if (cloud_cylinders.size()!=0)
              {
                Eigen::Vector3d pseudo_center(0., 0., 0.);

                int num_points_in_cylinder = cloud_cylinders[0]->points.size();
                for (int i = 0; i < num_points_in_cylinder; i++)
                {
                  pseudo_center(0) += cloud_cylinders[0]->points[i].x;
                  pseudo_center(1) += cloud_cylinders[0]->points[i].y;
                  pseudo_center(2) += cloud_cylinders[0]->points[i].z;
                }
                pseudo_center /= num_points_in_cylinder;
                Eigen::Vector3d central_axis(cylinders_coefficients[0]->values[3], cylinders_coefficients[0]->values[4], cylinders_coefficients[0]->values[5]);

//                // Project the pseduo_center onto the central_axis
//                // https://en.wikipedia.org/wiki/Vector_projection
                Eigen::Vector3d point_on_central_axis(cylinders_coefficients[0]->values[0], cylinders_coefficients[0]->values[1], cylinders_coefficients[0]->values[2]);

                Eigen::Vector3d pseudo_center_vector = pseudo_center - point_on_central_axis;

                Eigen::Vector3d pseudo_center_vector_projection = pseudo_center_vector.dot(central_axis) / central_axis.dot(central_axis) * central_axis;

                Eigen::Vector3d center = pseudo_center_vector_projection + point_on_central_axis;

////                std::vector<double> data(10, 0);
////                for (int i = 0; i < 7; i++)
////                {
////                  data[i] = coefficients_cylinder->values[i];
////                }
////                // data[7] = pseudo_center(0);
////                // data[8] = pseudo_center(1);
////                // data[9] = pseudo_center(2);
////                data[7] = center(0);
////                data[8] = center(1);
////                data[9] = center(2);



               marker.header.frame_id = cloud_ros->header.frame_id ;
               marker.header.stamp = ros::Time();
               marker.ns = "cylinder_1";
               marker.id = 0;
               marker.type = visualization_msgs::Marker::CYLINDER;
               marker.action = visualization_msgs::Marker::ADD;
//               std::cout<<"center 1 " << center(0) << std::endl;
//               marker.pose.position.x = center(0);
//               marker.pose.position.y = center(1);
//               marker.pose.position.z = center(2);
//           //    marker.pose.orientation.x =  cylinders_coefficients[0]->values[3];
//           //    marker.pose.orientation.y = cylinders_coefficients[0]->values[4];
//           //    marker.pose.orientation.z = cylinders_coefficients[0]->values[5];
//               double angle_x = cylinders_coefficients[0] -> values[3];
//               double angle_y = cylinders_coefficients[0] -> values[4];
//               double angle_z = cylinders_coefficients[0] -> values[5];
//               marker.pose.orientation = tf::createQuaternionMsgFromRollPitchYaw(atan2(angle_y,angle_z),atan2(sqrt(angle_y*angle_y+angle_z*angle_z),angle_x),0.);
//               marker.scale.x = 0.2;
//               marker.scale.y = 0.2;
//               marker.scale.z = 0.2;
//               marker.color.r = 0.0f;
//               marker.color.g = 1.0f;
//               marker.color.b = 0.0f;
//               marker.color.a = 1.;

                PointT maxPointOnAxis;
                PointT minPointOnAxis;

                PointT pointOnAxis(cylinders_coefficients[0]->values[0],cylinders_coefficients[0]->values[1],cylinders_coefficients[0]->values[2]);
                tf::Vector3 axis_vector(cylinders_coefficients[0]->values[3],cylinders_coefficients[0]->values[4],cylinders_coefficients[0]->values[5]);
                double height = 0.;
                height = get_cylinder_height(cloud_cylinders[0],&maxPointOnAxis,&minPointOnAxis,cylinders_coefficients[0]);

                tf::Vector3 up_vector(0.,0.,1.);
                tf::Vector3 right_vector = axis_vector.cross(up_vector);
                right_vector.normalize();
                tf::Quaternion q(right_vector, -1.0*acos(axis_vector.dot((up_vector))));
                q.normalize();
                geometry_msgs::Quaternion cylinder_orientation;
                geometry_msgs::Point cylinder_position;
                geometry_msgs::Pose label_pose;
                label_pose.orientation.w = 1.0;

                tf::quaternionTFToMsg(q, cylinder_orientation);
                cylinder_position.x=(maxPointOnAxis.x+minPointOnAxis.x)/2.0;
                cylinder_position.y=(maxPointOnAxis.y+minPointOnAxis.y)/2.0;
                cylinder_position.z=(maxPointOnAxis.z+minPointOnAxis.z)/2.0;

                label_pose.position.x=maxPointOnAxis.x;
                label_pose.position.y=maxPointOnAxis.y;
                label_pose.position.z=maxPointOnAxis.z+0.30;
                marker.scale.x = cylinders_coefficients[0] -> values[6]*2.0;
                marker.scale.y = cylinders_coefficients[0] -> values[6]*2.0;
                marker.scale.z = height;
                marker.color.g = 0.5;
                marker.color.r = 0.5;
                marker.color.b = 0.0;
                marker.color.a = 0.8;
                marker.pose.orientation=cylinder_orientation;
                marker.pose.position=cylinder_position;
                marker.lifetime = ros::Duration(10);

             }
                 marker_pub.publish(marker);

               test_pub.publish(cloud_concatene);

     // Fin test
}

int main (int argc, char** argv)
{
   ros::init(argc, argv, "cylinder_seg");
   ros::NodeHandle nh;
   ros::NodeHandle r;

   marker_pub = r.advertise<visualization_msgs::Marker>("Marker",1);
   test_pub = r.advertise<PointCloud>("cylinder",1);
   pose_pub =  r.advertise<geometry_msgs::PoseStamped>("pose",           0);
 ros::Subscriber sub = nh.subscribe("chatter", 1, imagecallback);
   ros::spin();
   return (0);
}
