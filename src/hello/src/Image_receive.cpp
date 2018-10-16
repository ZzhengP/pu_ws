#include "ros/ros.h"
#include <image_transport/image_transport.h>
#include <opencv2/highgui/highgui.hpp>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/Image.h>
#include <std_msgs/String.h>
#include <sensor_msgs/PointCloud2.h>

#include <ros/ros.h>
#include <pcl_ros/point_cloud.h>
#include <pcl/point_types.h>
#include <boost/foreach.hpp>

typedef pcl::PointCloud<pcl::PointXYZ> PointCloud;

void callback(const PointCloud::ConstPtr& msg)
{
  printf ("Cloud: width = %d, height = %d\n", msg->width, msg->height);
  BOOST_FOREACH (const pcl::PointXYZ& pt, msg->points)
  printf ("\t(%f, %f, %f)\n", pt.x, pt.y, pt.z);
}



int main(int argc, char** argv)
{
  ros::init(argc, argv, "sub_pcl");
  ros::NodeHandle nh;
  ros::Subscriber sub = nh.subscribe<PointCloud>("/camera/depth/points", 1, callback);
  ros::spin();


}

//void depthToCV8UC1(const cv::Mat& float_img, cv::Mat& mono8_img){
//  //Process images
//  if(mono8_img.rows != float_img.rows || mono8_img.cols != float_img.cols){
//    mono8_img = cv::Mat(float_img.size(), CV_8UC1);}
//  cv::convertScaleAbs(float_img, mono8_img, 100, 0.0);
//}

//void imageCallback(const sensor_msgs::ImageConstPtr& msg)
//{
//   cv_bridge::CvImagePtr cv_ptr;

//   try
//   {
//      cv_ptr = cv_bridge::toCvCopy(msg);
//      cv::imshow("view", cv_bridge::toCvShare(msg,"bgr8")->image);
//      cv::waitKey(30);
//   }

//   catch (cv_bridge::Exception& e)
//   {
//      ROS_ERROR("could not convert from '%s' to 'bgr8'.", msg->encoding.c_str());
//   }
//   catch (cv_bridge::Exception& e)
//   {
//       //if there is an error during conversion, display it
//       ROS_ERROR("tutorialROSOpenCV::main.cpp::cv_bridge exception: %s", e.what());
//       return;
//   }

//   //Copy the image.data to imageBuf.
//   cv::Mat depth_float_img = cv_ptr->image;
//   cv::Mat depth_mono8_img;
//   depthToCV8UC1(depth_float_img, depth_mono8_img);
//}

//int main(int argc, char **argv)
//{
//   ros::init(argc,argv,"image_listener");
//   ros::NodeHandle nh;
//   cv::namedWindow("view");
//   cv::startWindowThread();
//   image_transport::ImageTransport it(nh);
//   image_transport::Subscriber sub = it.subscribe("/camera/depth/image", 1, imageCallback);
//   ros::spin();
//   cv::destroyWindow("view");
//}
