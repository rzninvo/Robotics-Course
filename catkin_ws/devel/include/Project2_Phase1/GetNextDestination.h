// Generated by gencpp from file Project2_Phase1/GetNextDestination.msg
// DO NOT EDIT!


#ifndef PROJECT2_PHASE1_MESSAGE_GETNEXTDESTINATION_H
#define PROJECT2_PHASE1_MESSAGE_GETNEXTDESTINATION_H

#include <ros/service_traits.h>


#include <Project2_Phase1/GetNextDestinationRequest.h>
#include <Project2_Phase1/GetNextDestinationResponse.h>


namespace Project2_Phase1
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
} // namespace Project2_Phase1


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::Project2_Phase1::GetNextDestination > {
  static const char* value()
  {
    return "09f8b596f17567f03b1180688311653f";
  }

  static const char* value(const ::Project2_Phase1::GetNextDestination&) { return value(); }
};

template<>
struct DataType< ::Project2_Phase1::GetNextDestination > {
  static const char* value()
  {
    return "Project2_Phase1/GetNextDestination";
  }

  static const char* value(const ::Project2_Phase1::GetNextDestination&) { return value(); }
};


// service_traits::MD5Sum< ::Project2_Phase1::GetNextDestinationRequest> should match
// service_traits::MD5Sum< ::Project2_Phase1::GetNextDestination >
template<>
struct MD5Sum< ::Project2_Phase1::GetNextDestinationRequest>
{
  static const char* value()
  {
    return MD5Sum< ::Project2_Phase1::GetNextDestination >::value();
  }
  static const char* value(const ::Project2_Phase1::GetNextDestinationRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::Project2_Phase1::GetNextDestinationRequest> should match
// service_traits::DataType< ::Project2_Phase1::GetNextDestination >
template<>
struct DataType< ::Project2_Phase1::GetNextDestinationRequest>
{
  static const char* value()
  {
    return DataType< ::Project2_Phase1::GetNextDestination >::value();
  }
  static const char* value(const ::Project2_Phase1::GetNextDestinationRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::Project2_Phase1::GetNextDestinationResponse> should match
// service_traits::MD5Sum< ::Project2_Phase1::GetNextDestination >
template<>
struct MD5Sum< ::Project2_Phase1::GetNextDestinationResponse>
{
  static const char* value()
  {
    return MD5Sum< ::Project2_Phase1::GetNextDestination >::value();
  }
  static const char* value(const ::Project2_Phase1::GetNextDestinationResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::Project2_Phase1::GetNextDestinationResponse> should match
// service_traits::DataType< ::Project2_Phase1::GetNextDestination >
template<>
struct DataType< ::Project2_Phase1::GetNextDestinationResponse>
{
  static const char* value()
  {
    return DataType< ::Project2_Phase1::GetNextDestination >::value();
  }
  static const char* value(const ::Project2_Phase1::GetNextDestinationResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // PROJECT2_PHASE1_MESSAGE_GETNEXTDESTINATION_H
