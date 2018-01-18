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

# find_resource problem persists #7774
#./kuka_iiwa_arm/iiwa_wsg_simulation
