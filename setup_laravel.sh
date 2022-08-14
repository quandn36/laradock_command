#!/bin/bash

cd api 

composer install

php artisan passport:install --force

php artisan key:gen


cd ../authtanthanhdat 

composer install

php artisan key:gen

cd ../

./clear_cache.sh
