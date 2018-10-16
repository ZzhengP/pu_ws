
#include "ros/ros.h"
#include "std_msgs/String.h"
#include "std_msgs/Float64MultiArray.h"
#include "Eigen/Core"
using namespace std;
void chatterCallback(const std_msgs::Float64MultiArray& Adata)
{
      Eigen::MatrixXd A(Adata.data.size()/3,3);
     for (int i=0; i < Adata.data.size()/3; i++){
           A(i,0) = Adata.data[3*i];   // data*2, car dans data les donnés sont classé dans un seul vecteur,
                                    //parcout d'abord toute la colonne
           A(i,1) = Adata.data[3*i+1];
           A(i,2) = Adata.data[3*i+2];
}
         for (int i=0; i < A.rows(); i++){
               if (A(i,2)< 0.7)
                  {
                     std::cout <<"distance inférieur à 0.7 mètre \n" << A(i,2)<< "à position"<<i<<std::endl;

                  }
            }
}

int main(int argc, char **argv)
{
   ros::init(argc, argv, "test");
   ros::NodeHandle nh;

   ros::Subscriber sub = nh.subscribe("chatter", 1000, chatterCallback);

   ros::spin();

   return 0;
}
