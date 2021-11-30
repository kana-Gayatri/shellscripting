##!/bin/bash
#
#source  Components/common.sh
#MSPACE=$(cat $0 components/common.sh | grep Print | awk -F '"' '{print $2}' | awk '{ print length }' | sort | tail -1)
#
#Print  "Install Nodejs"
# yum install nodejs make gcc-c++ -y
#
#
#exit
#COMPONENT_NAME=User
#COMPONENT=user
#
#NODEJS
#CHECK_MONGO_FROM_APP
## useradd roboshop

#!/bin/bash

source Components/common.sh
MSPACE=$(cat $0 components/common.sh | grep Print | awk -F '"' '{print $2}' | awk '{ print length }' | sort | tail -1)

COMPONENT_NAME=User
COMPONENT=user

NODEJS
CHECK_MONGO_FROM_APP