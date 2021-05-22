cmake_minimum_required(VERSION 3.5)
project(tsdf_plusplus_lib_ros2)

find_package(ament_cmake REQUIRED)
find_package(PCL REQUIRED)
find_package(voxblox REQUIRED)
find_package(Gflags REQUIRED)
find_package(Glog REQUIRED)
find_package(pcl_conversions REQUIRED)

set(CMAKE_CXX_STANDARD 17)
set( CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -Wall --std=c++17 -O3 -fPIC" )
set( CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} -Wall -O3 -fPIC" )

####################
# SET SOURCE FILES #
####################

set("${PROJECT_NAME}_SRCS"
  ../../tsdf_plusplus/src/alignment/icp.cc
  ../../tsdf_plusplus/src/core/object_volume.cc
  ../../tsdf_plusplus/src/core/map.cc
  ../../tsdf_plusplus/src/core/segment.cc
  ../../tsdf_plusplus/src/integrator/integrator.cc
  ../../tsdf_plusplus/src/mesh/color_map.cc
  ../../tsdf_plusplus/src/mesh/mesh_integrator.cc
  ../../tsdf_plusplus/src/visualizer/visualizer.cc
)


############
# BINARIES #
############

include_directories(
  ../../tsdf_plusplus/include
  ${PCL_INCLUDE_DIRS}
  ${GLOG_INCLUDE_DIRS}
  ${GFLAGS_INCLUDE_DIRS}
  ${voxblox_INCLUDE_DIRS}
  ${pcl_conversions_INCLUDE_DIRS}
)


add_library (${PROJECT_NAME} ${${PROJECT_NAME}_SRCS})
target_include_directories(${PROJECT_NAME}
  PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/../../tsdf_plusplus/include>
    $<INSTALL_INTERFACE:include>)

ament_export_targets(export_${PROJECT_NAME} HAS_LIBRARY_TARGET)


install(
  TARGETS ${PROJECT_NAME}
  EXPORT export_${PROJECT_NAME}
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  RUNTIME DESTINATION bin
  INCLUDES DESTINATION include
)

install(
  DIRECTORY ../../tsdf_plusplus/include/
  DESTINATION include/
)


ament_export_include_directories(include)
ament_export_libraries(${PROJECT_NAME})
ament_export_dependencies(${dependencies})
ament_package()
