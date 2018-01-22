#!/usr/bin/env bash
apt update -y
apt install --no-install-recommends -y curl ca-certificates cmake build-essentials
curl https://drake-packages.csail.mit.edu/drake/nightly/drake-latest-xenial.tar.gz | tar -xvz -C /opt


# libprotobuf-dev
#CMake Error at /usr/share/cmake-3.5/Modules/FindPackageHandleStandardArgs.cmake:148 (message):
#  Could NOT find Protobuf (missing: Protobuf_INCLUDE_DIR) (Required is at
#  least version "2.6.1")

# libboost-all-dev
#  Unable to find the requested Boost libraries.
#
#  Unable to find the Boost header files.  Please set BOOST_ROOT to the root
#  directory containing Boost or BOOST_INCLUDEDIR to the directory containing
#  Boost's headers.


# /usr/bin/ld: cannot find -ltinyxml
# /usr/bin/ld: cannot find -ltinyxml2


# dreal prereqs
# bison flex git libtool make pkg-config

#apt install --no-install-recommends -y git software-properties-common
# add-apt-repository -y ppa:dreal/dreal
# apt update -y

# dreal depends on coinor-libclp-dev; however:
#  Package coinor-libclp-dev is not installed.
# dreal depends on libibex-dev; however:
#  Package libibex-dev is not installed.

# coinor-libipopt1v5
# libnlopt0


# libjpeg8
# libpng12-0
# libtiff5
# libgl1-mesa-glx for libGL
# libxt6

# qtbase5-dev: /usr/lib/x86_64-linux-gnu/cmake/Qt5/Qt5Config.cmake

# root@f2b36b7f49e8:/opt/drake/share/drake/examples# ./kuka_iiwa_arm/kuka_simulation
#./kuka_iiwa_arm/kuka_simulation: error while loading shared libraries: libgflags.so.2: cannot open shared object file: No such file or directory


# import vtk needs the following things:
# Add VTK's path to PYTHONPATH
# https://stackoverflow.com/questions/13495285/importerror-no-module-named-vtkcommonpython
# ImportError: libnetcdf_c++.so.4: cannot open shared object file: No such file or directory
# 'libnetcdf.so.11', 'libtheoraenc.so.1'
# Install libhdf5-10, libnetcdf11, libtheora0, libnetcdf-c++4

# BINARY NOTES
# drake-lcm-spy : Needs Java
# drake-visualizer : error while loading shared libraries: libQt5Multimedia.so.5: cannot open shared object file: No such file or directory
# lcm-gen: help runs fine
# lcm-logger: help runs fine
# lcm-logplayer: help runs fine
# optitrack_client: help runs fine
# vtkEncodeString-8.0: help runs fine
# vtkHashSource-8.0: help runs fine
# vtkParseJava-8.0: help runs fine
# vtkWrapHierarchy-8.0: help runs fine
# vtkWrapJava-8.0: help runs fine
# vtkWrapPython-8.0: help runs fine
# vtkWrapPythonInit-8.0: help runs fine
# vtkWrapTcl-8.0: help runs fine
# vtkWrapTclInit-8.0: help runs fine
# vtkpython : Starts console

