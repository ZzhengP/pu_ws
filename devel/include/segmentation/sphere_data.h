// Generated by gencpp from file segmentation/sphere_data.msg
// DO NOT EDIT!


#ifndef SEGMENTATION_MESSAGE_SPHERE_DATA_H
#define SEGMENTATION_MESSAGE_SPHERE_DATA_H


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
struct sphere_data_
{
  typedef sphere_data_<ContainerAllocator> Type;

  sphere_data_()
    : sphere_data()  {
    }
  sphere_data_(const ContainerAllocator& _alloc)
    : sphere_data(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _sphere_data_type;
  _sphere_data_type sphere_data;





  typedef boost::shared_ptr< ::segmentation::sphere_data_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::segmentation::sphere_data_<ContainerAllocator> const> ConstPtr;

}; // struct sphere_data_

typedef ::segmentation::sphere_data_<std::allocator<void> > sphere_data;

typedef boost::shared_ptr< ::segmentation::sphere_data > sphere_dataPtr;
typedef boost::shared_ptr< ::segmentation::sphere_data const> sphere_dataConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::segmentation::sphere_data_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::segmentation::sphere_data_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::segmentation::sphere_data_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::segmentation::sphere_data_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::segmentation::sphere_data_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::segmentation::sphere_data_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::segmentation::sphere_data_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::segmentation::sphere_data_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::segmentation::sphere_data_<ContainerAllocator> >
{
  static const char* value()
  {
    return "a9caba4b187ed22cae60b5d45f11e3f1";
  }

  static const char* value(const ::segmentation::sphere_data_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xa9caba4b187ed22cULL;
  static const uint64_t static_value2 = 0xae60b5d45f11e3f1ULL;
};

template<class ContainerAllocator>
struct DataType< ::segmentation::sphere_data_<ContainerAllocator> >
{
  static const char* value()
  {
    return "segmentation/sphere_data";
  }

  static const char* value(const ::segmentation::sphere_data_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::segmentation::sphere_data_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64[] sphere_data\n\
";
  }

  static const char* value(const ::segmentation::sphere_data_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::segmentation::sphere_data_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.sphere_data);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct sphere_data_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::segmentation::sphere_data_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::segmentation::sphere_data_<ContainerAllocator>& v)
  {
    s << indent << "sphere_data[]" << std::endl;
    for (size_t i = 0; i < v.sphere_data.size(); ++i)
    {
      s << indent << "  sphere_data[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.sphere_data[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // SEGMENTATION_MESSAGE_SPHERE_DATA_H