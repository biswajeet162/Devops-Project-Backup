package com.chat.operation.controller;

import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;

import java.util.UUID;

import org.springframework.web.bind.annotation.GetMapping;


@RestController
@RequiredArgsConstructor
public class QueryController {

    @GetMapping("/")
    public String getMethodNames() {
        return UUID.randomUUID().toString() + "This is Chat Operation";
    }

    @GetMapping("/chat_operation/search")
    public String getMethodName() {
        return UUID.randomUUID().toString() + "This is response from OPERATION SERVICE.";
    }

 
    

}


