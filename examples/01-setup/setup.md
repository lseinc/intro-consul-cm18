# Consul Setup

[consul.io](https://www.consul.io)  

There are a few directories under examples/01-setup to help in running an example consul server.

- docker : sample files to launch a docker container
- local  : used to download a consul binary and run on localhost a development single server instance
- load   : used to load key value pairs into server once running

## Local Setup
- cd local
- run ./consul-binary-download.sh which will download a consul zip and extract it to local file system
- then run ./consul-start-local.sh which will run a local instance of consul server for testing

## Docker Setup

- Docker
 - [https://hub.docker.com/\_/consul/](https://hub.docker.com/_/consul/) 

### Using Startup Scripts 
 - run script in separate shell to execute a docker instance under examples/01-setup/docker .
 - two scripts exist, one for a swarm stack the other for simple docker engine

### Manual Startup Docker Engine  
<code>docker run -d \
	--name=dev-consul-01 \
	--net=host \
  	-e CONSUL_CLIENT_INTERFACE='eth1' \
  	-e CONSUL_BIND_INTERFACE='eth1' \
	-p 0.0.0.0:8300:8300 \
	-p 0.0.0.0:8301:8301 \
	-p 0.0.0.0:8302:8302 \
	-p 0.0.0.0:8400:8400 \
	-p 0.0.0.0:8500:8500 \
	-p 0.0.0.0:8600:8600 \
	consul:1.0.0 \
	agent \
	-server \
	-bootstrap-expect=1 \
	-ui
</code>

### Manual Startup Docker Swarm 
Using docker-compose.yml file under examples/01-setup/docker.

<code>docker stack deploy -c docker-compose.yml demo-consul
</code>

### Verify Setup
- open [http://localhost:8500/ui/](http://localhost:8500/ui/)
- add key / value
<code>  
./consul kv put config/testme test  
./consul kv get config/testme
</code>  
- refresh ui to see changed key / values

### Load Key Value Test Data
- cd load
- run ./load-consul-data.sh
- results shold be imported key values that will be used in the Spring Boot test applications


