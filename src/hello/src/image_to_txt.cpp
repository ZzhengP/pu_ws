#include <iostream>
#include <pcl/io/pcd_io.h>
#include <pcl/point_types.h>

using namespace std;
int main(int argc, char** argv){

   pcl::PointCloud<pcl::PointXYZ>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZ>);
   if (pcl::io::loadPCDFile<pcl::PointXYZ> (argv[1],*cloud)==-1)
      {
         PCL_ERROR ("couldn't read file kinect_snapshot.pcd \n");
         return -1 ;

      }
   std::cout << "Laoded"
             << cloud->width * cloud -> height
             << "data points from test_pcd.pcd with the following fields:"
             << std::endl;

   std::ofstream f("/home/zheng/Desktop/PCL_data.txt");

   for (size_t i=0; i < cloud->points.size();++i){
      std::cout<<"   "<<cloud->points[i].x
                 <<"   "<<cloud->points[i].y
                <<"   "<<cloud->points[i].z<<std::endl;

      f << cloud->points[i] << endl;
}
}
