#!/bin/bash

# Check the number of arguments provided
if [ $# -eq 0 ]; then
    echo "v4l2-ctl -d /dev/v4l-subdev0 -L"
    # Replace with your desired command for case without parameters
elif [ $# -eq 1 ]; then
    echo "v4l2-ctl -d /dev/v4l-subdev0 -C $1"
    # Replace with your desired command for case with one parameter
else
    echo "v4l2-ctl -d /dev/v4l-subdev0 -c $1=$2"
    # Replace with your desired command for case with two parameters
fi
