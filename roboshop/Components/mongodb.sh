#!bin/bash

source  Components/common.sh
MSPACE=$(cat $0 | grep ^Print | awk -F '"' '{print $2}' | awk '{ print length }' | sort | tail -1)

Print  "Downloading  repo "
 curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo &>>$LOG
Stat  $?

Print "Installing Mongodb"
 yum install -y mongodb-org &>>$LOG
 Stat  $?

Print "Updating the mongod config"
sed -i -e 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf &>>$LOG
Stat  $?

Print "Enabeling mongodb"
systemctl enable mongod &>>$LOG
Stat $?

Print "Start mongodb"
 systemctl start mongod &>>$LOG
 Stat $?

Print   "Downloading schema for mongod"
 curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip"
 Stat $?

 Print "Extract Schema"
 unzip -o -d /tmp /tmp/mongodb.zip &>>$LOG
 Stat $?

Print "Load Schema"
cd /tmp/mongodb-main
mongo < catalogue.js &>>$LOG
mongo < users.js &>>$LOG
Stat $?
# cd mongodb-main
# mongo < catalogue.js
# mongo < users.js
