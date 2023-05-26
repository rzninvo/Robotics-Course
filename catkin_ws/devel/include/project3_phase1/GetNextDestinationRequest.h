// Generated by gencpp from file project3_phase1/GetNextDestinationRequest.msg
// DO NOT EDIT!


#ifndef PROJECT3_PHASE1_MESSAGE_GETNEXTDESTINATIONREQUEST_H
#define PROJECT3_PHASE1_MESSAGE_GETNEXTDESTINATIONREQUEST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace project3_phase1
{
template <class ContainerAllocator>
struct GetNextDestinationRequest_
{
  typedef GetNextDestinationRequest_<ContainerAllocator> Type;

  GetNextDestinationRequest_()
    : current_x(0.0)
    , current_y(0.0)  {
    }
  GetNextDestinationRequest_(const ContainerAllocator& _alloc)
    : current_x(0.0)
    , current_y(0.0)  {
  (void)_alloc;
    }



   typedef double _current_x_type;
  _current_x_type current_x;

   typedef double _current_y_type;
  _current_y_type current_y;





  typedef boost::shared_ptr< ::project3_phase1::GetNextDestinationRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::project3_phase1::GetNextDestinationRequest_<ContainerAllocator> const> ConstPtr;

}; // struct GetNextDestinationRequest_

typedef ::project3_phase1::GetNextDestinationRequest_<std::allocator<void> > GetNextDestinationRequest;

typedef boost::shared_ptr< ::project3_phase1::GetNextDestinationRequest > GetNextDestinationRequestPtr;
typedef boost::shared_ptr< ::project3_phase1::GetNextDestinationRequest const> GetNextDestinationRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::project3_phase1::GetNextDestinationRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::project3_phase1::GetNextDestinationRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::project3_phase1::GetNextDestinationRequest_<ContainerAllocator1> & lhs, const ::project3_phase1::GetNextDestinationRequest_<ContainerAllocator2> & rhs)
{
  return lhs.current_x == rhs.current_x &&
    lhs.current_y == rhs.current_y;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::project3_phase1::GetNextDestinationRequest_<ContainerAllocator1> & lhs, const ::project3_phase1::GetNextDestinationRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace project3_phase1

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::project3_phase1::GetNextDestinationRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::project3_phase1::GetNextDestinationRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::project3_phase1::GetNextDestinationRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::project3_phase1::GetNextDestinationRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::project3_phase1::GetNextDestinationRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::project3_phase1::GetNextDestinationRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::project3_phase1::GetNextDestinationRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "687da78cc91ec402dff4256505312c80";
  }

  static const char* value(const ::project3_phase1::GetNextDestinationRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x687da78cc91ec402ULL;
  static const uint64_t static_value2 = 0xdff4256505312c80ULL;
};

template<class ContainerAllocator>
struct DataType< ::project3_phase1::GetNextDestinationRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "project3_phase1/GetNextDestinationRequest";
  }

  static const char* value(const ::project3_phase1::GetNextDestinationRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::project3_phase1::GetNextDestinationRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 current_x\n"
"float64 current_y\n"
;
  }

  static const char* value(const ::project3_phase1::GetNextDestinationRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::project3_phase1::GetNextDestinationRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.current_x);
      stream.next(m.current_y);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GetNextDestinationRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::project3_phase1::GetNextDestinationRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::project3_phase1::GetNextDestinationRequest_<ContainerAllocator>& v)
  {
    s << indent << "current_x: ";
    Printer<double>::stream(s, indent + "  ", v.current_x);
    s << indent << "current_y: ";
    Printer<double>::stream(s, indent + "  ", v.current_y);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PROJECT3_PHASE1_MESSAGE_GETNEXTDESTINATIONREQUEST_H
