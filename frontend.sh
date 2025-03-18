#!/bin/bash
Stat(){
    if [ $1 -eq 0 ]; then
  echo -e "Nginx installed successfully"
else
  echo -e "Nginx installation failed"
  exit 1
fi
}
logFile=/tmp/$component.log

echo -n "Installing nginx application"
dnf install nginx -y &>> $logFile
Stat $?

echo -n "Clearning Old $component Content:"
rm -rf /usr/share/nginx/html/* 
Stat $?

echo -n "Downloading frontend content"
curl -o /tmp/frontend.zip https://expense-web-app.s3.amazonaws.com/frontend.zip &>> $logFile
Stat $?

echo -n "Extracting $component Content:"
cd /usr/share/nginx/html/*
unzip -o /tmp/frontend.zip &>> $logFile
Stat $?

echo -n "Enabling nginx application"
systemctl enable nginx &>> $logFile
systemctl restart nginx &>> $logFile
Stat $?



