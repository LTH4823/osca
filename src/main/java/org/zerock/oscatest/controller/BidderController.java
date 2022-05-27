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

    @PostMapping("add/{conNo}&{price}")
//    @ResponseBody
    public String insertBidPost(Principal principal,
                                @PathVariable("conNo") Integer conNo,
                                @PathVariable("price") String price, BidderDTO bidderDTO){

        bidderDTO.setComId(principal.getName());
        bidderDTO.setConNo(conNo);
        bidderDTO.setPrice(price);
        log.info(principal.getName());

        bidderService.insert(bidderDTO);

        log.info("==============================");
        log.info(bidderDTO);

        log.info("bid==================================");
        return "redirect: /company/auction/";
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
