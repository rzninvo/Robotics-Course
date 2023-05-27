#!/usr/bin/python3

import rospy
import tf

from nav_msgs.msg import Odometry
from geometry_msgs.msg import Twist
import matplotlib.pyplot as plt
import numpy as np

import math

class Controller:
    
    def __init__(self) -> None:
        
        rospy.init_node("controller" , anonymous=False)
        rospy.on_shutdown(self.on_shutdown)

        self.cmd_vel = rospy.Publisher('/cmd_vel', Twist, queue_size=5)

        # getting specified parameters
        self.linear_k_p = rospy.get_param("/controller/linear_k_p")
        self.linear_k_i = rospy.get_param("/controller/linear_k_i")
        self.linear_k_d = rospy.get_param("/controller/linear_k_d")
        self.angular_k_p = rospy.get_param("/controller/angular_k_p")
        self.angular_k_i = rospy.get_param("/controller/angular_k_i")
        self.angular_k_d = rospy.get_param("/controller/angular_k_d")
        self.dt = rospy.get_param("/controller/dt")
        self.epsilon = rospy.get_param("/controller/epsilon")
        self.path_type = rospy.get_param("/controller/path_type")
        self.min_index = -1

        self.rate = 1/self.dt

        self.r = rospy.Rate(self.rate)
        self.linear_errs = []
        self.angular_errs = []
        self.path = list(self.get_path())
        self.next_x, self.next_y = self.get_closest_point()

    def get_closest_point(self):
        min_dist = 99999
        min_x = 0
        min_y = 0
        msg = rospy.wait_for_message("/odom" , Odometry)
        pos = msg.pose.pose.position
        if (self.min_index == -1):
            for i in range(len(self.path)):
                distance = math.sqrt(((self.path[i][0] - pos.x) ** 2) + ((self.path[i][1] - pos.y) ** 2))
                if (min_dist > distance):
                    min_dist = distance
                    min_x = self.path[i][0]
                    min_y = self.path[i][1]
                    self.min_index = i
        else:
            min_dist = 99999
            closest_corner_index = 0
            for i in range(len(self.path)):
                if (((i + 1) % 100 == 0) or (i == 0)) and (abs((i - self.min_index)) <= 100) and ((i - self.min_index) < 0):
                    distance = math.sqrt(((self.path[i][0] - pos.x) ** 2) + ((self.path[i][1] - pos.y) ** 2))
                    min_dist = distance
                    min_x = self.path[i][0]
                    min_y = self.path[i][1]
                    self.min_index = i
                    rospy.loginfo(f'MIN INDEX == {self.min_index}')
                    break
                elif self.min_index == 0:
                    min_x = self.path[len(self.path) - 101][0]
                    min_y = self.path[len(self.path) - 101][1]
                    self.min_index = len(self.path) - 101
                    rospy.loginfo(f'MIN INDEX_BRUH == {self.min_index}')
                    break
        rospy.loginfo(f'Current Pos: [{pos.x}, {pos.y}]')
        rospy.loginfo(f'Closest Dist: [{min_x}, {min_y}]')
        return [min_x, min_y]

    def get_path(self):
        if self.path_type == 1:
            return self.create_rectangle(6, 4)
        elif self.path_type == 2:
            return self.create_star()
        elif self.path_type == 3:
            return self.create_logarithmic_spiral()

    def create_rectangle(self, n, m):
        width = n / 2
        height = m / 2
        X1 = np.linspace(-width, width, 100)
        Y1 = np.array([height]*100)

        Y2 = np.linspace(height, -height, 100)
        X2 = np.array([width]*100)

        X3 = np.linspace(width, -width, 100)
        Y3 = np.array([-height]*100)

        Y4 = np.linspace(-height, height, 100)
        X4 = np.array([-width]*100)

        return zip(np.concatenate([X1, X2, X3, X4]), np.concatenate([Y1,Y2,Y3,Y4]))
    
    def create_star(self):
        X1 = np.linspace(0, 3, 100)
        Y1 = - (7/3) * X1  + 12

        X2 = np.linspace(3, 10, 100)
        Y2 = np.array([5]*100)

        X3 = np.linspace(10, 4, 100)
        Y3 = (5/6) * X3  - (10/3)

        X4 = np.linspace(4, 7, 100)
        Y4 = -(3) * X4  + 12

        X5 = np.linspace(7, 0, 100)
        Y5 = -(4/7) * X5  - 5

        X6 = np.linspace(0, -7, 100)
        Y6 = (4/7) * X6  - 5

        X7 = np.linspace(-7, -4, 100)
        Y7 = 3 * X7  + 12

        X8 = np.linspace(-4, -10, 100)
        Y8 = -(5/6) * X8  - (10/3)

        X9 = np.linspace(-10, -3, 100)
        Y9 = np.array([5]*100)

        X10 = np.linspace(-3, 0, 100)
        Y10 = (7/3) * X10  + 12

        return zip(np.concatenate([X1, X2, X3, X4, X5, X6, X7, X8, X9, X10]), np.concatenate([Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8, Y9, Y10]))
    
    def create_logarithmic_spiral(self):
        a = 0.17
        k = math.tan(a)
        X , Y = [] , []

        for i in range(150):
            t = i / 20 * math.pi
            dx = a * math.exp(k * t) * math.cos(t)
            dy = a * math.exp(k * t) * math.sin(t)
            X.append(dx)
            Y.append(dy) 
        return zip(X, Y)

    # heading of the robot 
    def get_heading(self, msg):
        orientation = msg.pose.pose.orientation
        
        # convert quaternion to odom
        roll, pitch, yaw = tf.transformations.euler_from_quaternion((
            orientation.x ,orientation.y ,orientation.z ,orientation.w
        )) 
        
        if (self.next_x == -3 and self.next_y == 2):
            rospy.loginfo(f'HEADING = {yaw}')

        return yaw
    
    # calculate the rotation need to reach the next angle
    def calculate_rotation_angle(self, msg):
        pos = msg.pose.pose.position
        if (self.next_x == -3 and self.next_y == 2):
            rospy.loginfo(f'ROTATION ANGLE = {math.atan2(self.next_y - pos.y, self.next_x - pos.x)}')
        return math.atan2(self.next_y - pos.y, self.next_x - pos.x)

    def distance_from_goal(self, msg):
        pos = msg.pose.pose.position
        return math.sqrt(((self.next_x - pos.x) ** 2) + ((self.next_y - pos.y) ** 2))
    
    def rotation_goal(self, msg):
        calculated_rotation_angle = self.calculate_rotation_angle(msg)
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

        if (self.next_x == -3 and self.next_y == 2):
            rospy.loginfo(f'ROTATION_GOAL = {rotation}')
        return rotation

    def run(self):

        errors_avg = 0
        msg = rospy.wait_for_message("/odom" , Odometry)
        d = self.distance_from_goal(msg)
        gamma = self.rotation_goal(msg)
        linear_sum_i_theta = 0
        angular_sum_i_theta = 0
        linear_prev_theta_error = 0
        angular_prev_theta_error = 0
        
        move_cmd = Twist()
        move_cmd.angular.z = 0
        move_cmd.linear.x = 0
        while (not rospy.is_shutdown()):
            if (d <= self.epsilon):
                self.next_x, self.next_y = self.get_closest_point()
                d = self.distance_from_goal(msg)
                gamma = self.rotation_goal(msg)
                linear_sum_i_theta = 0
                angular_sum_i_theta = 0
                linear_prev_theta_error = 0
                angular_prev_theta_error = 0
                move_cmd.angular.z = 0
                move_cmd.linear.x = 0
                continue
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

            # rospy.loginfo(f"linear|| P : {linear_P} I : {linear_I} D : {linear_D}")
            # rospy.loginfo(f"angular|| P : {angular_P} I : {angular_I} D : {angular_D}")
            move_cmd.linear.x = linear_P + linear_I + linear_D
            move_cmd.angular.z = angular_P + angular_I + angular_D
            linear_prev_theta_error = err_d
            angular_prev_theta_error = err_gamma
            
            # rospy.loginfo(f"linear_error : {err_d} angular_error: {err_gamma} speed : {move_cmd.linear.x} theta : {move_cmd.angular.z}")
            
            msg = rospy.wait_for_message("/odom" , Odometry)
            d = self.distance_from_goal(msg)
            gamma = self.rotation_goal(msg)

            self.r.sleep()

        twist = Twist()  
        self.cmd_vel.publish(Twist())

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
        plt.draw()
        if self.path_type == 1:
            plt.savefig(f"phase_2_rect_errs_linear_{self.linear_k_p}_{self.linear_k_d}_{self.linear_k_i}_angular_{self.angular_k_p}_{self.angular_k_d}_{self.angular_k_i}.png")
        elif self.path_type == 2:
            plt.savefig(f"phase_2_star_errs_linear_{self.linear_k_p}_{self.linear_k_d}_{self.linear_k_i}_angular_{self.angular_k_p}_{self.angular_k_d}_{self.angular_k_i}.png")
        elif self.path_type == 3:
            plt.savefig(f"phase_2_spiral_errs_linear_{self.linear_k_p}_{self.linear_k_d}_{self.linear_k_i}_angular_{self.angular_k_p}_{self.angular_k_d}_{self.angular_k_i}.png")
        plt.show()

        rospy.sleep(1)

if __name__ == "__main__":
    controller = Controller()
    
    controller.run()