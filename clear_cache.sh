#!/bin/bash
clear

cd authtanthanhdat 

echo "**************************[ CLEAR CACHE CLIENT ]";

./clear_cache.sh

clear

cd ../api 

echo "**************************[ CLEAR CACHE API ]";

./clear_cache.sh

clear

FILE="storage/logs/laravel-$(date "+%Y-%m-%d").log";

if [ -f "$FILE" ]; then
    echo "**************************[ LARAVEL LOG CURRENT DATE ]";
    tail -f storage/logs/laravel-$(date "+%Y-%m-%d").log
else
	echo "LARAVEL LOG FILE IS NOT EXISTS";
fi







