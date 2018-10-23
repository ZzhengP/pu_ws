#include <iostream>
#include <pcl/ModelCoefficients.h>
#include <pcl/io/pcd_io.h>
#include <pcl/point_types.h>
#include <pcl/sample_consensus/method_types.h>
#include <pcl/sample_consensus/model_types.h>
#include <pcl/segmentation/sac_segmentation.h>
#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>

void callback(const sensor_msgs::PointCloud2ConstPtr& cloud)
{
   pcl::PointCloud<pcl::PointXYZ>::Ptr pcl_cloud(new pcl::PointCloud<pcl::PointXYZ>);
   pcl::fromROSMsg(*cloud,*pcl_cloud);

   pcl::ModelCoefficients::Ptr coefficients (new pcl::ModelCoefficients);
   pcl::PointIndices::Ptr inliers (new pcl::PointIndices);
   // Create the segmentation object
   pcl::SACSegmentation<pcl::PointXYZ> seg;
   // Optional
   seg.setOptimizeCoefficients (true);
   // Mandatory
   seg.setModelType (pcl::SACMODEL_PLANE);
   seg.setMethodType (pcl::SAC_RANSAC);
   seg.setDistanceThreshold (0.01);

   seg.setInputCloud (pcl_cloud);
   seg.segment (*inliers, *coefficients);

   if (inliers->indices.size () == 0)
   {
     PCL_ERROR ("Could not estimate a planar model for the given dataset.");
   }

   std::cerr << "Model coefficients: " << coefficients->values[0] << " "
                                       << coefficients->values[1] << " "
                                       << coefficients->values[2] << " "
                                       << coefficients->values[3] << std::endl;

   std::cerr << "Model inliers: " << inliers->indices.size () << std::endl;
   for (size_t i = 0; i < inliers->indices.size (); ++i)
     std::cerr << inliers->indices[i] << "    " << pcl_cloud->points[inliers->indices[i]].x << " "
                                                << pcl_cloud->points[inliers->indices[i]].y << " "
                                                << pcl_cloud->points[inliers->indices[i]].z << std::endl;

}


int main (int argc, char** argv)
{

   ros::init(argc, argv, "planar_segmentation");
   ros::NodeHandle nh;
   ros::NodeHandle r;


   ros::Subscriber pointcloud_subscriber = nh.subscribe("/camera/depth/points",1,callback);

   ros::spin();
   return (0);



  return (0);
}
