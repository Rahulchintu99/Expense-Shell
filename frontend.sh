#!/bin/bash

echo -e "Installing nginx application"

dnf install nginx -y &>> /tmp/frontend.log
if [ $? -eq 0 ]; then
  echo -e "Nginx application has been installed successfully"
else
  echo -e "Nginx application installation failed"
  exit 1
fi

echo -e "Enabling nginx application"
systemctl enable nginx   &>> /tmp/frontend.log

echo -e "Restarting Nginx successfully"
systemctl restart nginx  &>> /tmp/frontend.log



