#!/usr/bin/python3

import rospy

from sensor_msgs.msg import LaserScan
from project2_phase2.msg import closest_object_pose

class Sensor:
    
    def __init__(self) -> None:
        
        rospy.init_node("sensor_node" , anonymous=True)
        
        self.laser_subscriber = rospy.Subscriber("/scan" , LaserScan , callback=self.laser_callback)
        self.close_object_publisher = rospy.Publisher("/ClosestObstacle", closest_object_pose, queue_size=10)
        self.min_distance = 0
        self.direction = 0
        
    # checks whether there is an obstacle in front of the robot
    # or not
    def laser_callback(self, msg: LaserScan):
        pub = closest_object_pose()
        self.min_distance = min(msg.ranges)
        self.direction = msg.ranges.index(self.min_distance)
        pub.direction = self.direction
        pub.distance = self.min_distance
        self.close_object_publisher.publish(pub)
    
    def run(self):
        while not rospy.is_shutdown():
            rospy.loginfo(f'Min_Distance: {self.min_distance}, Direction: {self.direction}')
            rospy.sleep(0.5)

if __name__ == "__main__":
    controller = Sensor()
    controller.run()