package org.zerock.oscatest.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequestMapping("/requester/")
@RequiredArgsConstructor
public class RequesterController {
    @GetMapping("/")
    public String basic(){
        return "redirect:/requester/register";
    }

    @GetMapping("/register")
    public void show(){
        log.info("adminList test............");
        log.info("requester");
    }

}
