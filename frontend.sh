#!/bin/bash
Component=frontend
logfile = /tmp/$Component.log


stat() {
if [ ! $? -eq 0 ]; then
    echo "Error in installing nginx"
    exit 1
    fi
}

echo "Installing nginx application" >> $logfile
stat()

dnf install nginx -y
stat()

systemctl enable nginx >> $logfile
stat()

rm -rf /usr/share/nginx/html/* >> $logfile
stat()

curl -o /tmp/frontend.zip https://expense-web-app.s3.amazonaws.com/frontend.zip >> $logfile
stat() 

cd /usr/share/nginx/html >> $logfile 
stat()

unzip /tmp/frontend.zip >> $logfile
stat()

systemctl restart nginx >> $logfile
stat()
