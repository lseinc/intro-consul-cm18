#!/bin/bash

DIR=`dirname $0`
DIR=`cd $DIR; pwd`

SERVICE=${1:-"google.service.consul"}

dig @127.0.0.1 -p 8600 $SERVICE SRV
echo ""
echo "completed"

