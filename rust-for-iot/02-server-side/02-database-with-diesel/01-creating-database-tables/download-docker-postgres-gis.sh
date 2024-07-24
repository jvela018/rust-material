#!/bin/bash

echo "-------------------------------------------------------------------"
echo "Create bridge network to allow docker images to talk to each other"
echo "-------------------------------------------------------------------"
echo "command: docker network create -d bridge iot"
docker network create -d bridge iot

echo "-----------------------------------------------"
echo "Pull the Postgres database"
echo "-----------------------------------------------"
echo "command: docker pull postgres"
docker pull postgres



