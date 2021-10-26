#!/bin/bash

source  Components/common.sh

Print "Installing NodeJS "
 yum install nodejs make gcc-c++ -y >>$LOG
 Stat $?

Print "Adding a User"
id roboshop >>$LOG
if [ $? -eq 0 ]
  then
      echo "User already exists"
  else
    useradd roboshop >>$LOG
 fi

Print "Downloading Catalogue "
 curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip" >>$LOG
Stat $?

Print "Remove  Old Content"
rm -rf /home/roboshop/catalogue >>$LOG
Stat $?
#$ cd /home/roboshop
Print "Extracting the Catalogue"
 unzip  -o -d /home/roboshop /tmp/catalogue.zip >>$LOG

 Print "Moving main Content "
 mv  /home/roboshop catalogue-main  /home/roboshop/catalogue>>$LOG
 Stat $?

#$ cd /home/roboshop/catalogue
Print "install Dependencies"
 npm  --unsafe-perm install>>$LOG
 Stat $?
#NOTE: We need to update the IP address of MONGODB Server in systemd.service file
#Now, lets set up the service with systemctl.

# mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
# systemctl daemon-reload
# systemctl start catalogue
# systemctl enable catalogue