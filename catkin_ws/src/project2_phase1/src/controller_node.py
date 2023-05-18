#!/usr/bin/python3

import rospy
import tf

from project2_phase1.srv import *
from nav_msgs.msg import Odometry
from geometry_msgs.msg import Twist

import math

class Error_Log:
    def __init__(self, pos_x, pos_y, dest_x, dest_y, distance_error) -> None:
        self.pos_x = pos_x
        self.pos_y = pos_y
        self.dest_x = dest_x
        self.dest_y = dest_y
        self.distance_error = distance_error
    def __str__(self) -> str:
        return f'Robot Final Position: [{self.pos_x}, {self.pos_y}] \n Goal Position: [{self.dest_x}, {self.dest_y}] \
                 Distance Error = {self.distance_error}'

class Controller:
    
    def __init__(self) -> None:
        
        rospy.init_node("controller_node" , anonymous=False)
        
        self.cmd_publisher = rospy.Publisher('/cmd_vel' , Twist , queue_size=10)
        
        # getting specified parameters
        self.linear_speed = rospy.get_param("/controller/linear_speed") # m/s
        self.angular_speed = rospy.get_param("/controller/angular_speed") # rad/s
        self.epsilon = rospy.get_param("/controller/epsilon")
        self.iteration_num = rospy.get_param("/controller/iteration_num")
        
        # defining the states of our robot
        self.GO, self.ROTATE = 0, 1
        self.state = self.GO

        self.error_logs = []

        # defining the previous distance to goal
        self.prev_dist = 100

        msg = rospy.wait_for_message("/odom" , Odometry)
        self.getNextDestinationFromService(0, 0)
    
    # Getting the next random goal from the getNextDestination Service
    def getNextDestinationFromService(self, x, y):
        rospy.wait_for_service('getNextDestination')
        try:
            gnd_service = rospy.ServiceProxy('getNextDestination', GetNextDestination)
            response = gnd_service(x, y)
            self.next_x = response.next_x
            self.next_y = response.next_y
            if round(self.get_heading() - self.calculate_rotation_angle(), 2) != 0:
                self.state = self.ROTATE
            else:
                self.state = self.GO
        except rospy.ServiceException as e:
           rospy.loginfo(f'ERROR from getNextDestination service: {e}')

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
    
    # calculate the rotation need to reach the next angle
    def calculate_rotation_angle(self):
        msg = rospy.wait_for_message("/odom" , Odometry)
        pos = msg.pose.pose.position
        return math.atan2(self.next_y - pos.y, self.next_x - pos.x)
    
    def log_error(self):
        with open("./error_log.txt",'w') as f:
            for error_log in self.error_logs:
                f.write(str(error_log))
            f.close()

    def run(self):
        
        while (not rospy.is_shutdown()) and (self.iteration_num > 0):
            
            # check whether state is changed or not
            if self.state == self.GO:
                twist = Twist()
                twist.linear.x = self.linear_speed
                self.cmd_publisher.publish(twist)

                msg = rospy.wait_for_message("/odom" , Odometry)
                pos = msg.pose.pose.position
                dist = math.sqrt(((self.next_x - pos.x) ** 2) + ((self.next_y - pos.y) ** 2))

                if self.prev_dist > dist:
                    self.prev_dist = dist
                    continue
                else:
                    error = Error_Log(pos.x, pos.y, self.next_x, self.next_y, dist)
                    self.error_logs.append(error)
                    rospy.loginfo(error)
                    self.iteration_num -= 1
                    self.prev_dist = 100
                    msg = rospy.wait_for_message("/odom" , Odometry)
                    pos = msg.pose.pose.position
                    self.getNextDestinationFromService(pos.x, pos.y)
                    continue
            
            self.cmd_publisher.publish(Twist())
            
            rospy.sleep(1)
            
            goal_angle = self.calculate_rotation_angle()
            prev_angle = self.get_heading()
            
            twist = Twist()  
            if prev_angle - goal_angle > 0:
                twist.angular.z = -self.angular_speed
            else:
                twist.angular.z = self.angular_speed
            self.cmd_publisher.publish(twist)

            remaining = abs(prev_angle - goal_angle)


            while remaining >= 0:
                current_angle = self.get_heading()
                delta = abs(prev_angle - current_angle)
                remaining -= delta
                prev_angle = current_angle
            
            self.cmd_publisher.publish(Twist())

            rospy.sleep(1)
            
            self.state = self.GO


if __name__ == "__main__":
    controller = Controller()
    
    controller.run()