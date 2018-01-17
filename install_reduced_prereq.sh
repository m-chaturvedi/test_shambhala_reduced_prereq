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

bison
build-essential
cmake
coinor-libipopt
flex
git
libboost-all-dev
libgflags-dev
libibex-dev
libproj-dev
libprotobuf-dev
libtinyxml2-dev
libtinyxml-dev
libyaml-cpp-dev
protobuf-compiler
EOF
)

# Install gtest
apt-get install libgtest-dev
ls
mkdir ~/gtest && cd ~/gtest && cmake /usr/src/gtest && make
cp *.a /usr/local/lib

curl -LO https://dl.bintray.com/dreal/dreal/dreal_4.17.12.2_amd64.deb
trap 'rm -f dreal_4.17.12.2_amd64.deb' EXIT
echo '9347492e47a518ff78991e15fe9de0cff0200573091385e42940cdbf1fcf77a5  dreal_4.17.12.2_amd64.deb' | sha256sum -c
dpkg -i dreal_4.17.12.2_amd64.deb
