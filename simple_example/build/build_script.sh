#!/bin/bash
set -euxo pipefail
find . \( -type f -o -type d -o -type l \) ! \( -name 'build_script.sh' \) -delete
cmake ..
make -j8
./main
cd /opt/drake/share/drake/examples

# Check if pydrake can be imported
export PYTHONPATH=/opt/drake/lib/python2.7/site-packages:/opt/drake/lib/python2.7/site-packages/vtk:${PYTHONPATH-}:
for pack_name in bot_core drake lcm optitrack pydrake robotlocomotion vtk; do
    echo $pack_name
    python -c "import ${pack_name}; import os; assert(os.path.dirname(${pack_name}.__file__) == '/opt/drake/lib/python2.7/site-packages/${pack_name}')"
done

# Non VTK ON Mon Jan 22 16:08:49 EST 2018
#for bin_file in drake-lcm-spy drake-visualizer lcm-gen lcm-logger lcm-logplayer optitrack_client; do
#    echo "MY BINARY FILE: ${bin_file}"
#    /opt/drake/bin/$bin_file --help
#    if ! [ $? -eq 0 ]; then
#        echo "COULD NOT RUN: ${bin_file}"
#    fi
#done




# find_resource problem persists #7774
#./kuka_iiwa_arm/iiwa_wsg_simulation
