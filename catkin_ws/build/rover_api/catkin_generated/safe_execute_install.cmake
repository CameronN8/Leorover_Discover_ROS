execute_process(COMMAND "/root/catkin_ws/build/rover_api/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/root/catkin_ws/build/rover_api/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
