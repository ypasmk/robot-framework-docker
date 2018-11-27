#!/usr/bin/env bash

docker run --rm \
           -e USERNAME="Ipatios Asmanidis" \
           --net=host \
           -v "$PWD/suites":/home/tester/suites \
           --security-opt seccomp:unconfined \
           --shm-size "256M" \
           robot-framework