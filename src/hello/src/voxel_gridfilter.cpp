#include <iostream>
#include <pcl/io/pcd_io.h>
#include <pcl/point_types.h>
#include <pcl/filters/voxel_grid.h>
#include <pcl_ros/point_cloud.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl-1.7/pcl/point_cloud.h>
#include <pcl-1.7/pcl/PCLHeader.h>
#include <Eigen/Core>
#include <Eigen/Geometry>
#include <geometry_msgs/PoseStamped.h>
#include <tf/transform_broadcaster.h>
#include <eigen_conversions/eigen_msg.h>
#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include "std_msgs/String.h"
#include "std_msgs/Float64MultiArray.h"


// // // Cette fonction a pour le but de réduire le nombre de point cloude puis publié ces nouveaux donnés dans un autre topic

bool got_kinect_image = false ;

ros::Publisher test_pub;   // déclarer publish en global pour utiliser les donnés dans main fonction


// callback fonction pour recevoir et traité les donnés
void imagecallback(const sensor_msgs::PointCloud2ConstPtr& cloud){


   // Déclarer les variables pour contenir les donnés points cloud
   pcl::PointCloud<pcl::PointXYZ>::Ptr pclKinect_clr_ptr(new pcl::PointCloud<pcl::PointXYZ>);
   pcl::PCLPointCloud2::Ptr pcl_kinect(new pcl::PCLPointCloud2());
   pcl::PointCloud<pcl::PointXYZ>::Ptr output(new pcl::PointCloud<pcl::PointXYZ>);
   pcl::fromROSMsg(*cloud,*pclKinect_clr_ptr);

//   pcl::toPCLPointCloud2(*pclKinect_clr_ptr,*pcl_kinect);


   // Filtrer les points
   std::cerr << "PointCloud before filtering: " << cloud->width * cloud->height
        << " data points (" << pcl::getFieldsList (*cloud) << ").";

   pcl::VoxelGrid<pcl::PointXYZ> sor;

   sor.setInputCloud (pclKinect_clr_ptr);
   sor.setLeafSize (0.01f, 0.01f, 0.01f);
   sor.filter (*output);

   std::cerr << "PointCloud after filtering: " << output->width * output->height
        << " data points (" << pcl::getFieldsList (*output) << ").";


   Eigen::MatrixXd A;
   A.resize(output->width*output->height,3);
   A.setZero(output->width*output->height,3);
   std_msgs::Float64MultiArray Atest;
   Atest.data.resize(output->width*output->height);
   for (size_t i=0; i < output->points.size();++i)
      {
        A(i,0)= output->points[i].x;
        A(i,1) = output->points[i].y;
        A(i,2) = output->points[i].z;
      }
   tf::matrixEigenToMsg(A, Atest);
   test_pub.publish(Atest);
}

main (int argc, char** argv)
{

   // Subscribe
   ros::init(argc, argv, "downsampling");
   ros::NodeHandle nh;
   ros::NodeHandle r;

   test_pub = r.advertise<std_msgs::Float64MultiArray>("chatter", 1000);

   ros::Subscriber pointcloud_subscriber = nh.subscribe("/camera/depth/points",1,imagecallback);

   ros::spin();
   return (0);





}
