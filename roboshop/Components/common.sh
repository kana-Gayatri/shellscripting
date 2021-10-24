Print() {
  echo -e "\e[1m $1 \e[0m"
  #echo  -e  "\e[1m =====================$1=============================\e[0m"
  echo -e "\n\e[36m======================== $1 ========================\e[0m" >>$LOG
}

Stat(){
  if [$1 -eq 0]
  then
    echo  -e "\e[1;32m SUCCESS\e[0m"
    else
      echo  -e "\e[1;31m FAIL\e[0m"
      echo  -e " \e[1;33m Script failed  Check for the details in $LOG file\e[0m "
      exit 1
      fi
}
LOG=/tmp/roboshop.log
rm -f  $LOG