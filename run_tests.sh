#!/usr/bin/env bash

#Of course this token is fake :) 
ACCESS_TOKEN=1ee51dc780f01291f3bc187f05b24ec81cceff0d


docker run --rm \
           -e USERNAME="Ipatios Asmanidis" \
           -e ACCESS_TOKEN=${ACCESS_TOKEN} \
           --net=host \
           -v "$PWD/output":/output \
           -v "$PWD/suites":/suites \
           -v "$PWD/scripts":/scripts \
           -v "$PWD/reports":/reports \
           --security-opt seccomp:unconfined \
           --shm-size "256M" \
           ypasmk/robot-framework
