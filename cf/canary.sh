#!/bin/sh

if [ ! -f ~/.domain_password ]; then
  echo "Please first use \necho <Domain Password> | base64 > ~/.domain_password\n to generate your password file" 
  exit
fi

if [ -z $1 ]; then
  echo "You mush specify the space you want to navigate, e.g use '$0 TnT_Integration' switch to integration space"
  exit
fi

PASSWORD=$(cat ~/.domain_password | base64 -d)

cf api https://api.cf.sap.hana.ondemand.com
cf login -u I063815 -p $PASSWORD -s $1 -o IoT_Applications 

