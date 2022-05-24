package org.zerock.oscatest.controller;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.oscatest.dto.*;
import org.zerock.oscatest.service.ContractService;

import java.util.Arrays;

@Log4j2
@Controller
@RequestMapping("/company/auction/")
@RequiredArgsConstructor
public class AuctionController {

    private final ContractService contractService;

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

    @GetMapping("/")
    public String basic(){
        return "redirect:/company/auction/list";
    }

    //계약 등록 ==================================================================================
    @PreAuthorize("hasRole('ROLE_COMPANY')")
    @GetMapping("/register")
    public void registerGET(){}

    @PostMapping("/register")
    public String registerPOST(ContractDTO contractDTO, RedirectAttributes rttr){
        log.info("==============================");
        log.info(contractDTO);

        contractService.register(contractDTO);
//        contractService.insert(contractDTO);

        rttr.addFlashAttribute("result","register");
        log.info("registered");
        return "redirect: /";
    }

    //계약 조회 ==================================================================================
    @GetMapping("/read/{conNo}")
    public String readGET(@PathVariable("conNo")Integer conNo, ListDTO listDTO, Model model){
        log.info("=====================================");
        log.info(conNo);
        log.info(listDTO);
        model.addAttribute("dto", contractService.getOne(conNo));

        return "/company/auction/read";
    }

    //계약 수정 ==================================================================================
    @GetMapping("/modify/{conNo}")
    public String modifyGET(@PathVariable("conNo")Integer conNo, ListDTO listDTO,Model model){
        log.info("=====================================");
        log.info(conNo);
        model.addAttribute("dto",contractService.getOne(conNo));

        return "/company/auction/modify";

    }

    @PostMapping("/modify/{conNo}")
    public String modifyPOST(@PathVariable("conNo") Integer conNo, ContractDTO contractDTO, ListDTO listDTO, RedirectAttributes rttr){
        log.info("=====================================");
        log.info(conNo);
        contractDTO.setConNo(conNo);
        log.info("modify"+contractDTO);
        contractService.update(contractDTO);

        rttr.addFlashAttribute("result","modified");

        return "redirect:/company/auction/read/"+conNo+listDTO.getLink();
    }





    //계약 파기 ==================================================================================
    // 조회 후 삭제 (auction 에서는 )
    @PostMapping("/remove/{conNo}")
    public String remove(@PathVariable("conNo") Integer conNo, RedirectAttributes rttr){
        log.info("================================");
        log.info("remove"+conNo);
        contractService.remove(conNo);
        rttr.addFlashAttribute("result","removed");
        return "redirect:/company/auction/list";
    }


    //계약 입찰 ==================================================================================
    //mapper 조인문

    //계약 협상 ==================================================================================
    @GetMapping("/negotiation")
    public void negotiationGET(){}

    //계약 진행 ==================================================================================
    @GetMapping("/progress")
    public void progressGET(){}

    //계약 완료 ==================================================================================
    @GetMapping("/clude")
    public void cludeGET(){}
}
