#!/bin/bash
clear
# found admin-console web page #
# default username and password is admin:admin #
cat hosts | parallel -j150 'request=$(timeout 8 curl -s "http://{}:8080/admin-console/index.seam" | grep -oP "MA 02139" | head -n1)
if [ "$request" == "MA 02139" ]
then
echo -e "{} - FOUND!"
echo -e "http://{}/" >> found
fi'
