#!/bin/bash

#set -x
#URL=http://localhost:8080/actuator/refresh
URL=http://localhost:8080/application/refresh
CMD="curl -s -X POST $URL -o-"
echo $CMD
RESULT=`$CMD`
[ $? -eq 0 ] && printf "success, refresh=$RESULT\n" || echo "refresh failed  !!!"
