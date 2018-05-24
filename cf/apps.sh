#!/bin/sh

if [ ! -f $(dirname $0)/app.sh ]; then
  echo "Missing app.sh file, please check the executable"
  exit 2 
fi

#apps=( "odata" "connectivity" "daemon" "EPCIS" "jobstarter" )

for a in "odata" "connectivity" "daemon" "EPCIS" "jobstarter"
do
    ./app.sh "$a" 
done