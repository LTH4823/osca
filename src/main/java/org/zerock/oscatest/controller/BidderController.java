package org.zerock.oscatest.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.oscatest.dto.*;
import org.zerock.oscatest.service.BidderService;
import org.zerock.oscatest.service.ContractService;

import java.security.Principal;

@Log4j2
@Controller
@RequestMapping("/bidder/")
@RequiredArgsConstructor
public class BidderController {

    private final BidderService bidderService;
    private final ContractService contractService;

    @PostMapping("add")
//    @ResponseBody
    public String insertBidPost(BidderDTO bidderDTO){

//        bidderDTO.setComId(principal.getName());
//        log.info(principal.getName());
        log.info("==============================");
        log.info("==============================");
        log.info("==============================");
        log.info("==============================");
        log.info(bidderDTO);
        bidderService.insert(bidderDTO);
        log.info("==============================");
        log.info(bidderDTO);
        log.info("==============================");
        log.info("==============================");
        log.info("bid===========================");
        return "redirect: /auction/";
    }


    @GetMapping("/{conNo}/list")
    public String listGET(@PathVariable("conNo") Integer conNo, BidderListDTO bidderListDTO, Model model){
        log.info("=================================");
        log.info("My Contract Bidder List");
        log.info(conNo);
        bidderListDTO.setConNo(conNo);
        log.info(bidderListDTO);
        ContractDTO contractDTO = contractService.getOne(conNo);
        ListResponseDTO<BidderDTO> responseDTO = bidderService.getList(bidderListDTO);
        model.addAttribute("dtoList",responseDTO.getDtoList());
        model.addAttribute("contract",contractDTO);
        int total = responseDTO.getTotal();
        model.addAttribute("pageMaker", new PageMaker(bidderListDTO.getPage(),total));

        return "auction/bidder/list";
    }

//    @PostMapping("/register")
//    public String registerPOST(ContractDTO contractDTO, RedirectAttributes rttr){
//        log.info("==============================");
//        log.info(contractDTO);
//
//        contractService.register(contractDTO);
////        contractService.insert(contractDTO);
//
//        rttr.addFlashAttribute("result","register");
//        log.info("registered");
//        return "redirect: /";
//    }


}
