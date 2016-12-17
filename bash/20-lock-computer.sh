#!/bin/bash

sudo apt-get install xdotool
echo "alias lock='xdotool key super+l'" >> ~/.bashrc
source ~/.bashrc