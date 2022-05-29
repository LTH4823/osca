package org.zerock.oscatest.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.oscatest.dto.BidderDTO;
import org.zerock.oscatest.dto.ContractDTO;
import org.zerock.oscatest.service.BidderService;

import java.security.Principal;

@Log4j2
@Controller
@RequestMapping("/bidder/")
@RequiredArgsConstructor
public class BidderController {

    private final BidderService bidderService;

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
