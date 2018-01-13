#!/bin/bash

CONTAINERS="dev-consul-01"

for c in $CONTAINERS ;
do
  docker stop $c
  docker logs $c
  docker rm $c
done

