package com.lse.example.consul;

import org.springframework.beans.factory.annotation.*;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.*;

@RestController
@RefreshScope
public class DemoController {

    @Autowired
    private ExternalizedConfig config;

    @Value("${spring.cloud.consul.discovery.instance-id:server.port}")
    private String instanceId;

    @Value("${foo:nothing}")
    private String foo;

    @Value("${welcome:David Lucas}")
    private String welcome;

    @GetMapping("/foo")
    public String foo() {
        return "foo="+foo;
//        return "foo="+config.getFoo();
    }

    @GetMapping("/hello/{id}")
    public String hello(@PathVariable("id") String whoIsThere) {
        return ""+whoIsThere+", greetings from "+config.getWelcome()+" ["+instanceId+"]";
    }
}
