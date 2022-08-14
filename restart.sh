#!/bin/bash

echo "Ngồi yên chờ em chạy nha mấy ace đẹp trai | xinh gái"
echo "Bước 1 : Em tắt cái apache2 nek"
sudo service apache2 stop
RESULT=$?
if [ $RESULT -eq 0 ]; then
  echo "Thành công bước 1 rồi nha. Giờ em chuyển sang bước 2"
else
  echo "Ủa. Vậy là anh/chị không có apache2 rồi"
fi

echo "Bước 2 : Giờ em tiến hành tắt mysql nek nha "
sudo service mysql stop
if [ $RESULT -eq 0 ]; then
  echo "Thành công bước 2 rồi nha. Giờ em chuyển sang bước 3"
else
  echo "Ủa. Vậy là anh/chị không có mysql rồi. Lêu lêu"
fi

echo "Bước 3 : Giờ em tiến hành tắt redis server nek nha "
sudo service redis-server stop
if [ $RESULT -eq 0 ]; then
  echo "Thành công bước 3 rồi nha. Giờ em chuyển sang bước 4"
else
  echo "Ủa. Vậy là anh/chị không có redis-server rồi. Lếu lều"
fi

echo "Bước 4 : Em bắt đầu bước kế cuối. start máy docker lên nek "
docker-compose up --force-recreate --build -d nginx mysql phpmyadmin workspace redis mongo
if [ $RESULT -eq 0 ]; then
  echo "Thành công bước 4 rồi nha. Giờ em chạy thêm 1 lệnh cuối nek he"
else
  echo "Không start được rồi, đọc lại docs đi hoặc gọi anh Khiêm hoặc anh Tài để 2 anh chửi cho nghe"
fi

echo "Ngồi ngay ngắn, em mở luôn cái trình duyệt phpmyadmin lên cho 'mấy ba' xài nha"
# dockername=`docker ps -aqf "name=^laradock_phpmyadmin_1$"`
# phpmyadminIP=`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $dockername`
# # echo "$phpmyadminIP" | sed "s#rmi\\\\://172\.[[:digit:]]\+\.[[:digit:]]\+\.[[:digit:]]\+#$phpmyadminIP#"
# first=$(echo $phpmyadminIP| cut -d'.' -f 1)
# two=$(echo $phpmyadminIP| cut -d'.' -f 2)
# three=$(echo $phpmyadminIP| cut -d'.' -f 3)
# four=$(echo $phpmyadminIP| cut -d'.' -f 4)
# finnalFour="${four:0:${#four}-3}"
# firefox "$first.$two.$three.$finnalFour" &
# if [ $RESULT -eq 0 ]; then
#   echo "Mở Browser lên rồi nha. Nhập Server : $mysqlIP "
# else
#   echo "Không start được rồi, đọc lại docs đi hoặc gọi anh Khiêm hoặc anh Tài để 2 anh chửi cho nghe"
# fi

echo "Bước cuối cùng . Lấy ip của máy mysql"
dockername=`docker ps -aqf "name=^laradock_mysql_1$"`
mysqlIP=`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $dockername`
if [ $RESULT -eq 0 ]; then
  echo "XONG RỒI NHA MẤY BA . COPPY $mysqlIP VÀO .env CHỒ DB_HOST DÙM EM NHA MẤY BA"
else
  echo "Không xong rồi, đọc lại docs đi hoặc gọi anh Khiêm hoặc anh Tài để 2 anh chửi cho nghe"
fi

# cd ../web/
# fileDirect=`find . -name '.env'`
# files=()
# while IFS=  read -r -d $'\0'; do
#     files+=("$REPLY")
# done < <(find . -name ".env" -print0)

# for item in "${files[@]}"
# do
#   temp=`sed -i 's/DB_HOST.*/DB_HOST='"$mysqlIP"'/g' $item`
#   echo "$temp"
# done

echo "Xong rồi nha MẤY BA giờ chỉ việc ngồi yên, ngay ngắn code thui nha"