package org.zerock.oscatest.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.oscatest.dto.*;
import org.zerock.oscatest.service.BidderService;
import org.zerock.oscatest.service.ContractService;

import java.security.Principal;

@Log4j2
@Controller
@RequestMapping("/contract/")
@RequiredArgsConstructor
public class ContractController {

    private final ContractService contractService;
    private final BidderService bidderService;

    @GetMapping("/add/list")
    public void addListGET(ContractAddListDTO contractAddListDTO, Model model, Principal principal){
        log.info("=================================");
        log.info("My Add Contract");
        log.info(contractAddListDTO);
        contractAddListDTO.setRequester(principal.getName());
        log.info(contractAddListDTO);
        ListResponseDTO<ContractDTO> responseDTO = contractService.getAddList(contractAddListDTO);

        model.addAttribute("dtoList",responseDTO.getDtoList());
        int total= responseDTO.getTotal();
        model.addAttribute("pageMaker",new PageMaker(contractAddListDTO.getPage(),total));
    }


    //auction main ===============================================================================
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

    @GetMapping("/del/list")
    public void delListGET(){

    }

    @GetMapping("/nego/list")
    public void negoListGET(){

    }

    @GetMapping("/progress/list")
    public void progressListGET(){

    }

    @GetMapping("/finish/list")
    public void finshListGET(){

    }
}
