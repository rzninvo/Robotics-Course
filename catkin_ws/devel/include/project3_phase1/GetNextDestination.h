// Generated by gencpp from file project3_phase1/GetNextDestination.msg
// DO NOT EDIT!


#ifndef PROJECT3_PHASE1_MESSAGE_GETNEXTDESTINATION_H
#define PROJECT3_PHASE1_MESSAGE_GETNEXTDESTINATION_H

#include <ros/service_traits.h>


#include <project3_phase1/GetNextDestinationRequest.h>
#include <project3_phase1/GetNextDestinationResponse.h>


namespace project3_phase1
{

struct GetNextDestination
{

typedef GetNextDestinationRequest Request;
typedef GetNextDestinationResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct GetNextDestination
} // namespace project3_phase1


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::project3_phase1::GetNextDestination > {
  static const char* value()
  {
    return "09f8b596f17567f03b1180688311653f";
  }

  static const char* value(const ::project3_phase1::GetNextDestination&) { return value(); }
};

template<>
struct DataType< ::project3_phase1::GetNextDestination > {
  static const char* value()
  {
    return "project3_phase1/GetNextDestination";
  }

  static const char* value(const ::project3_phase1::GetNextDestination&) { return value(); }
};


// service_traits::MD5Sum< ::project3_phase1::GetNextDestinationRequest> should match
// service_traits::MD5Sum< ::project3_phase1::GetNextDestination >
template<>
struct MD5Sum< ::project3_phase1::GetNextDestinationRequest>
{
  static const char* value()
  {
    return MD5Sum< ::project3_phase1::GetNextDestination >::value();
  }
  static const char* value(const ::project3_phase1::GetNextDestinationRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::project3_phase1::GetNextDestinationRequest> should match
// service_traits::DataType< ::project3_phase1::GetNextDestination >
template<>
struct DataType< ::project3_phase1::GetNextDestinationRequest>
{
  static const char* value()
  {
    return DataType< ::project3_phase1::GetNextDestination >::value();
  }
  static const char* value(const ::project3_phase1::GetNextDestinationRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::project3_phase1::GetNextDestinationResponse> should match
// service_traits::MD5Sum< ::project3_phase1::GetNextDestination >
template<>
struct MD5Sum< ::project3_phase1::GetNextDestinationResponse>
{
  static const char* value()
  {
    return MD5Sum< ::project3_phase1::GetNextDestination >::value();
  }
  static const char* value(const ::project3_phase1::GetNextDestinationResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::project3_phase1::GetNextDestinationResponse> should match
// service_traits::DataType< ::project3_phase1::GetNextDestination >
template<>
struct DataType< ::project3_phase1::GetNextDestinationResponse>
{
  static const char* value()
  {
    return DataType< ::project3_phase1::GetNextDestination >::value();
  }
  static const char* value(const ::project3_phase1::GetNextDestinationResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // PROJECT3_PHASE1_MESSAGE_GETNEXTDESTINATION_H