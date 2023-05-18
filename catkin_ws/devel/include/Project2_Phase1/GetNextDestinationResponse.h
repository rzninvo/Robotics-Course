// Generated by gencpp from file Project2_Phase1/GetNextDestinationResponse.msg
// DO NOT EDIT!


#ifndef PROJECT2_PHASE1_MESSAGE_GETNEXTDESTINATIONRESPONSE_H
#define PROJECT2_PHASE1_MESSAGE_GETNEXTDESTINATIONRESPONSE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace Project2_Phase1
{
template <class ContainerAllocator>
struct GetNextDestinationResponse_
{
  typedef GetNextDestinationResponse_<ContainerAllocator> Type;

  GetNextDestinationResponse_()
    : next_x(0.0)
    , next_y(0.0)  {
    }
  GetNextDestinationResponse_(const ContainerAllocator& _alloc)
    : next_x(0.0)
    , next_y(0.0)  {
  (void)_alloc;
    }



   typedef double _next_x_type;
  _next_x_type next_x;

   typedef double _next_y_type;
  _next_y_type next_y;





  typedef boost::shared_ptr< ::Project2_Phase1::GetNextDestinationResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::Project2_Phase1::GetNextDestinationResponse_<ContainerAllocator> const> ConstPtr;

}; // struct GetNextDestinationResponse_

typedef ::Project2_Phase1::GetNextDestinationResponse_<std::allocator<void> > GetNextDestinationResponse;

typedef boost::shared_ptr< ::Project2_Phase1::GetNextDestinationResponse > GetNextDestinationResponsePtr;
typedef boost::shared_ptr< ::Project2_Phase1::GetNextDestinationResponse const> GetNextDestinationResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::Project2_Phase1::GetNextDestinationResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::Project2_Phase1::GetNextDestinationResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::Project2_Phase1::GetNextDestinationResponse_<ContainerAllocator1> & lhs, const ::Project2_Phase1::GetNextDestinationResponse_<ContainerAllocator2> & rhs)
{
  return lhs.next_x == rhs.next_x &&
    lhs.next_y == rhs.next_y;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::Project2_Phase1::GetNextDestinationResponse_<ContainerAllocator1> & lhs, const ::Project2_Phase1::GetNextDestinationResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace Project2_Phase1

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::Project2_Phase1::GetNextDestinationResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::Project2_Phase1::GetNextDestinationResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::Project2_Phase1::GetNextDestinationResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::Project2_Phase1::GetNextDestinationResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::Project2_Phase1::GetNextDestinationResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::Project2_Phase1::GetNextDestinationResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::Project2_Phase1::GetNextDestinationResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "88bcebe71e245d4153512a784d401c78";
  }

  static const char* value(const ::Project2_Phase1::GetNextDestinationResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x88bcebe71e245d41ULL;
  static const uint64_t static_value2 = 0x53512a784d401c78ULL;
};

template<class ContainerAllocator>
struct DataType< ::Project2_Phase1::GetNextDestinationResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Project2_Phase1/GetNextDestinationResponse";
  }

  static const char* value(const ::Project2_Phase1::GetNextDestinationResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::Project2_Phase1::GetNextDestinationResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 next_x\n"
"float64 next_y\n"
;
  }

  static const char* value(const ::Project2_Phase1::GetNextDestinationResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::Project2_Phase1::GetNextDestinationResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.next_x);
      stream.next(m.next_y);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GetNextDestinationResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::Project2_Phase1::GetNextDestinationResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::Project2_Phase1::GetNextDestinationResponse_<ContainerAllocator>& v)
  {
    s << indent << "next_x: ";
    Printer<double>::stream(s, indent + "  ", v.next_x);
    s << indent << "next_y: ";
    Printer<double>::stream(s, indent + "  ", v.next_y);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PROJECT2_PHASE1_MESSAGE_GETNEXTDESTINATIONRESPONSE_H