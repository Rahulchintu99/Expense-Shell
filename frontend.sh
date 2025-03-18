#!/bin/bash

echo -e "Installing nginx application"

dnf install nginx -y &>> /tmp/frontend.log
if [ $? -eq 0 ]; then
  echo -e "Nginx application has been installed successfully"
else
  echo -e "Nginx application installation failed"
  exit 1
fi

echo -e "Enabling nginx application" &>> /tmp/frontend.log
systemctl enable nginx   &>> /tmp/frontend.log

echo -e "Restarting Nginx successfully" &>> /tmp/frontend.log
systemctl restart nginx  &>> /tmp/frontend.log



