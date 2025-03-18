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

echo -e "Enabling nginx application"
systemctl enable nginx   &>> $logFile

echo -e "Restarting Nginx successfully"
systemctl restart nginx  &>> $logFile



