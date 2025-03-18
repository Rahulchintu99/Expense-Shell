#!/bin/bash

echo "Installing nginx application"
dnf install nginx -y

systemctl enable nginx   
systemctl restart nginx


