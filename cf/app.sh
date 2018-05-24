#!/bin/sh

if [ -z $1 ]; then
  echo "Missing application name, e.g. use '$0 OData' to get the OData application name"
  exit 2 
fi

cf apps | grep -i $1 | grep started | awk '{print $1}'

