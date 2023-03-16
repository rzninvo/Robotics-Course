#!/usr/bin/python3

import rospy
import random
from project1.msg import distance_sensor

def random_distance_generator():
    directions = distance_sensor()
    directions.front = random.randint(10, 200)
    directions.back = random.randint(10, 200)
    directions.right = random.randint(10, 200)
    directions.left = random.randint(10, 200)
    return directions

def distance_sensor():
    directions = distance_sensor()

    pub = rospy.Publisher('/distance', distance_sensor, queue_size=10)
    rospy.init_node('distance_sensor', anonymous=True)
    rate = rospy.Rate(1) #1hz -> 1 Second

    while not rospy.is_shutdown():
        directions = random_distance_generator()

        rospy.loginfo(f'Distance Sensor[Front= {directions.front}, Back= {directions.back},\
                                        Right= {directions.right}, Left= {directions.left}]')
        pub.publish(directions)
        rate.sleep()

if __name__ == '__main__':
    try:
        distance_sensor()
    except rospy.ROSInterruptException:
        pass                            