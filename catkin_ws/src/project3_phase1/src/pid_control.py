#!/usr/bin/python3

import rospy
import tf

from nav_msgs.msg import Odometry
from geometry_msgs.msg import Twist
import matplotlib.pyplot as plt

import math

class Controller:
    
    def __init__(self) -> None:
        
        rospy.init_node("pid_controller" , anonymous=False)
        rospy.on_shutdown(self.on_shutdown)

        self.cmd_vel = rospy.Publisher('/cmd_vel', Twist, queue_size=5)
        
        # getting specified parameters
        self.linear_k_p = rospy.get_param("/pid_controller/linear_k_p")
        self.linear_k_i = rospy.get_param("/pid_controller/linear_k_i")
        self.linear_k_d = rospy.get_param("/pid_controller/linear_k_d")
        self.angular_k_p = rospy.get_param("/pid_controller/angular_k_p")
        self.angular_k_i = rospy.get_param("/pid_controller/angular_k_i")
        self.angular_k_d = rospy.get_param("/pid_controller/angular_k_d")
        self.dt = rospy.get_param("/pid_controller/dt")
        self.next_x = rospy.get_param("/pid_controller/next_x")
        self.next_y = rospy.get_param("/pid_controller/next_y")

        self.rate = 1/self.dt

        self.r = rospy.Rate(self.rate)
        self.linear_errs = []
        self.angular_errs = []

    # heading of the robot 
    def get_heading(self, msg):
        orientation = msg.pose.pose.orientation
        
        # convert quaternion to odom
        roll, pitch, yaw = tf.transformations.euler_from_quaternion((
            orientation.x ,orientation.y ,orientation.z ,orientation.w
        )) 
        
        return yaw
    
    # calculate the rotation need to reach the next angle
    def calculate_rotation_angle(self, next_x, next_y, msg):
        pos = msg.pose.pose.position
        return math.atan2(next_y - pos.y, next_x - pos.x)

    def distance_from_goal(self, msg):
        pos = msg.pose.pose.position
        return math.sqrt(((self.next_x - pos.x) ** 2) + ((self.next_y - pos.y) ** 2))
    
    def rotation_goal(self, next_x, next_y, msg):
        calculated_rotation_angle = self.calculate_rotation_angle(next_x, next_y, msg)
        heading = self.get_heading(msg)
        alpha_rotation = calculated_rotation_angle - heading
        beta_rotation = alpha_rotation + 2 * math.pi
        gamma_rotation = alpha_rotation - 2 * math.pi
        
        rotations = [abs(alpha_rotation), abs(beta_rotation), abs(gamma_rotation)]
        min_indx = rotations.index(min(rotations))

        if min_indx == 0:
            rotation = alpha_rotation
        elif min_indx == 1:
            rotation = beta_rotation
        elif min_indx == 2:
            rotation = gamma_rotation

    def run(self):

        msg = rospy.wait_for_message("/odom" , Odometry)
        d = self.distance_from_goal(msg)
        gamma = self.rotation_goal(self.next_x, self.next_y, msg)
        linear_sum_i_theta = 0
        angular_sum_i_theta = 0
        linear_prev_theta_error = 0
        angular_prev_theta_error = 0
        
        move_cmd = Twist()
        move_cmd.angular.z = 0
        move_cmd.linear.x = 0
        while (not rospy.is_shutdown()):
            self.cmd_vel.publish(move_cmd)

            err_d = d
            err_gamma = gamma
            self.linear_errs.append(err_d)
            self.angular_errs.append(err_gamma)
            linear_sum_i_theta += err_d * self.dt
            angular_sum_i_theta += err_gamma * self.dt
            
            linear_P = self.linear_k_p * err_d
            linear_I = self.linear_k_i * linear_sum_i_theta
            linear_D = self.linear_k_d * (err_d - linear_prev_theta_error)

            angular_P = self.angular_k_p * err_gamma
            angular_I = self.angular_k_i * angular_sum_i_theta
            angular_D = self.angular_k_d * (err_gamma - angular_prev_theta_error)

            rospy.loginfo(f"linear|| P : {linear_P} I : {linear_I} D : {linear_D}")
            rospy.loginfo(f"angular|| P : {angular_P} I : {angular_I} D : {angular_D}")
            move_cmd.linear.x = linear_P + linear_I + linear_D
            move_cmd.angular.z = angular_P + angular_I + angular_D
            linear_prev_theta_error = err_d
            angular_prev_theta_error = err_gamma
            
            rospy.loginfo(f"linear_error : {err_d} angular_error: {err_gamma} speed : {move_cmd.linear.x} theta : {move_cmd.angular.z}")
            
            msg = rospy.wait_for_message("/odom" , Odometry)
            d = self.distance_from_goal(msg)
            gamma = self.rotation_goal(self.next_x, self.next_y, msg)

            self.r.sleep()

    def on_shutdown(self):
        rospy.loginfo("Stopping the robot...")
        self.cmd_vel.publish(Twist())
        fig, axs = plt.subplots(2)
        fig.suptitle('Error Plots')
        axs[0].plot(list(range(len(self.linear_errs))),
                    self.linear_errs, label='errs_linear')
        axs[0].axhline(y=0,color='R')
        axs[0].legend(loc="upper left", frameon=False)
        axs[1].plot(list(range(len(self.angular_errs))),
                    self.angular_errs, label='errs_angular')
        axs[1].axhline(y=0,color='R')
        axs[1].legend(loc="upper left", frameon=False)
        axs[1].set_ylim([-0.5, 0.5])
        plt.draw()
        plt.savefig(f"errs_linear_{self.linear_k_p}_{self.linear_k_d}_{self.linear_k_i}_angular_{self.angular_k_p}_{self.angular_k_d}_{self.angular_k_i}.png")
        plt.show()

        rospy.sleep(1)
            

if __name__ == "__main__":
    controller = Controller()
    controller.run()