cmake_minimum_required(VERSION 2.8.3)
project(hello)

catkin_package(
  INCLUDE_DIRS include
  LIBRARIES hello
  CATKIN_DEPENDS roscpp
#  DEPENDS system_lib
)

find_package(catkin REQUIRED COMPONENTS
    cv_bridge
    roscpp
    image_transport
    sensor_msgs
    std_msgs
    )
find_package(Eigen3 QUIET)
find_package(Eigen3 3.2.92 QUIET)
set(OpenCV_DIR "/usr/include/opencv")
find_package(OpenCV REQUIRED COMPONENTS core imgproc highgui)
find_package(PCL 1.7 REQUIRED COMPONENTS)
INCLUDE_DIRECTORIES(${OpenCV_INCLUDE_DIRS})
###########
## Build ##
###########

## Specify additional locations of header files
## Your package locations should be listed before other locations
include_directories(
 include
  ${catkin_INCLUDE_DIRS}
)
include_directories(${PCL_INCLUDE_DIRS})
link_directories(${PCL_LIBRARY_DIRS})
add_definitions(${PCL_DEFINITIONS})
 add_executable(Image_receive src/Image_receive.cpp)

add_executable(plc_writetofile   src/plc_writetofile.cpp)
add_executable(image_to_txt src/image_to_txt.cpp)
add_executable(pcl_view src/pcl_view.cpp)
add_executable(voxel_filter src/voxel_gridfilter.cpp)
add_executable(pu_test src/pu_test.cpp)

target_link_libraries(pu_test ${catkin_LIBRARIES})
target_link_libraries(voxel_filter ${catkin_LIBRARIES} ${PCL_LIBRARIES})
target_link_libraries(pcl_view    ${PCL_LIBRARIES})
target_link_libraries(image_to_txt    ${PCL_LIBRARIES})
target_link_libraries(plc_writetofile ${catkin_LIBRARIES}
   ${PCL_LIBRARIES}
   )

target_link_libraries(Image_receive
  ${catkin_LIBRARIES} ${OpenCV_LIBS}
  ${PCL_COMMON_LIBRARIES} ${PCL_IO_LIBRARIES}
)

#############
## Install ##
#############


