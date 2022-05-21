package org.zerock.oscatest.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.oscatest.dto.CompanyDTO;
import org.zerock.oscatest.service.CompanyService;

@Log4j2
@Controller
@RequestMapping("/")
@RequiredArgsConstructor
public class CommonController {


//    @GetMapping("/companyregister")
//    public String companyRegisterGET(){
//        return"/companyregister";
//    }
//
//    @PostMapping("/companyregister")
//    public String companyRegisterPOST(CompanyDTO companyDTO, RedirectAttributes rttr){
//
//        log.info("==============================");
//        log.info(companyDTO);
//        //companyService.register(companyDTO);
//        rttr.addFlashAttribute("result","register");
//        log.info("registered");
//        return "redirect: /";
//    }



    @GetMapping("/accessError")
    public void accessError(){

    }

    @PostMapping("Login")
    public String LoginPOST(CompanyDTO companyDTO, RedirectAttributes rttr){



        return "redirect:/";

    }

    @GetMapping("/customLogin")
    public void loginGET(){

    }


}
