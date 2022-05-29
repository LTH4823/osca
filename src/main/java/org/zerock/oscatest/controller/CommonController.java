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
import org.zerock.oscatest.dto.*;
import org.zerock.oscatest.service.CompanyService;
import org.zerock.oscatest.service.ContractService;

@Log4j2
@Controller
@RequestMapping("/")
@RequiredArgsConstructor
public class CommonController {

    private final ContractService contractService;

    @GetMapping("/accessError")
    public void accessError(){}

    @PostMapping("Login")
    public String LoginPOST(CompanyDTO companyDTO, RedirectAttributes rttr){return "redirect:/";}

    @GetMapping("/customLogin")
    public void loginGET(){}

    @GetMapping("/auction")
    public void auctionGET(ListDTO listDTO, Model model){
        log.info("=================================");
        log.info("auction");
        log.info(listDTO);
        ListResponseDTO<ContractDTO> responseDTO = contractService.getList(listDTO);
        model.addAttribute("dtoList",responseDTO.getDtoList());
        int total = responseDTO.getTotal();
        model.addAttribute("pageMaker", new PageMaker(listDTO.getPage(),total));
    }


}
