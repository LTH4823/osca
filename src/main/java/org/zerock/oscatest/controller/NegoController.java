package org.zerock.oscatest.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.oscatest.domain.Negotiation;
import org.zerock.oscatest.dto.*;
import org.zerock.oscatest.service.ContractService;
import org.zerock.oscatest.service.NegotiationService;

import java.security.Principal;

@Log4j2
@Controller
@RequestMapping("/contract/nego/")
@RequiredArgsConstructor
public class NegoController {

    private final NegotiationService negotiationService;


    @PostMapping("/register")
    public String registerPOST(NegotiationDTO negotiationDTO, RedirectAttributes rttr) {

        log.info("===========================");
        log.info(negotiationDTO);
        negotiationService.insert(negotiationDTO);
        rttr.addFlashAttribute("result", "register");
        log.info("registered");
        return "redirect: /contract/nego/list";
    }

    @GetMapping("/list")
    public void getNegoListGET(NegotiationListDTO negotiationListDTO, Model model, Principal principal) {
        log.info("=================================");
        log.info("My Negotiation List");
        log.info(negotiationListDTO);
        negotiationListDTO.setWorker(principal.getName());
        log.info(negotiationListDTO);
        ListResponseDTO<NegotiationDTO> responseDTO = negotiationService.getList(negotiationListDTO);
        model.addAttribute("dtoList", responseDTO.getDtoList());
        int total = responseDTO.getTotal();
        model.addAttribute("pageMaker", new PageMaker(negotiationListDTO.getPage(), total));
    }


    //    @GetMapping("/list")
//    public void negoListGET(){
//
//    }
//
    @GetMapping("/read/{negoNo}")
    public String negoReadGET(@PathVariable("negoNo") Integer negoNo, Model model) {
        log.info("===========================================================");
        log.info("===========================================================");
        log.info(negoNo);
        NegotiationDTO negotiationDTO = negotiationService.getOne(negoNo);
        log.info(negotiationDTO);
        model.addAttribute("nego", negotiationDTO);
        log.info("===========================================================");
        log.info("===========================================================");

        return "contract/nego/read";
    }
//
    @GetMapping("/sign")
    public void negoSignGET(){

    }

}
