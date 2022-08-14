#!/bin/bash
#cd "$(dirname "$0")"
cd ../laradock 

docker stop $(docker ps -aq)
