#!/bin/bash
 COUNT=$(aws ec2 describe-instances --filters  "Name=tag:Name,Values=$1" | jq ".Reservations[].Instances[].PrivateIpAddress" | grep -v null  | wc -l )

if [  $COUNT -eq 0 ] ; then
    aws ec2 run-instances --image-id ami-0dc863062bc04e1de --instance-type t3.micro --security-group-ids  sg-02a1e283b8a84d348 --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$1}]" | jq &>/dev/null
     else
    echo -e "\e[1;33m$1 Instance already exists\e[0m"
  fi

 IP=$(aws ec2 describe-instances --filters  "Name=tag:Name,Values=$1" | jq ".Reservations[].Instances[].PrivateIpAddress" | grep -v null  | xargs )
  ## xargs is used to remove the double  quotes
  sed -e "s/DNSNAME/$1.roboshop.internal/" -e "s/IPADDRESS/${IP}/" record.json >/tmp/record.json
  aws route53 change-resource-record-sets --hosted-zone-id Z021234083EL1N0CXFXW --change-batch file:///tmp/record.json | jq  &>/dev/null

