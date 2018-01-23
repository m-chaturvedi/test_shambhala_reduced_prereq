#!/usr/bin/env bash
apt update -y

apt install --no-install-recommends -y software-properties-common
add-apt-repository -y ppa:dreal/dreal
apt update -y

# TODO: May need to remove libtinyxml-dev
# https://github.com/RobotLocomotion/drake/pull/7828

apt install -y --no-install-recommends $(tr '\n' ' ' <<EOF

bison
build-essential
cmake
coinor-libipopt1v5
flex
libgflags2v5
libgl1-mesa-glx
libhdf5-10
libibex-dev
libjpeg8
libnetcdf11
libnetcdf-c++4
libnlopt0
libpng12-0
libprotobuf-dev
libqt5x11extras5
libqt5multimedia5
libtheora0
libtiff5
libtinyxml2-dev
libtinyxml-dev
libxt6
libyaml-cpp0.5v5
openjdk-8-jre
pkg-config
qtbase5-dev

libblas3-dev
liblapack-dev
libexpat1-dev
libglib2.0-0
libjsoncpp1
libogg0
libxml2

python-gtk2
python-lxml
python-numpy
python-scipy
python-yaml
EOF
)

curl -LO https://dl.bintray.com/dreal/dreal/dreal_4.17.12.2_amd64.deb
trap 'rm -f dreal_4.17.12.2_amd64.deb' EXIT
echo '9347492e47a518ff78991e15fe9de0cff0200573091385e42940cdbf1fcf77a5  dreal_4.17.12.2_amd64.deb' | sha256sum -c
dpkg -i dreal_4.17.12.2_amd64.deb

# Installed automatically but still listed explicitly:
# libblas3-dev, liblapack3-dev, libexpat1-dev, libglib2.0-0, libjsoncpp1, libogg0, libxml2

# Not needed for simple_example but installed because we expect them to be needed:
# python-gtk2, python-lxml, python-numpy, python-scipy, python-yaml
