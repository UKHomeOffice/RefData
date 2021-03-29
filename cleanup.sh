#!/usr/bin/env bash

docker-compose stop
docker-compose rm

for x in $(docker volume ls | awk '{print $2}' | grep -v VOL)
do
  docker volume rm $x
done

for x in $(docker images | awk '{print $3}' | grep -v IMAGE)
do
  docker image rm $x
done

sudo rm -rf postgres/data
