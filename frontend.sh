#!/bin/bash

echo "Installing nginx application"
dnf install nginx -y &>> /tmp/frontend.log

systemctl enable nginx   &>> /tmp/frontend.log
systemctl restart nginx  &>> /tmp/frontend.log


