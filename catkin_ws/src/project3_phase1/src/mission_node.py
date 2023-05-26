#!/usr/bin/python3

import rospy
import random
import math
from project3_phase1.srv import GetNextDestination, GetNextDestinationResponse

class Mission_Node:
    def __init__(self) -> None:
        rospy.init_node('mission_node', anonymous=True)
        gnd_service = rospy.Service('getNextDestination', GetNextDestination, self.getNextDestination)
        rospy.spin()

    def getNextDestination(self, req):
        rospy.loginfo(f'Current [x,y] Coordinate: [{req.current_x}, {req.current_y}]')
        response = GetNextDestinationResponse()
        response.next_x, response.next_y = self.calculateNextDestination(req.current_x, req.current_y)
        return response

    def calculateNextDestination(self, x, y):
        next_x = random.uniform(-20, 20)
        next_y = random.uniform(-20, 20)
        while math.sqrt(((next_x - x) ** 2) + ((next_y - y) ** 2)) <= 10:
            next_x = random.uniform(-20, 20)
            next_y = random.uniform(-20, 20)
        rospy.loginfo(f'Next [x,y] Coordinate: [{next_x}, {next_y}]')
        return next_x, next_y

if __name__ == "__main__":
    mission_node_instance = Mission_Node()