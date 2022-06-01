package org.zerock.oscatest.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.oscatest.dto.CompanyDTO;
import org.zerock.oscatest.dto.NegotiationDTO;
import org.zerock.oscatest.service.ContractService;
import org.zerock.oscatest.service.NegotiationService;

@Log4j2
@Controller
@RequestMapping("/contract/nego/")
@RequiredArgsConstructor
public class NegoController {

    private final NegotiationService negotiationService;


    @PostMapping("/register")
    public String registerPOST(NegotiationDTO negotiationDTO, RedirectAttributes rttr){

        log.info("===========================");
        log.info(negotiationDTO);
        negotiationService.insert(negotiationDTO);
        rttr.addFlashAttribute("result","register");
        log.info("registered");
        return "redirect: /contract/nego/list";
    }


//    @GetMapping("/list")
//    public void negoListGET(){
//
//    }
//
//    @GetMapping("/read")
//    public void negoReadGET(){
//
//    }
//
//    @GetMapping("/sign")
//    public void negoSignGET(){
//
//    }

}
