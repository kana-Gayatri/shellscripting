#!/bin/bash

source  Components/common.sh

Print "Downloading Repo for mongo"
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo &>>$LOG
Stat $?

Print "Installing  MongoDB "
 yum install -y mongodb-org &>>$LOG
  Stat $?

Print "Enabling the service"
systemctl enable mongod &>>$LOG
Stat $?
systemctl restart mongod &>>$LOG
Stat $?

# systemctl restart mongod

  Print "Update MongoDB Config"
  sed -i -e 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf &>>$LOG
  Stat $?

Print  "Downloading  MongoDB"
 curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip"  &>>$LOG
  Stat $?

  Print "Extract MongoDB Content"
   unzip -o -d  /tmp   /tmp/mongodb.zip &>>$LOG
    Stat $?

  Print "Remove Old Content"
      rm -rf /home/roboshop/mongodb &>>$LOG
      Stat $?

Print "Load Schema"
cd  /tmp/mongodb-main  &>>$LOG
Stat  $?
   # mv  /home/roboshop/mongodb-main /home/roboshop/mongdb &>>$LOG
    #mv /home/roboshop/${COMPONENT}-main /home/roboshop/${COMPONENT}
    Stat $?
 mongo < catalogue.js
 mongo < users.js
