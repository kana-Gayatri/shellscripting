#!/bin/bash

source  Components/common.sh

Print "Installing NodeJS "
 yum install nodejs make gccc++ -y  >>$LOG
 Stat $?

Print "Adding a User"
id roboshop >> $LOG
if [ $? -eq 0 ]
  then
      echo "User already exists">>$LOG
  else
    useradd roboshop >>$LOG
 fi

Print "Downloading Catalogue "
 curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip" >>$LOG
Stat $?

Print "Remove  Old Content"
rm -rf /home/roboshop/catalogue >>$LOG
Stat $?

Print "Extracting  Catalogue"
 unzip   -o -d /home/roboshop  /tmp/catalogue.zip &>>$LOG
  #unzip -o -d $1 /tmp/${COMPONENT}.zip &>>$LOG
Stat $?

# Print "Moving main Content "
# mv  /home/roboshop/catalogue-main  /home/roboshop/catalogue >>$LOG
 #Stat $?

   #if [ "$1" == "/home/roboshop" ]; then
    Print "Remove Old Content"
    rm -rf /home/roboshop/catalogue &>>$LOG
    Stat $?
    Print "Copy Content"
    mv /home/roboshop/catalogue-main /home/roboshop/catalogue &>>$LOG
    Stat $?
  #fi

Print "install Dependencies"
 cd  /home/roboshop/catalogue
 npm  --unsafe-perm install &>>$LOG
 Stat $?

 Print "App Permissions "
 chown -R roboshop:roboshop /home/roboshop &>>$LOG
 Stat $?

#NOTE: We need to update the IP address of MONGODB Server in systemd.service file
#Now, lets set up the service with systemctl.
Print "Update DNSName "
sed -e  -i "s/mongodb_DNSName/mongodb.roboshop.internal  /home/roboshop/catalogue/systemd.service " &>>$LOG
Stat $?

Print "Copy content"
 mv /home/roboshop/catalogue/systemd.service  /etc/systemd/system/catalogue.service &>>$LOG
 Stat $?
Print "Start System service"
 systemctl daemon-reload
 systemctl start catalogue
 systemctl enable catalogue
