#!/bin/bash

DIR=`dirname $0`
DIR=`cd $DIR; pwd`

SERVICE=${1:-"search-service.json"}

curl -v -4 -X PUT -d @$DIR/$SERVICE http://localhost:8500/v1/catalog/register
echo ""
echo "completed"

