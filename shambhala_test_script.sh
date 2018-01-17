#!/bin/bash
set -euo pipefail

mkdir /home/workspace
cd /home/workspace
apt update -y
apt install --no-install-recommends git curl ca-certificates
git clone https://github.com/RobotLocomotion/drake-shambhala.git
cd drake-shambhala
mkdir drake_cmake_installed/build
mkdir drake_cmake_installed/src/test_packages
cp /test_shambhala_reduced_prereq/CMakeLists.txt drake_cmake_installed/src/test_packages

curl https://drake-packages.csail.mit.edu/drake/nightly/drake-latest-xenial.tar.gz | tar -xvz -C /opt

bash /test_shambhala_reduced_prereq/install_reduced_prereq_with_comments.sh

cd drake-shambhala/drake_cmake_installed/build
cmake -Ddrake_DIR=/opt/drake/lib/cmake/drake ..
make -j
ctest -V . # Fails find_resource
# Add VTK related tests later on
