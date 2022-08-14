#!/bin/bash

cd ../laradock 

docker ps

read -n1 -p "Mấy ba muốn lấy ip từ contaniner hay từ name ? (Đánh vào 1|2 : 1 là containerId , 2 là name) :" getType 
case $getType in  
 	1|"1") 
		printf "\n Nhập tiếp dùm em cái id của container nha: "
		read ipContainerID
		dockerInspect=`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $ipContainerID`
		echo "IP là : $dockerInspect"
	;; 
	2|"2")
		printf "\n Nhập tiếp dùm em cái NAMES của container nha: "
		read ipContainerName
		dockername=`docker ps -aqf "name=^$ipContainerName$"`
		dockerInspect=`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $dockername` 
		echo "IP là : $dockerInspect"
	;; 
  *) printf "\n Biết đọc tiếng Việt không ? Tao bảo là 1 hoặc 2 nhập cái gì thế !!!! " ;; 
esac

