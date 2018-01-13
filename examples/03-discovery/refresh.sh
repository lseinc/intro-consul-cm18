#!/bin/bash

#set -x
URL=http://localhost:8070/application/refresh
CMD="curl -s -X POST $URL -o-"
echo $CMD
RESULT=`$CMD`
[ $? -eq 0 ] && printf "success, refresh=$RESULT\n" || echo "refresh failed  !!!"
