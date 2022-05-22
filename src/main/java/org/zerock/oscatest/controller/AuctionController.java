package org.zerock.oscatest.controller;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.oscatest.dto.*;
import org.zerock.oscatest.service.ContractService;

@Log4j2
@Controller
@RequestMapping("/company/auction/")
@RequiredArgsConstructor
public class AuctionController {

    private final ContractService contractService;

    @GetMapping("/list")
    public void auctionGET(ListDTO listDTO, Model model){
        log.info("=================================");
        log.info("auction");
        log.info(listDTO);
        ListResponseDTO<ContractDTO> responseDTO = contractService.getList(listDTO);
        model.addAttribute("dtoList",responseDTO.getDtoList());
        int total = responseDTO.getTotal();
        model.addAttribute("pageMaker", new PageMaker(listDTO.getPage(),total));
    }

//    @PreAuthorize("hasRole('ROLE_COMPANY')")
    @GetMapping("register")
    public void registerGET(){}

    @PostMapping("register")
    public String registerPOST(ContractDTO contractDTO, RedirectAttributes rttr){
        log.info("==============================");
        log.info(contractDTO);
        contractService.insert(contractDTO);
        rttr.addFlashAttribute("result","register");
        log.info("registered");
        return "redirect: /";
    }

}
