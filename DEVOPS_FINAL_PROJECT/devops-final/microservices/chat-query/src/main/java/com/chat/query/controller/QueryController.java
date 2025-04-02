package com.chat.query.controller;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import lombok.RequiredArgsConstructor;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;


@RestController
@RequiredArgsConstructor
public class QueryController {

    @Value("${microservice1_url}")
    private String microservice1Url;

    private final RestTemplate restTemplate;
    
    @GetMapping("/")
    public String getMethodName() {
        ResponseEntity<String> responseEntity = restTemplate.getForEntity( microservice1Url, String.class);
        String faqResponses = responseEntity.getBody();
        return faqResponses;
    }
    

}
