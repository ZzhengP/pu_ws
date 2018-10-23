#include <iostream>
#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include <pcl_ros/point_cloud.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl-1.7/pcl/point_cloud.h>
#include <pcl-1.7/pcl/PCLHeader.h>
#include "std_msgs/String.h"
#include "std_msgs/Float64MultiArray.h"
#include "Eigen/Core"
#include "Eigen/Geometry"
#include "geometry_msgs/PoseStamped.h"
#include "tf/transform_broadcaster.h"
#include <eigen_conversions/eigen_msg.h> // for use matrixEigenTomsg
using namespace std ;
bool got_kinect_image = false ;

pcl::PointCloud<pcl::PointXYZRGB>::Ptr pclKinect_clr_ptr(new pcl::PointCloud<pcl::PointXYZRGB>);
ros::Publisher test_pub;


void kinectCB(const sensor_msgs::PointCloud2ConstPtr& cloud){
   if(! got_kinect_image){
         ROS_INFO("got new selected image");
         pcl::fromROSMsg(*cloud,*pclKinect_clr_ptr);
         ROS_INFO("image has %d * %d points", pclKinect_clr_ptr->width, pclKinect_clr_ptr->height);
        // got_kinect_image = true ;
//         std_msgs::String msg;



         // // comment for instant
//         Eigen::MatrixXd A;
//         A.resize(pclKinect_clr_ptr->width*pclKinect_clr_ptr->height,3);
//         A.setZero(pclKinect_clr_ptr->width*pclKinect_clr_ptr->height,3);
//         std_msgs::Float64MultiArray Atest;
//         Atest.data.resize(pclKinect_clr_ptr->width*pclKinect_clr_ptr->height);
//         for (size_t i=0; i < pclKinect_clr_ptr->points.size();++i){
//               A(i,0)= pclKinect_clr_ptr->points[i].x;
//               A(i,1) = pclKinect_clr_ptr->points[i].y;
//               A(i,2) = pclKinect_clr_ptr->points[i].z;

}
//         tf::matrixEigenToMsg(A, Atest);
//         test_pub.publish(Atest);

      }

//}
// save a snapshot to file
int main(int argc, char **argv)
{
   ros::init(argc, argv, "pcl_snapshot_main");
   ros::NodeHandle nh;
   ros::NodeHandle r;

//   test_pub = r.advertise<std_msgs::Float64MultiArray>("chatter", 1000);   // comment this publisher for instants

   ros::Subscriber pointcloud_subscriber = nh.subscribe("/camera/depth/points",1,kinectCB);

   ros::spin();
   ros::Duration(0.5).sleep();

   ROS_INFO("waiting for kinect data");
//   while (!got_kinect_image){
//         ROS_INFO("waiting....");
//         ros::spinOnce();
//         ros::Duration(0.5).sleep();
//      }



   ROS_INFO("got snapshot; savint to file kinect_snapshot.pcd");
   pcl::io::savePCDFile("Reference_frame.pcd", *pclKinect_clr_ptr, true);



}


