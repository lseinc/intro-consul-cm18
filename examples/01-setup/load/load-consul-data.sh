#!/bin/bash

DIR=`dirname $0`
DIR=`cd $DIR; pwd`
PATH=$DIR/../local/:$PATH

consul kv import @kv.json
