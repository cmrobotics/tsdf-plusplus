cmake_minimum_required(VERSION 3.5)
project(tsdf_plusplus_ros2)

find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
find_package(std_msgs REQUIRED)
find_package(voxblox_msgs REQUIRED)
find_package(voxblox REQUIRED)

set(CMAKE_CXX_STANDARD 17)
set( CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -Wall --std=c++17 -O3 -fPIC" )
set( CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} -Wall -O3 -fPIC" )


include_directories(
  include
  ${voxblox_INCLUDE_DIRS}
)

set(executable_name tsdf_plusplus_node)

add_executable(${executable_name}
  src/controller.cc
)

set(library_name ${executable_name}_library)

set(dependencies
  rclcpp
  std_msgs
  voxblox
)

add_library(${library_name} SHARED
 src/controller.cc
)

ament_target_dependencies(${executable_name}
  ${dependencies}
)

target_link_libraries(${executable_name} ${library_name})

ament_target_dependencies(${library_name}
  ${dependencies}
)

install(TARGETS ${library_name}
  ARCHIVE DESTINATION lib
  LIBRARY DESTINATION lib
  RUNTIME DESTINATION bin
)

install(TARGETS ${executable_name}
  RUNTIME DESTINATION lib/${PROJECT_NAME}
)

install(DIRECTORY include/
  DESTINATION include/
)


ament_export_include_directories(include)
ament_export_libraries(${library_name})
ament_export_dependencies(${dependencies})
ament_package()