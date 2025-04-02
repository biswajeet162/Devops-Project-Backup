package com.chat.query.controller;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import lombok.RequiredArgsConstructor;

import java.util.UUID;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@RestController
@RequiredArgsConstructor
@RequestMapping( value = "/query")
public class QueryController {

    
    String microservice1Url = "http://4.236.235.33:82/chat_operation/search";

    private final RestTemplate restTemplate;
   
    // @GetMapping("/")
    // public String getMethodNames() {
    //    return UUID.randomUUID().toString() + " This is chat Query";
    // }

    @GetMapping("/")
    public String getMethodName() {
        System.out.println("calling for query");
        ResponseEntity<String> responseEntity = restTemplate.getForEntity( microservice1Url, String.class);
        String faqResponses = responseEntity.getBody();

        System.out.println("got response from querys");
        System.out.println(responseEntity);

        return faqResponses;
    }
    

}


