#!/usr/bin/python3

import rospy
from laser_assembler.srv import AssembleScans2
from sensor_msgs.msg import PointCloud2


if __name__ == "__main__":
    rospy.init_node("laser_assembler_pcd")
    rospy.wait_for_service("assemble_scans2")
    assemble_scans = rospy.ServiceProxy("assemble_scans2", AssembleScans2)
    pub = rospy.Publisher("/laser_pointcloud", PointCloud2, queue_size=1)

    while not rospy.is_shutdown():
        try:
            resp = assemble_scans(rospy.Time(0,0), rospy.get_rostime())
            pub.publish(resp.cloud)
        except rospy.ServiceException as e:
            rospy.loginfo("Error %s" %e)
        rospy.sleep(1)
        