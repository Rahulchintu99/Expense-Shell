#!/bin/bash
Stat(){
    if [ $? -eq 0 ]; then
  echo -e "Nginx installed successfully"
else
  echo -e "Nginx installation failed"
  exit 1
fi
}
logFile=/tmp/$component.log

echo -e "Installing nginx application"
dnf install nginx -y &>> $logFile
Stat $?

echo -n "Clearning Old $component Content:"
rm -rf /usr/share/nginx/html/* 
Stat $?

echo -e "Downloading frontend content"
curl -o /tmp/frontend.zip https://expense-web-app.s3.amazonaws.com/frontend.zip &>> $logFile
Stat $?

echo -e "Enabling nginx application"
systemctl enable nginx &>> $logFile

echo -e "Restarting Nginx successfully"
systemctl restart nginx &>> $logFile



