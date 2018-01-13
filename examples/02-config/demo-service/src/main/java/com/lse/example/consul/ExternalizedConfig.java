package com.lse.example.consul;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.*;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConfigurationProperties("microservice")
public class ExternalizedConfig {
    @Value("${welcome:David Lucas}")
    private String welcome;

    @Value("${foo:nothing}")
    private String foo;

    public void setWelcome(String welcome) {
        this.welcome = welcome;
    }

    public void setFoo(String foo) {
        this.foo = foo;
    }

    public String getWelcome() {
        return welcome;
    }

    public String getFoo() {
        return foo;
    }
}
