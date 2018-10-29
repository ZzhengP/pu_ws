#include <pcl/point_cloud.h>
#include <pcl/octree/octree_pointcloud_changedetector.h>
#include <iostream>
#include <vector>
#include <ctime>

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
#include <pcl_conversions/pcl_conversions.h>
#include <pcl_ros/point_cloud.h>

#include <pcl/filters/voxel_grid.h>

typedef pcl::PointCloud<pcl::PointXYZ> PointCloud;
using namespace std;
ros::Publisher test_pub;   // déclarer publish en global pour utiliser les donnés dans main fonction

int distance_1(0);
int distance_2(0);
float resolution = 0.5;

pcl::octree::OctreePointCloudChangeDetector<pcl::PointXYZ> octree (resolution);

void callback(const sensor_msgs::PointCloud2ConstPtr& cloud_ros){

   pcl::PointCloud<pcl::PointXYZ>::Ptr cloud (new pcl::PointCloud<pcl::PointXYZ>);
   pcl::fromROSMsg(*cloud_ros,*cloud);

   srand ((unsigned int) time (NULL));
   pcl::PointCloud<pcl::PointXYZ>::Ptr Ref_cloud (new pcl::PointCloud<pcl::PointXYZ>);
   pcl::PCDReader reader;
   reader.read ("Reference_frame.pcd", *Ref_cloud);
   // Add points from Reference frame to octree
   std::cout<<"Ref cloud size "<<Ref_cloud->size() <<"\n";
   octree.setInputCloud(Ref_cloud);
   octree.addPointsFromInputCloud();

   // Switch octree buffers: This resets octree but keeps previous tree structure in memory.
   octree.switchBuffers ();

   // Octree resolution - side length of octree voxels

   // Instantiate octree-based point cloud change detection class



   std::cout<<" cloud size "<<cloud->size() <<"\n";

   // Add points from ros msgs to octree
   octree.setInputCloud(cloud);
   octree.addPointsFromInputCloud();

   std::vector<int> newPointIdxVector;
   octree.getPointIndicesFromNewVoxels(newPointIdxVector);

   std::cout<<"Output from getPointIndicesFromNewVoxels" << std::endl;
   pcl::PointCloud<pcl::PointXYZ>::Ptr Different_point (new pcl::PointCloud<pcl::PointXYZ>);
   pcl::PointCloud<pcl::PointXYZ>::Ptr output (new pcl::PointCloud<pcl::PointXYZ>);

   for(size_t i=0; i < newPointIdxVector.size();i++)
      {
      Different_point->push_back(cloud->points[newPointIdxVector[i]]);
      }

   Different_point->header.frame_id = "camera_depth_optical_frame";
   pcl::VoxelGrid<pcl::PointXYZ> sor;

   sor.setInputCloud (Different_point);
   sor.setLeafSize (0.01f, 0.01f, 0.01f);
   sor.filter (*output);
   std::cout <<"Point extrait avant filtre " << Different_point->size() <<"\n";
   std::cout <<"Point extrait après filtre " << output->size() <<"\n";

   test_pub.publish(Different_point);
   octree.deleteCurrentBuffer();
   octree.deletePreviousBuffer();
}



int main (int argc, char** argv)
{


   ros::init(argc,argv, "background_extraction");
   ros::NodeHandle nh;
   ros::NodeHandle r;



   test_pub = r.advertise<PointCloud>("chatter",10);
   ros::Subscriber sub = nh.subscribe("camera/depth/points", 10, callback);
   ros::spin();
   return(0);

}
