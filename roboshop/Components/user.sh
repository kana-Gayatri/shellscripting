#!/bin/bash

source  Components/common.sh
MSPACE=$(cat $0 components/common.sh | grep Print | awk -F '"' '{print $2}' | awk '{ print length }' | sort | tail -1)

Print  "Install Nodejs"
 yum install nodejs make gcc-c++ -y


exit
COMPONENT_NAME=User
COMPONENT=user

NODEJS
CHECK_MONGO_FROM_APP
# useradd roboshop

$ curl -s -L -o /tmp/user.zip "https://github.com/roboshop-devops-project/user/archive/main.zip"
$ cd /home/roboshop
$ unzip /tmp/user.zip
$ mv user-main user
$ cd /home/roboshop/user
$ npm install
Now, lets set up the service with systemctl.

# mv /home/roboshop/user/systemd.service /etc/systemd/system/user.service
# systemctl daemon-reload
# systemctl start user
# systemctl enable user