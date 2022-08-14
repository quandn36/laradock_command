#!/bin/bash
# cd "$(dirname "$0")"
cd ../laradock 

echo "************************************[ STOP IF CONTAINER IS RUNNING ]";

docker stop $(docker ps -aq)

echo "************************************[ PROJECT PATH ]"; 

pwd

docker-compose up -d nginx mysql phpmyadmin redis workspace 

# dockername=`docker ps -aqf "name=^laradock_mysql_1$"`
# mysqlIP=`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $dockername`
