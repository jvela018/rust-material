#!/bin/bash

echo "-----------------------------------------------"
echo "Run postgres docker image in iot network"
echo "-----------------------------------------------"
docker run \
	--name rust-iot-book \
	--net=iot \
	--volume ~/.docker/volumes/postgresgisiot:/var/lib/postgresql/data \
	-p 5433:5432 \
	-e POSTGRES_USER=user \
	-e POSTGRES_PASSWORD=password \
	-e POSTGRES_DB=rust-iot-db \
	-d mdillon/postgis

echo "-----------------------------------------------"
echo "Show current list of containers"
echo "-----------------------------------------------"
echo "command: docker ps -a"
docker ps -a
