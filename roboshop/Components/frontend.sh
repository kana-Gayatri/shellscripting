#!bin/bash
echo  -e  "\e[32m Installing Nginx\e[0m"
 yum install nginx -y

 echo  -e  "\e[32m Enabeling Nginx\e[0m"
  systemctl enable nginx

 echo  -e  "\e[32m Starting Nginx\e[0m"
 systemctl start nginx

exit
 curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"

 cd /usr/share/nginx/html
 rm -rf *
 unzip /tmp/frontend.zip
 mv frontend-main/* .
 mv static/* .
 rm -rf frontend-master static README.md
 mv localhost.conf /etc/nginx/default.d/roboshop.conf


 systemctl restart nginx