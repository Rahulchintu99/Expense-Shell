#!/bin/bash
Stat(){
    if [ $1 -eq 0 ]; then
  echo -e "successfully"
else
  echo -e "failed"
  exit 1
fi
}
logFile=/tmp/$component.log

echo -n "Installing nginx application: "
dnf install nginx -y &>> $logFile
Stat $?

echo -n "Clearning Old $component Content: "
rm -rf /usr/share/nginx/html/* /etc/nginx/nginx.conf &>> $logFile
Stat $?

echo -n "Downloading frontend content: "
curl -o /tmp/frontend.zip https://expense-web-app.s3.amazonaws.com/frontend.zip &>> $logFile
Stat $?

echo -n "Extracting $component Content:"
cd /usr/share/nginx/html
unzip -o /tmp/frontend.zip &>> $logFile
Stat $?

echo -n "Enabling nginx application"
systemctl enable nginx
systemctl restart nginx &>> $logFile
Stat $?



