package com.lse.example.consul.demo

import org.springframework.beans.factory.annotation.Value
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.cloud.client.discovery.EnableDiscoveryClient
import org.springframework.cloud.client.loadbalancer.LoadBalanced
import org.springframework.cloud.context.config.annotation.RefreshScope
import org.springframework.context.annotation.Bean
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController
import org.springframework.web.client.RestTemplate
import org.springframework.web.client.getForObject
import java.util.concurrent.atomic.AtomicLong

@SpringBootApplication
@EnableDiscoveryClient
class DemoApplication {
    @LoadBalanced
    @Bean
    fun restTemplate(): RestTemplate {
        return RestTemplate()
    }
}

fun main(args: Array<String>) {
    runApplication<DemoApplication>(*args)
}

@RefreshScope
@RestController
class GreetingController(var client: RestTemplate) {

    @Value("\${application.intro:Hello}")
    lateinit var intro: String

    val counter = AtomicLong()

    @RequestMapping("/greeting/{name}")
    fun greeting(@PathVariable(value = "name", required = true) name: String): Greeting {
        val message: String? = client.getForObject("http://demo-service/hello/$name")
        return Greeting(counter.incrementAndGet(), "$intro $message")
    }
}

data class Greeting(val id: Long, val content: String)
