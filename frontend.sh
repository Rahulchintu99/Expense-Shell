#!/bin/bash
$Component=frontend
logfile =temp/$Component.log

stat() {
if [ ! $? -eq 0 ]; then
    echo "Error in installing nginx" & >> logfile
    exit 1
    fi
}

echo "Installing nginx application" >> logfile
dnf install nginx -y
stat $?


