package org.zerock.oscatest.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.oscatest.dto.RequesterDTO;
import org.zerock.oscatest.service.RequesterService;

@Log4j2
@Controller
@RequestMapping("/requester/")
@RequiredArgsConstructor
public class RequesterController {

    private final RequesterService requesterService;

    @GetMapping("/")
    public String basic(){
        return "redirect:/requester/register";
    }

    @GetMapping("/register")
    public void registerGET(){
        log.info("Requester GET Test............");
        log.info("requester");
    }

    @PostMapping("/register")
    public String registerPOST(RequesterDTO requesterDTO, RedirectAttributes rttr){
        log.info("Requester Post Test............");
        log.info("requester");

        log.info(requesterDTO);
        requesterService.insert(requesterDTO);

        rttr.addFlashAttribute("result","insert");

        return "redirect:/requester/register";

    }

}
