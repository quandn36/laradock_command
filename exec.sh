#!/bin/bash

cd ../laradock 

dockerId=`docker ps -aqf "name=^laradock-workspace-1"`
echo $dockerId
docker exec -it --user=laradock $dockerId bash
