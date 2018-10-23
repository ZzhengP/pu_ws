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


typedef pcl::PointCloud<pcl::PointXYZ> PointCloud;
using namespace std;
ros::Publisher test_pub;   // déclarer publish en global pour utiliser les donnés dans main fonction
pcl::PointCloud<pcl::PointXYZ>::Ptr Ref_cloud (new pcl::PointCloud<pcl::PointXYZ>);
pcl::PCDReader reader;
int distance_1(0);
int distance_2(0);

void callback(const sensor_msgs::PointCloud2ConstPtr& cloud_ros){


   pcl::PointCloud<pcl::PointXYZ>::Ptr cloud (new pcl::PointCloud<pcl::PointXYZ>);
   pcl::fromROSMsg(*cloud_ros,*cloud);

 //  pcl::PointIndices::Ptr fInliers(new pcl::PointIndices);
 //  pcl::ExtractIndices<pcl::PointXYZ> extract;
 //  extract.setInputCloud(cloud_ros);
 //  extract.setIndices(fInliers);
 //  extract.setNegative(true);
 //  extract.filter(*cloud_ros);


   pcl::PointCloud<pcl::PointXYZ>::Ptr Different_point (new pcl::PointCloud<pcl::PointXYZ>);

   int size(cloud->size());

   for (int i(0); i <size; i++ )
      {
         distance_1 = sqrt(pow(Ref_cloud->points[i].x, 2) + pow(Ref_cloud->points[i].y, 2) + pow(Ref_cloud -> points[i].z, 2));
         distance_2 = sqrt( pow(cloud->points[i].x, 2) + pow(cloud->points[i].y, 2) + pow(cloud -> points[i].z, 2));

         if(abs(distance_1 - distance_2)> 0.005 )
            Different_point->push_back(cloud->points[i]);
}

   std::cout <<"Point extrait" << Different_point->size() <<"\n";
   Different_point->header.frame_id = "camera_depth_optical_frame";
   test_pub.publish(Different_point);
}


int main(int argc, char** argv)
{
   ros::init(argc,argv, "background_extraction");
   ros::NodeHandle nh;
   ros::NodeHandle r;
   reader.read ("Reference_frame.pcd", *Ref_cloud);


   test_pub = r.advertise<PointCloud>("chatter",1000);
   ros::Subscriber sub = nh.subscribe("camera/depth/points", 1000, callback);
   ros::spin();
   return(0);
}
