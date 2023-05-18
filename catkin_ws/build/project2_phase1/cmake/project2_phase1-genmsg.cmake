# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "project2_phase1: 0 messages, 1 services")

set(MSG_I_FLAGS "-Inav_msgs:/opt/ros/noetic/share/nav_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/noetic/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(project2_phase1_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/rohamzn/Robotics-Course/catkin_ws/src/project2_phase1/srv/GetNextDestination.srv" NAME_WE)
add_custom_target(_project2_phase1_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "project2_phase1" "/home/rohamzn/Robotics-Course/catkin_ws/src/project2_phase1/srv/GetNextDestination.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(project2_phase1
  "/home/rohamzn/Robotics-Course/catkin_ws/src/project2_phase1/srv/GetNextDestination.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/project2_phase1
)

### Generating Module File
_generate_module_cpp(project2_phase1
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/project2_phase1
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(project2_phase1_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(project2_phase1_generate_messages project2_phase1_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rohamzn/Robotics-Course/catkin_ws/src/project2_phase1/srv/GetNextDestination.srv" NAME_WE)
add_dependencies(project2_phase1_generate_messages_cpp _project2_phase1_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(project2_phase1_gencpp)
add_dependencies(project2_phase1_gencpp project2_phase1_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS project2_phase1_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(project2_phase1
  "/home/rohamzn/Robotics-Course/catkin_ws/src/project2_phase1/srv/GetNextDestination.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/project2_phase1
)

### Generating Module File
_generate_module_eus(project2_phase1
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/project2_phase1
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(project2_phase1_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(project2_phase1_generate_messages project2_phase1_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rohamzn/Robotics-Course/catkin_ws/src/project2_phase1/srv/GetNextDestination.srv" NAME_WE)
add_dependencies(project2_phase1_generate_messages_eus _project2_phase1_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(project2_phase1_geneus)
add_dependencies(project2_phase1_geneus project2_phase1_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS project2_phase1_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(project2_phase1
  "/home/rohamzn/Robotics-Course/catkin_ws/src/project2_phase1/srv/GetNextDestination.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/project2_phase1
)

### Generating Module File
_generate_module_lisp(project2_phase1
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/project2_phase1
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(project2_phase1_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(project2_phase1_generate_messages project2_phase1_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rohamzn/Robotics-Course/catkin_ws/src/project2_phase1/srv/GetNextDestination.srv" NAME_WE)
add_dependencies(project2_phase1_generate_messages_lisp _project2_phase1_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(project2_phase1_genlisp)
add_dependencies(project2_phase1_genlisp project2_phase1_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS project2_phase1_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(project2_phase1
  "/home/rohamzn/Robotics-Course/catkin_ws/src/project2_phase1/srv/GetNextDestination.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/project2_phase1
)

### Generating Module File
_generate_module_nodejs(project2_phase1
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/project2_phase1
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(project2_phase1_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(project2_phase1_generate_messages project2_phase1_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rohamzn/Robotics-Course/catkin_ws/src/project2_phase1/srv/GetNextDestination.srv" NAME_WE)
add_dependencies(project2_phase1_generate_messages_nodejs _project2_phase1_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(project2_phase1_gennodejs)
add_dependencies(project2_phase1_gennodejs project2_phase1_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS project2_phase1_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(project2_phase1
  "/home/rohamzn/Robotics-Course/catkin_ws/src/project2_phase1/srv/GetNextDestination.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/project2_phase1
)

### Generating Module File
_generate_module_py(project2_phase1
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/project2_phase1
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(project2_phase1_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(project2_phase1_generate_messages project2_phase1_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rohamzn/Robotics-Course/catkin_ws/src/project2_phase1/srv/GetNextDestination.srv" NAME_WE)
add_dependencies(project2_phase1_generate_messages_py _project2_phase1_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(project2_phase1_genpy)
add_dependencies(project2_phase1_genpy project2_phase1_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS project2_phase1_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/project2_phase1)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/project2_phase1
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET nav_msgs_generate_messages_cpp)
  add_dependencies(project2_phase1_generate_messages_cpp nav_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/project2_phase1)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/project2_phase1
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET nav_msgs_generate_messages_eus)
  add_dependencies(project2_phase1_generate_messages_eus nav_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/project2_phase1)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/project2_phase1
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET nav_msgs_generate_messages_lisp)
  add_dependencies(project2_phase1_generate_messages_lisp nav_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/project2_phase1)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/project2_phase1
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET nav_msgs_generate_messages_nodejs)
  add_dependencies(project2_phase1_generate_messages_nodejs nav_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/project2_phase1)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/project2_phase1\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/project2_phase1
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET nav_msgs_generate_messages_py)
  add_dependencies(project2_phase1_generate_messages_py nav_msgs_generate_messages_py)
endif()
