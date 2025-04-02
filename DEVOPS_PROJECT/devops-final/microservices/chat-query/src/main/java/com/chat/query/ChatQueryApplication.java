package com.chat.query;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

@SpringBootApplication
@Configuration
public class ChatQueryApplication {

	public static void main(String[] args) {
		SpringApplication.run(ChatQueryApplication.class, args);
		System.out.println("Hello World from chat-query testing Biswajeet ");
	}

	@Bean
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }

}

