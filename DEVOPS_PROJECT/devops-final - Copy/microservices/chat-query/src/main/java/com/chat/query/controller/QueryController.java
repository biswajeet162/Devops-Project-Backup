package com.chat.query.controller;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import lombok.RequiredArgsConstructor;

import java.util.UUID;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;


@RestController
@RequiredArgsConstructor
public class QueryController {

    
    String microservice1Url = "http://localhost:8080/chat_operation/search";

    private final RestTemplate restTemplate;
   
    @GetMapping("/")
    public String getMethodNames() {
       return UUID.randomUUID().toString() + " This is chat Query";
    }

    @GetMapping("/query")
    public String getMethodName() {
        ResponseEntity<String> responseEntity = restTemplate.getForEntity( microservice1Url, String.class);
        String faqResponses = responseEntity.getBody();
        return faqResponses;
    }
    

}


