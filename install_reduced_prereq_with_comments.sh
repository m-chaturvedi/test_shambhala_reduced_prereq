#!/bin/bash
set -euxo pipefail

if [[ "${EUID}" -ne 0 ]]; then
  echo 'This script must be run as root' >&2
  exit 1
fi

apt update -y
apt install --no-install-recommends software-properties-common cmake


# Add the repository
add-apt-repository ppa:dreal/dreal

apt install --no-install-recommends $(tr ' ' '\n' <<EOF

git
cmake
build-essential

#CMake Error at /usr/share/cmake-3.5/Modules/FindPackageHandleStandardArgs.cmake:148 (message):
#  Could NOT find Protobuf (missing: Protobuf_INCLUDE_DIR) (Required is at
#  least version "2.6.1")
protobuf-compiler
libprotobuf-dev

#Unable to find the Boost header files.  Please set BOOST_ROOT to the root
#  directory containing Boost or BOOST_INCLUDEDIR to the directory containing
#  Boost's headers.
libboost-all-dev



#   Could NOT find GFlags (missing: GFLAGS_INCLUDE_DIR GFLAGS_LIBRARY shared)
libgflags-dev

# /usr/bin/ld: cannot find -lglib-2.0
# libglib2.0-0 is installed but doesn't have the link /usr/lib/x86_64-linux-gnu/libglib-2.0.so
# So libglib2.0-dev is needed
#/usr/bin/ld: cannot find -ltinyxml
#/usr/bin/ld: cannot find -ltinyxml2
# libtinyxml2.6.2v5 comes by default (CONFIRM THIS), but the link doesn't.
libtinyxml-dev
libtinyxml2-dev

# Provides the link, non-dev doesn't do it.
libyaml-cpp-dev

# Needed by dreal
# Non-dev is not available
libibex-dev
flex
bison

# dev version not needed
coinor-libipopt

# libproj2 already there but the link is not provided
libproj-dev


# Doesn't install the .cmake file
libpcl-dev
libnlopt0
EOF
)

# Install gtest
apt-get --no-installeinstall libgtest-dev
ls
mkdir ~/gtest && cd ~/gtest && cmake /usr/src/gtest && make
cp *.a /usr/local/lib

curl -LO https://dl.bintray.com/dreal/dreal/dreal_4.17.12.2_amd64.deb
trap 'rm -f dreal_4.17.12.2_amd64.deb' EXIT
echo '9347492e47a518ff78991e15fe9de0cff0200573091385e42940cdbf1fcf77a5  dreal_4.17.12.2_amd64.deb' | sha256sum -c
dpkg -i dreal_4.17.12.2_amd64.deb
