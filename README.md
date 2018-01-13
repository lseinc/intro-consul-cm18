#Leveraging Spring Cloud Consul for Discovery - CodeMash 2018

by David Lucas
@DavidDLucas


# examples
### 01-setup
- Instructions to setup and start consul
- Directory breakdown:
  - The docker folder has some examples of running a docker instance of consul  
  - The local folder has scripts to download the consul binary (consul-binary-download.sh) and start it  (consul-start-local.sh) 
  - The load folder contains scripts to load / save key value pairs 

--

### 02-demo-service
  This example has a demo-service that have a /foo method and /hello/<name> method to demonstrate it is taking requests.
  This also using properties found under consul like "/config/application/foo with a value that will replace the default in the DemoController.
  - If starting from scratch, add a REST controller and include the @Configuration, @EnableAutoConfiguration, @RefreshScope , @RestController .
  - @RefreshScope is key to reloading properties from consul posting to Actuator's refresh endpoint 
  - Start the demo-service using  <code>./mvnw spring-boot:run</code>  
  - GET [http://localhost:8080/hello](http://localhost:8080/hello) to see the hello world message to include the default @Value.
  - Now change / create a key (config/application/foo) / value (CodeMash Rocks) in consul at [http://localhost:8500/ui](http://localhost:8500/ui) under Key / Value tab and create / navigate to /config/application/foo 
 - Or you can create the key / value using curl   <code>curl -X PUT -d "CodeMash Rocks" http://localhost:8500/v1/kv/application/foo</code>  
  - In order to refresh the properties in the service when they are changed in consul, one just needs to POST the refresh endpoint
  - Example using curl:  <code>curl -s -X POST http://localhost:8080/application/refresh -o-  </code>  
  - There is a script (refresh.sh) that can be used to execute the refresh POST.  

--

### 03-demo-application  
  This example is from the point of view of an application looking up the service and making a call. The actual code base just delegates its work to the original demo-service for a message.
  - This example uses Kotlin and delegates to the "demo-service" by making a call via the Spring RestTemplate to "http://demo-service".  Using the @LoadBalanced annotation on the RestTemplate @Bean creation will help it discover the host port behind the scene.
  - Add to Demo Application class the @EnableDiscoveryClient (register) ( and optional @EnableFeignClients discovery for REST Template).
  - Add to example REST controller @Configuration, @EnableAutoConfiguration, @RefreshScope, @RestController

### 04-gateway-server
  This example is to show how to add the zuul server (a type of api gateway) to the mix.  
  
- Annotations to add to enable gateway zuul server:
  - @EnableDiscoveryClient
  - @EnableFeignClients
  - @EnableZuulProxy

### Slides

Please review the slides in the slides folder to read through what was attempted in the demo that might help understand.  You can always reach out to me at @DavidDLucas or via github.com/lseinc issue.

[slides/Spring-Cloud-Consul-CM2018.pdf](slides/Spring-Cloud-Consul-CM2018.pdf)

---

This will most likely change with the upcoming Spring Boot 2 release.  But it should be close to how it will be without any major changes.

This is a work in progress.
This is not a secure example and should be changed to secure actuator and provide authentication.

Enjoy!  

2018-01-12

