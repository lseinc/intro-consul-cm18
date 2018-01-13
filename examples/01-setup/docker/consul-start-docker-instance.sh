#!/bin/bash

docker run -d \
	--name=dev-consul-01 \
	--net=host \
  	-e CONSUL_CLIENT_INTERFACE='eth1' \
  	-e CONSUL_BIND_INTERFACE='eth1' \
	-p 0.0.0.0:8400:8400 -p 0.0.0.0:8500:8500 -p 0.0.0.0:8600:8600 \
	-p 0.0.0.0:8300:8300 -p 0.0.0.0:8301:8301 -p 0.0.0.0:8302:8302 \
	consul:1.0.2 \
	agent \
	-server \
	-recursor 8.8.8.8 \
	-bootstrap-expect=1 \
	-ui

