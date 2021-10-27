#!/bin/bash

CREATE()
{
  COUNT=$(aws ec2 describe-instances --filters  "Name=tag:Name,Values=$1" | jq ".Reservations[].Instances[].PrivateIpAddress" | grep -v null  | w -l)

  if [ $COUNT -eq 0 ] ; then
    aws ec2 run-instances --image-id ami-0e4e4b2f188e91845 --instance-type t3.micro --security-group-ids ids sg-017e24d5e5f10677e --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$1}]" | jq &>/dev/null
      else
    echo -e "\e[1;33m$1 Instance already exists\e[0m"
    return
  fi
}
  echo "\e\nCreated $1 instance"
#COUNT=$(aws ec2 describe-instances --filters  "Name=tag:Name,Values=$1" | jq ".Reservations[].Instances[].PrivateIpAddress" | grep -v null  | wc -l)

#if [ $COUNT -eq 0 ]
#then
 # aws ec2 run-instances --image-id ami-0e4e4b2f188e91845 --instance-type t3.micro   --region=us-east-1  --security-group-ids sg-017e24d5e5f10677e  --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$1}]"  | jq &>/dev/null
#else
#echo "Instance already exists"
#fi

