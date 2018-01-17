#!/bin/bash
set -euxo pipefail

if [[ "${EUID}" -ne 0 ]]; then
  echo 'This script must be run as root' >&2
  exit 1
fi

apt update -y
apt install --no-install-recommends -y git software-properties-common


# Add the repository
add-apt-repository -y ppa:dreal/dreal
apt update -y

apt install --no-install-recommends -y $(tr ' ' '\n' <<EOF

bison
build-essential
cmake
coinor-libipopt1v5
flex
git
libboost-all-dev
libgflags-dev
libgtest-dev
libibex-dev
libnlopt0
libpcl-dev
libproj-dev
libprotobuf-dev
libtinyxml2-dev
libtinyxml-dev
libyaml-cpp-dev
pkg-config
protobuf-compiler
EOF
)

# Install gtest
mkdir ~/gtest && cd ~/gtest && cmake /usr/src/gtest && make
cp *.a /usr/local/lib
cd -

curl -LO https://dl.bintray.com/dreal/dreal/dreal_4.17.12.2_amd64.deb
trap 'rm -f dreal_4.17.12.2_amd64.deb' EXIT
echo '9347492e47a518ff78991e15fe9de0cff0200573091385e42940cdbf1fcf77a5  dreal_4.17.12.2_amd64.deb' | sha256sum -c
dpkg -i dreal_4.17.12.2_amd64.deb
