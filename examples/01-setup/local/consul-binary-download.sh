#!/bin/bash

OS=`uname -s`

if [ "$OS" = "Darwin" ];
then
  curl https://releases.hashicorp.com/consul/1.0.2/consul_1.0.2_darwin_amd64.zip -o consul_1.0.2.zip
else
  curl https://releases.hashicorp.com/consul/1.0.2/consul_1.0.2_linux_amd64.zip -o consul_1.0.2.zip
fi
unzip consul_1.0.2.zip

