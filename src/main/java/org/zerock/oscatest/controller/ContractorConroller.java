package org.zerock.oscatest.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequestMapping("/contractor/")
@RequiredArgsConstructor
public class ContractorConroller {

    @GetMapping("/")
    public String basic(){
        return "redirect:/contractor/register";
    }

    @GetMapping("/register")
    public void show(){
        log.info("adminList test............");
        log.info("contractor");
    }
}
