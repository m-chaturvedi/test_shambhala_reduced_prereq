cmake_minimum_required(VERSION 3.5.1)
set(CMAKE_PREFIX_PATH /opt/drake)
find_package(drake REQUIRED)
add_executable(main main.cc)
target_link_libraries(main drake::drake)


# Checking that other packages must work
set(packages_to_test bot2-core-lcmtypes bullet
		drake eigen3 fmt ignition-math4 ignition-rndf0
		jchart2d lcm optitrack pybind11 robotlocomotion-lcmtypes
		sdformat spdlog stx VTK )

foreach(_pack ${packages_to_test})
	find_package(${_pack} REQUIRED)
	if(${_pack}_FOUND)
		MESSAGE(STATUS "FOUND PACKAGE ${_pack}")
	else()
		MESSAGE(FATAL "COULD NOT FIND PACKAGE ${_pack}")
	endif()
endforeach()