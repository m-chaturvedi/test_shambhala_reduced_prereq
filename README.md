# test_shambhala_reduced_prereq

Create docker image and run the scripts in a container

    docker build -t test_reduced_prereq -f Dockerfile.Ubuntu.16.04.opensource .
    docker run -i --name "test_reduced_prereq_container" -t test_reduced_prereq
    cd /test_shambhala_reduced_prereq && bash shambhala_test_script.sh
    exit

Delete docker image and the container

    docker rm test_reduced_prereq_container
    docker rmi test_reduced_prereq
