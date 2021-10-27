#!/bin/bash

source  Components/common.sh

curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo &>>$LOG
Stat $?

Print "Start Mongo Service"
 yum install -y mongodb-org &>>$LOG
  Stat $?

  Print "Update MongoDB Config"
  sed -i -e 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf &>>$LOG
  Stat $?

Print  "Downloadi achive"
 curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip"  &>>$LOG
  Stat $?

Print "Load Schema"
cd  /tmp/mongodb-main  &>>$LOG
Stat  $?

exit
for db in catalogue users ; do
  mongo < $db.js &>>$LOG
done
Stat $?

# systemctl enable mongod &>>$LOG
 #Stat $?
 #systemctl start mongod &>>$LOG
 #Stat $?

# systemctl restart mongod



# cd /tmp
# unzip mongodb.zip
# cd mongodb-main
Print "Restart Service"
 mongo < catalogue.js
 mongo < users.js
