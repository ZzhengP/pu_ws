#include <pcl/ModelCoefficients.h>
#include <pcl/io/pcd_io.h>
#include <pcl/point_types.h>
#include <pcl/filters/extract_indices.h>
#include <pcl/filters/passthrough.h>
#include <pcl/features/normal_3d.h>
#include <pcl/sample_consensus/method_types.h>
#include <pcl/sample_consensus/model_types.h>
#include <pcl/segmentation/sac_segmentation.h>
#include <eigen_conversions/eigen_msg.h>
#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include "std_msgs/String.h"
#include "std_msgs/Float64MultiArray.h"
#include <iostream>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl_ros/point_cloud.h>
typedef pcl::PointXYZ PointT;

typedef pcl::PointCloud<pcl::PointXYZ> PointCloud;

ros::Publisher test_pub;   // déclarer publish en global pour utiliser les donnés dans main fonction

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
   pcl::PointCloud<PointT>::Ptr cloud_filtered (new pcl::PointCloud<PointT>);
   pcl::PointCloud<pcl::Normal>::Ptr cloud_normals (new pcl::PointCloud<pcl::Normal>);
   pcl::PointCloud<PointT>::Ptr cloud_filtered2 (new pcl::PointCloud<PointT>);
   pcl::PointCloud<pcl::Normal>::Ptr cloud_normals2 (new pcl::PointCloud<pcl::Normal>);
   pcl::ModelCoefficients::Ptr coefficients_plane (new pcl::ModelCoefficients), coefficients_cylinder (new pcl::ModelCoefficients);
   pcl::PointIndices::Ptr inliers_plane (new pcl::PointIndices), inliers_cylinder (new pcl::PointIndices);

   // Read in the cloud data
   pcl::fromROSMsg(*cloud_ros,*cloud);
   std::cerr << "PointCloud has: " << cloud->points.size () << " data points." << std::endl;

   // Build a passthrough filter to remove spurious NaNs
   pass.setInputCloud (cloud);
   pass.setFilterFieldName ("z");
   pass.setFilterLimits (0, 5);
   pass.filter (*cloud_filtered);
   std::cerr << "PointCloud after filtering has: " << cloud_filtered->points.size () << " data points." << std::endl;

   // Estimate point normals
   ne.setSearchMethod (tree);
   ne.setInputCloud (cloud_filtered);
   ne.setKSearch (50);
   ne.compute (*cloud_normals);

   // Create the segmentation object for the planar model and set all the parameters
   seg.setOptimizeCoefficients (true);
   seg.setModelType (pcl::SACMODEL_NORMAL_PLANE);
   seg.setNormalDistanceWeight (0.1);
   seg.setMethodType (pcl::SAC_RANSAC);
   seg.setMaxIterations (100);
   seg.setDistanceThreshold (0.03);
   seg.setInputCloud (cloud_filtered);
   seg.setInputNormals (cloud_normals);
   // Obtain the plane inliers and coefficients
   seg.segment (*inliers_plane, *coefficients_plane);
 //  std::cerr << "Plane coefficients: " << *coefficients_plane << std::endl;

   // Extract the planar inliers from the input cloud
   extract.setInputCloud (cloud_filtered);
   extract.setIndices (inliers_plane);
   extract.setNegative (false);

   // Write the planar inliers to disk
   pcl::PointCloud<PointT>::Ptr cloud_plane (new pcl::PointCloud<PointT> ());
   extract.filter (*cloud_plane);
   //std::cerr << "PointCloud representing the planar component: " << cloud_plane->points.size () << " data points." << std::endl;
 //  writer.write ("kinect.pcd", *cloud_plane, false);

   // Remove the planar inliers, extract the rest
   extract.setNegative (true);
   extract.filter (*cloud_filtered2);
   extract_normals.setNegative (true);
   extract_normals.setInputCloud (cloud_normals);
   extract_normals.setIndices (inliers_plane);
   extract_normals.filter (*cloud_normals2);

   // Create the segmentation object for cylinder segmentation and set all the parameters
   seg.setOptimizeCoefficients (true);
   seg.setModelType (pcl::SACMODEL_CYLINDER);
   seg.setMethodType (pcl::SAC_RANSAC);
   seg.setNormalDistanceWeight (0.1);
   seg.setMaxIterations (10000);
   seg.setDistanceThreshold (0.5);
   seg.setRadiusLimits (0, 0.5);
   seg.setInputCloud (cloud_filtered2);
   seg.setInputNormals (cloud_normals2);

   // Obtain the cylinder inliers and coefficients
   seg.segment (*inliers_cylinder, *coefficients_cylinder);
   std::cerr << "Cylinder coefficients: " << *coefficients_cylinder << std::endl;

   // Write the cylinder inliers to disk
   extract.setInputCloud (cloud_filtered2);
   extract.setIndices (inliers_cylinder);
   extract.setNegative (false);
   pcl::PointCloud<PointT>::Ptr cloud_cylinder (new pcl::PointCloud<PointT> ());
   extract.filter (*cloud_cylinder);
   if (cloud_cylinder->points.empty ())
     std::cerr << "Can't find the cylindrical component." << std::endl;
   else
   {
     std::cerr << "PointCloud representing the cylindrical component: " << cloud_cylinder->points.size () << " data points." << std::endl;
     //writer.write ("kinect_cylinder.pcd", *cloud_cylinder, false);
     cloud_cylinder->header.frame_id = "camera_depth_optical_frame";
  //   cloud_cylinder->height = cloud_cylinder->width = 1;
     test_pub.publish(cloud_cylinder);
   }

}


int main (int argc, char** argv)
{
   ros::init(argc, argv, "cylinder_seg");
   ros::NodeHandle nh;
   ros::NodeHandle r;
   test_pub = r.advertise<PointCloud>("cylinder",1000);
   ros::Subscriber sub = nh.subscribe("chatter", 1000, imagecallback);
   ros::spin();
   return (0);
}
