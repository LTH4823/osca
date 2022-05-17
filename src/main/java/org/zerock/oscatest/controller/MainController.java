package org.zerock.oscatest.controller;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequestMapping("/")
@RequiredArgsConstructor
public class MainController {

    @GetMapping("/")
    public String main(){
        return "/index";
    }

    @GetMapping("/login")
    public String login(){
        return "/login";
    }

}