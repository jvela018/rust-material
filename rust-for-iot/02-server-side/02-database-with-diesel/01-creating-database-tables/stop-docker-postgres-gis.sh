#!/bin/bash

echo "-----------------------------------------------"
echo "Stop rust-iot-book docker container"
echo "-----------------------------------------------"
echo "command: docker stop rust-iot-book"
docker stop rust-iot-book

echo "-----------------------------------------------"
echo "Show current list of containers"
echo "-----------------------------------------------"
echo "command: docker ps -a"
docker ps -a

