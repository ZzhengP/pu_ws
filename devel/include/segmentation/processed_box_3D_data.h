// Generated by gencpp from file segmentation/processed_box_3D_data.msg
// DO NOT EDIT!


#ifndef SEGMENTATION_MESSAGE_PROCESSED_BOX_3D_DATA_H
#define SEGMENTATION_MESSAGE_PROCESSED_BOX_3D_DATA_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace segmentation
{
template <class ContainerAllocator>
struct processed_box_3D_data_
{
  typedef processed_box_3D_data_<ContainerAllocator> Type;

  processed_box_3D_data_()
    : center()
    , longestEdgeLen(0.0)
    , medianEdgeLen(0.0)
    , shortestEdgeLen(0.0)
    , longestEdgeDir()
    , medianEdgeDir()
    , shortestEdgeDir()  {
    }
  processed_box_3D_data_(const ContainerAllocator& _alloc)
    : center(_alloc)
    , longestEdgeLen(0.0)
    , medianEdgeLen(0.0)
    , shortestEdgeLen(0.0)
    , longestEdgeDir(_alloc)
    , medianEdgeDir(_alloc)
    , shortestEdgeDir(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _center_type;
  _center_type center;

   typedef double _longestEdgeLen_type;
  _longestEdgeLen_type longestEdgeLen;

   typedef double _medianEdgeLen_type;
  _medianEdgeLen_type medianEdgeLen;

   typedef double _shortestEdgeLen_type;
  _shortestEdgeLen_type shortestEdgeLen;

   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _longestEdgeDir_type;
  _longestEdgeDir_type longestEdgeDir;

   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _medianEdgeDir_type;
  _medianEdgeDir_type medianEdgeDir;

   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _shortestEdgeDir_type;
  _shortestEdgeDir_type shortestEdgeDir;





  typedef boost::shared_ptr< ::segmentation::processed_box_3D_data_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::segmentation::processed_box_3D_data_<ContainerAllocator> const> ConstPtr;

}; // struct processed_box_3D_data_

typedef ::segmentation::processed_box_3D_data_<std::allocator<void> > processed_box_3D_data;

typedef boost::shared_ptr< ::segmentation::processed_box_3D_data > processed_box_3D_dataPtr;
typedef boost::shared_ptr< ::segmentation::processed_box_3D_data const> processed_box_3D_dataConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::segmentation::processed_box_3D_data_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::segmentation::processed_box_3D_data_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace segmentation

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'segmentation': ['/home/zheng/pu_ws/src/segmentation/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::segmentation::processed_box_3D_data_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::segmentation::processed_box_3D_data_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::segmentation::processed_box_3D_data_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::segmentation::processed_box_3D_data_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::segmentation::processed_box_3D_data_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::segmentation::processed_box_3D_data_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::segmentation::processed_box_3D_data_<ContainerAllocator> >
{
  static const char* value()
  {
    return "4ef979cbe8c870ca365c89208698d6f7";
  }

  static const char* value(const ::segmentation::processed_box_3D_data_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x4ef979cbe8c870caULL;
  static const uint64_t static_value2 = 0x365c89208698d6f7ULL;
};

template<class ContainerAllocator>
struct DataType< ::segmentation::processed_box_3D_data_<ContainerAllocator> >
{
  static const char* value()
  {
    return "segmentation/processed_box_3D_data";
  }

  static const char* value(const ::segmentation::processed_box_3D_data_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::segmentation::processed_box_3D_data_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64[] center\n\
float64 longestEdgeLen\n\
float64 medianEdgeLen\n\
float64 shortestEdgeLen\n\
float64[] longestEdgeDir\n\
float64[] medianEdgeDir\n\
float64[] shortestEdgeDir\n\
";
  }

  static const char* value(const ::segmentation::processed_box_3D_data_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::segmentation::processed_box_3D_data_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.center);
      stream.next(m.longestEdgeLen);
      stream.next(m.medianEdgeLen);
      stream.next(m.shortestEdgeLen);
      stream.next(m.longestEdgeDir);
      stream.next(m.medianEdgeDir);
      stream.next(m.shortestEdgeDir);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct processed_box_3D_data_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::segmentation::processed_box_3D_data_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::segmentation::processed_box_3D_data_<ContainerAllocator>& v)
  {
    s << indent << "center[]" << std::endl;
    for (size_t i = 0; i < v.center.size(); ++i)
    {
      s << indent << "  center[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.center[i]);
    }
    s << indent << "longestEdgeLen: ";
    Printer<double>::stream(s, indent + "  ", v.longestEdgeLen);
    s << indent << "medianEdgeLen: ";
    Printer<double>::stream(s, indent + "  ", v.medianEdgeLen);
    s << indent << "shortestEdgeLen: ";
    Printer<double>::stream(s, indent + "  ", v.shortestEdgeLen);
    s << indent << "longestEdgeDir[]" << std::endl;
    for (size_t i = 0; i < v.longestEdgeDir.size(); ++i)
    {
      s << indent << "  longestEdgeDir[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.longestEdgeDir[i]);
    }
    s << indent << "medianEdgeDir[]" << std::endl;
    for (size_t i = 0; i < v.medianEdgeDir.size(); ++i)
    {
      s << indent << "  medianEdgeDir[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.medianEdgeDir[i]);
    }
    s << indent << "shortestEdgeDir[]" << std::endl;
    for (size_t i = 0; i < v.shortestEdgeDir.size(); ++i)
    {
      s << indent << "  shortestEdgeDir[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.shortestEdgeDir[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // SEGMENTATION_MESSAGE_PROCESSED_BOX_3D_DATA_H