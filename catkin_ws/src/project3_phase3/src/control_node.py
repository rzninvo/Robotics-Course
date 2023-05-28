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
        rospy.on_shutdown(self.on_shutdown)

        self.cmd_vel = rospy.Publisher('/cmd_vel', Twist, queue_size=5)

        # getting specified parameters
        self.linear_spead = rospy.get_param("/controller/linear_spead")
        self.angular_k_p = rospy.get_param("/controller/angular_k_p")
        self.angular_k_i = rospy.get_param("/controller/angular_k_i")
        self.angular_k_d = rospy.get_param("/controller/angular_k_d")
        self.dt = rospy.get_param("/controller/dt")
        self.distance_threshold = rospy.get_param("/controller/distance")
        self.epsilon = rospy.get_param("/controller/epsilon")

        self.rate = 1/self.dt

        self.r = rospy.Rate(self.rate)
        self.angular_errs = []

        # defining the states of our robot
        self.GO, self.FOLLOW, self.ROTATE = 0, 1, 2
        self.state = self.GO

    def distance_from_wall(self):

        laser_data = rospy.wait_for_message("/scan" , LaserScan)

        min_front_rng = min(min(laser_data.ranges[:45]), min(laser_data.ranges[315:360]))
        min_right_rng = min(laser_data.ranges[225:315])
        min_right_index = laser_data.ranges.index(min_right_rng)
        right_edge_bottom = laser_data.ranges[225]
        right_edge_top = laser_data.ranges[315]
        front_rng = laser_data.ranges[0]
        distances = [min_front_rng, min_right_rng, min_right_index, right_edge_bottom, right_edge_top, front_rng]

        return distances

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
                    self.state = self.ROTATE
                    rospy.loginfo('ROTATING')

                continue

            if self.state == self.ROTATE:
                distances = self.distance_from_wall()
                if distances[2] >= 270:
                    twist = Twist()
                    twist.angular.z = 0.2
                    self.cmd_vel.publish(twist)
                else:
                    twist = Twist()
                    self.cmd_vel.publish(twist)
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
            gamma = self.distance_threshold - distances[1]

            if ((distances[5] - self.distance_threshold) <= self.epsilon):
                twist = Twist()
                self.cmd_vel.publish(twist)
                self.state = self.ROTATE
                rospy.loginfo('ROTATING')

            self.r.sleep()

        twist = Twist()  
        self.cmd_vel.publish(Twist())

    def on_shutdown(self):
        rospy.loginfo("Stopping the robot...")
        self.cmd_vel.publish(Twist())
        plt.plot(list(range(len(self.angular_errs))),
                    self.angular_errs, label='errs_angular')
        plt.axhline(y=0,color='R')
        plt.legend(loc="upper left", frameon=False)
        plt.draw()
        plt.savefig(f"phase_3_errs_speed_{self.linear_spead}_angular_{self.angular_k_p}_{self.angular_k_d}_{self.angular_k_i}.png")
        plt.show()

        rospy.sleep(1)

if __name__ == "__main__":
    controller = Controller()
    
    controller.run()