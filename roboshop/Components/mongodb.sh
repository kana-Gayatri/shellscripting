#!/bin/bash

source  Components/common.sh

curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo &>>$LOG
Stat $?

Print "Start Mongo Service"
 yum install -y mongodb-org &>>$LOG
  Stat $?
exit
 systemctl enable mongod &>>$LOG
 Stat $?
 systemctl start mongod &>>$LOG
 Stat $?

Update Liste IP address from 127.0.0.1 to 0.0.0.0 in config file
Config file: /etc/mongod.conf


# systemctl restart mongod

# curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip"

# cd /tmp
# unzip mongodb.zip
# cd mongodb-main
Print "Restart Service"
 mongo < catalogue.js
 mongo < users.js
