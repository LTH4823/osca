package org.zerock.oscatest.controller;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.oscatest.dto.CompnayDTO;
import org.zerock.oscatest.service.CompanyService;

@Log4j2
@Controller
@RequestMapping("/")
@RequiredArgsConstructor
public class MainController {

    private final CompanyService companyService;

//    @GetMapping("/login")
//    public String login(){
//        return "/login";
//    }

    @GetMapping("/companyregister")
    public String companyRegisterGET(){
        return"/companyregister";
    }
    
    @PostMapping("/companyregister")
    public String companyRegisterPOST(CompnayDTO compnayDTO, RedirectAttributes rttr){

        log.info("==============================");
        log.info(compnayDTO);
        companyService.register(compnayDTO);
        rttr.addFlashAttribute("result","register");
        log.info("registered");
        return "redirect: /";
    }

    @GetMapping("/accessError")
    public void accessError(){

    }

    @GetMapping("/customLogin")
    public void loginGET(){

    }
}
