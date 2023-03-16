#!/usr/bin/python3

import rospy
import random
from project1.msg import distance_sensor
from project1.msg import controller

def controller_msg(clockwise, theta):
    controlling_parameters = controller()
    controlling_parameters.clockwise = clockwise
    controlling_parameters.theta = theta
    return controlling_parameters

def callback(data):
    rospy.loginfo(rospy.get_caller_id() + "I heard %s", data)
    #distances = data


def controller_node():
    #motor1_pub = rospy.Publisher('/motor1', controller, queue_size=10)
    #motor2_pub = rospy.Publisher('/motor2', controller, queue_size=10)
    rospy.init_node('controller', anonymous=True)
    rospy.Subscriber('/distance', distance_sensor, callback)

    rospy.spin()

if __name__ == '__main__':
    try:
        controller_node()
    except rospy.ROSInterruptException:
        pass 
