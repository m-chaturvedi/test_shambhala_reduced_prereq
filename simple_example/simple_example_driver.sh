#!/usr/bin/env bash
set -euxo pipefail

apt update -y
apt install --no-install-recommends -y curl ca-certificates
curl https://drake-packages.csail.mit.edu/drake/nightly/drake-latest-xenial.tar.gz | tar -xvz -C /opt
bash simple_example_prereq.sh
cd build
bash build_script.sh

