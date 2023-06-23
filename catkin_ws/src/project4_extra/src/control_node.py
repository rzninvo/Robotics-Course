#!/usr/bin/python3

import rospy
import tf

from nav_msgs.msg import Odometry
from geometry_msgs.msg import Twist
import matplotlib.pyplot as plt
from sensor_msgs.msg import LaserScan
import numpy as np

import math

class Controller:
    
    def __init__(self) -> None:
        
        rospy.init_node("controller" , anonymous=False)

        self.cmd_vel = rospy.Publisher('/cmd_vel', Twist, queue_size=5)

        # getting specified parameters
        self.linear_spead = rospy.get_param("/controller/linear_spead")
        self.angular_k_p = rospy.get_param("/controller/angular_k_p")
        self.angular_k_i = rospy.get_param("/controller/angular_k_i")
        self.angular_k_d = rospy.get_param("/controller/angular_k_d")
        self.dt = rospy.get_param("/controller/dt")
        self.distance_threshold = rospy.get_param("/controller/distance")
        self.epsilon = rospy.get_param("/controller/epsilon")
        turn_d = rospy.get_param("/controller/turn_direction")
        if turn_d == 'left':
            self.turn_direction = 1
        elif turn_d == 'right':
            self.turn_direction = -1

        self.rate = 1/self.dt

        self.r = rospy.Rate(self.rate)
        self.angular_errs = []

        # defining the states of our robot
        self.GO, self.FOLLOW, self.ROTATE, self.CORNER_ROTATE= 0, 1, 2, 3
        self.state = self.GO

    def distance_from_wall(self):

        laser_data = rospy.wait_for_message("/scan" , LaserScan)

        min_front_rng = min(min(laser_data.ranges[:45]), min(laser_data.ranges[315:360]))
        min_right_rng = min(laser_data.ranges[225:315])
        min_right_index = laser_data.ranges.index(min_right_rng)
        min_left_rng = min(laser_data.ranges[45:135])
        min_left_index = laser_data.ranges.index(min_left_rng)
        front_rng = laser_data.ranges[0]
        right_full_rng = min(laser_data.ranges[180:360])
        left_full_rng = min(laser_data.ranges[0:180])
        distances = [min_front_rng, min_right_rng, min_right_index, min_left_rng, min_left_index, front_rng, right_full_rng, left_full_rng]

        return distances
    
    # heading of the robot 
    def get_heading(self):
        
        # waiting for the most recent message from topic /odom
        msg = rospy.wait_for_message("/odom" , Odometry)
        
        orientation = msg.pose.pose.orientation
        
        # convert quaternion to odom
        roll, pitch, yaw = tf.transformations.euler_from_quaternion((
            orientation.x ,orientation.y ,orientation.z ,orientation.w
        )) 
        
        return yaw

    def run(self):

        errors_avg = 0
        msg = rospy.wait_for_message("/odom" , Odometry)
        gamma = 0
        angular_sum_i_theta = 0
        angular_prev_theta_error = 0
        
        move_cmd = Twist()
        move_cmd.angular.z = 0
        move_cmd.linear.x = self.linear_spead
        while (not rospy.is_shutdown()):

            # check whether state is changed or not
            if self.state == self.GO:
                twist = Twist()
                twist.linear.x = self.linear_spead
                self.cmd_vel.publish(twist)

                msg = rospy.wait_for_message("/odom" , Odometry)
                pos = msg.pose.pose.position
                distances = self.distance_from_wall()

                if ((distances[0] - self.distance_threshold) > self.epsilon) and (distances[0] != math.inf):
                    self.state = self.GO
                else:
                    twist = Twist()
                    self.cmd_vel.publish(twist)
                    rospy.sleep(0.2)
                    self.state = self.ROTATE
                    self.remaining_angle = math.radians(90)
                    rospy.loginfo('ROTATING')

                continue

            if self.state == self.ROTATE:
                distances = self.distance_from_wall()
                turn_index = 2
                ranges = range(265, 275, 1)
                if self.turn_direction == -1:
                    turn_index = 4
                    ranges = range(85, 95, 1)
                while (distances[turn_index] not in ranges) or ((distances[5] - self.distance_threshold) <= self.epsilon):
                    distances = self.distance_from_wall()
                    twist = Twist()
                    twist.angular.z = 0.2 * self.turn_direction
                    self.cmd_vel.publish(twist)
                twist = Twist()
                self.cmd_vel.publish(twist)
                rospy.sleep(0.2)
                self.state = self.FOLLOW
                gamma = self.distance_threshold - distances[1]
                rospy.loginfo('FOLLOWING')

                continue

            self.cmd_vel.publish(move_cmd)

            err_gamma = gamma
            self.angular_errs.append(err_gamma)
            angular_sum_i_theta += err_gamma * self.dt

            angular_P = self.angular_k_p * err_gamma
            angular_I = self.angular_k_i * angular_sum_i_theta
            angular_D = self.angular_k_d * (err_gamma - angular_prev_theta_error)

            # rospy.loginfo(f"linear|| P : {linear_P} I : {linear_I} D : {linear_D}")
            # rospy.loginfo(f"angular|| P : {angular_P} I : {angular_I} D : {angular_D}")
            move_cmd.angular.z = angular_P + angular_I + angular_D
            move_cmd.linear.x = self.linear_spead
            angular_prev_theta_error = err_gamma
            
            # rospy.loginfo(f"linear_error : {err_d} angular_error: {err_gamma} speed : {move_cmd.linear.x} theta : {move_cmd.angular.z}")
            
            msg = rospy.wait_for_message("/odom" , Odometry)
            distances = self.distance_from_wall()
            if self.turn_direction == 1:
                gamma = self.distance_threshold - distances[6]
            elif self.turn_direction == -1:
                gamma = distances[7] - self.distance_threshold 

            if ((distances[5] - self.distance_threshold) <= self.epsilon):
                twist = Twist()
                self.cmd_vel.publish(twist)
                rospy.sleep(0.2)
                self.state = self.ROTATE
                self.remaining_angle = math.radians(90)
                rospy.loginfo('ROTATING')

            self.r.sleep()

        twist = Twist()  
        self.cmd_vel.publish(Twist())

if __name__ == "__main__":
    controller = Controller()
    
    controller.run()