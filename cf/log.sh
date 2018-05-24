#!/bin/sh

if [ ! -f $(dirname $0)/app.sh ]; then
  echo "Missing app.sh file, please check the executable"
  exit 2 
fi

APP=$(./app.sh $1)

[ $? -ne 0 ] && echo $APP && exit

cf logs $APP $2
