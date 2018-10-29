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

typedef pcl::PointXYZ PointT;

typedef pcl::PointCloud<pcl::PointXYZ> PointCloud;

ros::Publisher test_pub;   // déclarer publish en global pour utiliser les donnés dans main fonction
ros::Publisher marker_pub;
visualization_msgs::Marker marker;

void imagecallback(const sensor_msgs::PointCloud2ConstPtr& cloud_ros){

     pcl::NormalEstimation<PointT, pcl::Normal> ne;
     pcl::SACSegmentationFromNormals<PointT, pcl::Normal> seg;
     pcl::ExtractIndices<PointT> extract;
     pcl::ExtractIndices<pcl::Normal> extract_normals;
     pcl::search::KdTree<PointT>::Ptr tree (new pcl::search::KdTree<PointT> ());

     // Datasets
     pcl::PointCloud<PointT>::Ptr cloud (new pcl::PointCloud<PointT>);
     pcl::PointCloud<pcl::Normal>::Ptr cloud_normals (new pcl::PointCloud<pcl::Normal>);
     pcl::PointCloud<PointT>::Ptr cloud_filtered2 (new pcl::PointCloud<PointT>);
     pcl::PointCloud<pcl::Normal>::Ptr cloud_normals2 (new pcl::PointCloud<pcl::Normal>);
     pcl::ModelCoefficients::Ptr coefficients_plane (new pcl::ModelCoefficients), coefficients_cylinder (new pcl::ModelCoefficients);
     pcl::PointIndices::Ptr inliers_plane (new pcl::PointIndices), inliers_cylinder (new pcl::PointIndices);

     // Read in the cloud data
     pcl::fromROSMsg(*cloud_ros, *cloud);

     std::cout <<"Taille des donnés entrés \n" << cloud->size() <<std::endl;
     // Estimate point normals
     ne.setSearchMethod (tree);
     ne.setInputCloud (cloud);
     ne.setKSearch (50);
     ne.compute (*cloud_normals);
     pcl::PCDWriter writer;

     // Create the segmentation object for the planar model and set all the parameters
     seg.setOptimizeCoefficients (true);
     seg.setModelType (pcl::SACMODEL_NORMAL_PLANE);
     seg.setNormalDistanceWeight (0.1);
     seg.setMethodType (pcl::SAC_RANSAC);
     seg.setMaxIterations (100);
     seg.setDistanceThreshold (0.03);
     seg.setInputCloud (cloud);
     seg.setInputNormals (cloud_normals);
     // Obtain the plane inliers and coefficients
     seg.segment (*inliers_plane, *coefficients_plane);

     // Extract the planar inliers from the input cloud
     extract.setInputCloud (cloud);
     extract.setIndices (inliers_plane);
     extract.setNegative (false);

//     // Write the planar inliers to disk
     pcl::PointCloud<PointT>::Ptr cloud_plane (new pcl::PointCloud<PointT> ());
     extract.filter (*cloud_plane);
     std::cerr << "PointCloud representing the planar component: " << cloud_plane->points.size () << " data points." << std::endl;
    //  writer.write("cylindre_plance.pcd",*cloud_plane,false);
     // Remove the planar inliers, extract the rest
     extract.setNegative (true);
     extract.filter (*cloud_filtered2);
     extract_normals.setNegative (true);
     extract_normals.setInputCloud (cloud_normals);
     extract_normals.setIndices (inliers_plane);
     extract_normals.filter (*cloud_normals2);
     cloud_filtered2->header.frame_id =  "camera_depth_optical_frame";

     // Create the segmentation object for cylinder segmentation and set all the parameters
     seg.setOptimizeCoefficients (true);
     seg.setModelType (pcl::SACMODEL_CYLINDER);
     seg.setMethodType (pcl::SAC_RANSAC);
     seg.setNormalDistanceWeight (0.1);
     seg.setMaxIterations (10000);
     seg.setDistanceThreshold (0.15);
     seg.setRadiusLimits (0, 0.1);
     seg.setInputCloud (cloud);
     seg.setInputNormals (cloud_normals);

     // Obtain the cylinder inliers and coefficients
     seg.segment (*inliers_cylinder, *coefficients_cylinder);
     std::cerr << "Cylinder coefficients: " << *coefficients_cylinder << std::endl;
//     marker.pose.position.x = coefficients_cylinder->values[0];
//     marker.pose.position.y = coefficients_cylinder->values[1];
//     marker.pose.position.z = coefficients_cylinder->values[2];
//     marker.pose.orientation.x = coefficients_cylinder->values[3];
//     marker.pose.orientation.y = coefficients_cylinder->values[4];
//     marker.pose.orientation.z = coefficients_cylinder->values[5];
//     marker.pose.orientation.w = 1.;
//     marker.scale.x = coefficients_cylinder->values[6];
//     marker.scale.y = coefficients_cylinder->values[6];
//     marker.scale.z = coefficients_cylinder->values[6];

     // Write the cylinder inliers to disk
     extract.setInputCloud (cloud_filtered2);
     extract.setIndices (inliers_cylinder);
     extract.setNegative (false);
     pcl::PointCloud<PointT>::Ptr cloud_cylinder (new pcl::PointCloud<PointT> ());
     extract.filter (*cloud_cylinder);


     cloud_cylinder->header.frame_id =  "camera_depth_optical_frame";
     test_pub.publish(cloud_cylinder);
   //  marker_pub.publish(marker);

}


int main (int argc, char** argv)
{
   ros::init(argc, argv, "cylinder_seg");
   ros::NodeHandle nh;
   ros::NodeHandle r;
   ros::NodeHandle marker_nh;
   marker.header.frame_id = "camera_depth_optical_frame";
   marker.header.stamp = ros::Time::now();
   marker.id = 0;
   marker.type = visualization_msgs::Marker::CYLINDER;
   test_pub = r.advertise<PointCloud>("cylinder",10);
  // marker_pub = marker_nh.advertise<visualization_msgs::Marker>("Marker",100);
   ros::Subscriber sub = nh.subscribe("chatter", 10, imagecallback);
   ros::spin();
   return (0);
}
