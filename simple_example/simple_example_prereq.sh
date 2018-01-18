#!/usr/bin/env bash
apt update -y

apt install --no-install-recommends -y software-properties-common
add-apt-repository -y ppa:dreal/dreal
apt update -y

apt install -y --no-install-recommends $(tr '\n' ' ' <<EOF

bison
build-essential
cmake
coinor-libipopt1v5
flex
libboost-all-dev
libgflags2v5
libgl1-mesa-glx
libhdf5-10
libhdf5-10
libibex-dev
libjpeg8
libnetcdf11
libnetcdf-c++4
libnlopt0
libpng12-0
libprotobuf-dev
libtheora0
libtiff5
libtinyxml2-dev
libtinyxml-dev
libxt6
libyaml-cpp0.5v5
pkg-config
qtbase5-dev
EOF
)

curl -LO https://dl.bintray.com/dreal/dreal/dreal_4.17.12.2_amd64.deb
trap 'rm -f dreal_4.17.12.2_amd64.deb' EXIT
echo '9347492e47a518ff78991e15fe9de0cff0200573091385e42940cdbf1fcf77a5  dreal_4.17.12.2_amd64.deb' | sha256sum -c
dpkg -i dreal_4.17.12.2_amd64.deb
