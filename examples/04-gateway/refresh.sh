#!/bin/bash

#set -x
#URL=http://localhost:8060/application/refresh
URL=http://localhost:8060/application/bus-refresh

refresh() {
  SERVICE=${1:-"demo-service"}
  CMD="curl -s -X POST $URL/$SERVICE -o-"
  echo $CMD
  RESULT=`$CMD`
  [ $? -eq 0 ] && printf "success for $SERVICE, refresh=$RESULT\n" || echo "refresh failed  for $SERVICE !!!"
}

refresh demo-service
refresh demo-application
