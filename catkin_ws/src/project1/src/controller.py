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

def calculate_controller_msg(min_distance):
    if min_distance == 'left':
        return {'motor1': controller_msg(1, 45), 'motor2': controller_msg(-1, 45)}
    elif min_distance == 'right':
        return {'motor1': controller_msg(-1, 45), 'motor2': controller_msg(1, 45)}
    elif min_distance == 'front':
        return {'motor1': controller_msg(1, 90), 'motor2': controller_msg(-1, 90)}
    elif min_distance == 'back':
        return {'motor1': controller_msg(0, 0), 'motor2': controller_msg(0, 0)}


def callback(data):
    rospy.loginfo(rospy.get_caller_id() + "I heard %s", data)
    directions = {'front': data.front, 'back': data.back, 'right': data.right, 'left': data.left}
    rospy.loginfo(f'min_distance = {min(directions, key= directions.get)}')

    #Calculating the rotation angle and rotation direction for both motors
    motor_commands = calculate_controller_msg(min(directions, key= directions.get))

    #Publishing data to the motors
    motor1_pub.publish(motor_commands['motor1'])
    motor2_pub.publish(motor_commands['motor2'])


def controller_node():
    global motor1_pub, motor2_pub
    motor1_pub = rospy.Publisher('/motor1', controller, queue_size=10)
    motor2_pub = rospy.Publisher('/motor2', controller, queue_size=10)
    rospy.init_node('controller', anonymous=True)
    rospy.Subscriber('/distance', distance_sensor, callback)

    rospy.spin()

if __name__ == '__main__':
    try:
        controller_node()
    except rospy.ROSInterruptException:
        pass 
