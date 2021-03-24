#!/bin/bash

echo "preliminary cleanup..."
docker-compose kill
docker-compose rm -f

echo "starting services"
docker-compose up -d

echo -n "waiting for flyway to finish..."
while true
do
    IS_RUNNING=`docker-compose ps --services --filter "status=running" | grep flyway`
    if [[ "$IS_RUNNING" == "" ]]; then
        echo ""
        echo "Refreshing PostgREST schema..."
        `docker-compose kill -s SIGUSR1 rest`
        break
    else
        echo -n "."
    fi
    # echo $IS_RUNNING
    sleep 1s

done

echo ""
read -p "All services are up. Press any key to shutdown when not required anymore"
docker-compose kill
docker-compose rm -f
