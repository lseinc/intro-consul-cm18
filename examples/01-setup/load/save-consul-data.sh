#!/bin/bash

DIR=`dirname $0`
DIR=`cd $DIR; pwd`
PATH=$DIR/../local/:$PATH

consul kv export >kv-export.json

[ $? -eq 0 ] && echo "exported key / values. " || echo "export failed !!!"
