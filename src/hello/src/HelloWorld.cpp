#include <ros/ros.h>

int main(int argc, char **argv)
{
  ros::init(argc, argv, "HelloWorld");
  ros::NodeHandle nh;

  ROS_INFO("Hello world !");
}
