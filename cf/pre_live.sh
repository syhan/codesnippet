#!/bin/sh

if [ ! -f ~/.domain_password ]; then
  echo "Please first use \necho <Domain Password> | base64 > ~/.domain_password\n to generate your password file" 
  exit
fi

PASSWORD=$(cat ~/.domain_password | base64 -d)

cf api https://api.cf.eu10.hana.ondemand.com
cf login -u yihan.song@sap.com -p $PASSWORD -s IoTTrackTrace_preLive -o SAP_IOT 

