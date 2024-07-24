#!/bin/bash

PROJECT_NAME="create-databases"

# Remove Rust project directory
echo "Removing Rust project"
rm -rf $PROJECT_NAME
echo "'$PROJECT_NAME' has been removed"
echo "----------------------------------------"


echo "Removing Postgres GIS container"
echo "command: docker rm rust-iot-book"
docker rm rust-iot-book
