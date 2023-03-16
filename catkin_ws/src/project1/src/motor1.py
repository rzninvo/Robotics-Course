#!/usr/bin/python3

import rospy
import random
from project1.msg import controller


def callback(data):
    rospy.loginfo(rospy.get_caller_id() + f' Recieved commands from /motor1 topic: {data}')


def motor1_node():
    rospy.init_node('controller', anonymous=True)
    rospy.Subscriber('/motor1', controller, callback)
    rospy.spin()

if __name__ == '__main__':
    try:
        motor1_node()
    except rospy.ROSInterruptException:
        pass 