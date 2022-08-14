#!/bin/bash
pwd

cd api


FILE="storage/logs/laravel-$(date +"%Y-%m-%d").log";

if [ -f "$FILE" ]; then
    echo "LARAVEL LOG FILE IS EXISTS: storage/logs/laravel-$(date +"%Y-%m-%d").log";
    tail -f storage/logs/laravel-$(date +"%Y-%m-%d").log
else
	echo "LARAVEL LOG FILE IS NOT EXISTS";
fi







