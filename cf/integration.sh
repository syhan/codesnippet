#!/bin/sh

CANARY=$(dirname $0)/canary.sh

if [ ! -f $CANARY ]; then
  echo "Missing canary.sh, please check the executable file"
  exit
fi

$CANARY TnT_Integration
