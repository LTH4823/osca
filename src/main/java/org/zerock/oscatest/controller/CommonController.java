package org.zerock.oscatest.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.oscatest.dto.*;
import org.zerock.oscatest.service.CompanyService;
import org.zerock.oscatest.service.ContractService;

import java.security.Principal;

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

    private final CompanyService companyService;

    @GetMapping("/")
    public String basic(){
        return "redirect:/";
    }

    // 회원가입=================================================================================
    @GetMapping("/register")
    public void registerGET(){}

    @PostMapping("/register")
    public String registerPOST(CompanyDTO companyDTO, RedirectAttributes rttr){
        log.info("==============================");
        log.info(companyDTO);
        companyService.register(companyDTO);
        rttr.addFlashAttribute("result","register");
        log.info("registered");
        return "redirect: /";
    }
    // =========================================================================================


    // mypage ==================================================================================

    @PreAuthorize("hasRole('ROLE_COMPANY') or hasRole('ROLE_MEMBER')")
    @GetMapping("/mypage/")
    public String myPageGET(Principal principal, Model model){
        log.info("===============================");
        log.info("===============================");
        log.info(principal);
        log.info(principal.getName());
        log.info("===============================");
        log.info("===============================");
        log.info("===============================");
        model.addAttribute("company", companyService.getInfo(principal.getName()));
        return "mypage";
    }

    //=========================================================================================

    // 회원정보 수정=============================================================================
//    @GetMapping("/modify/{comId}")
//    public String modifyGET(@PathVariable("comId")String comId, Model model){
//
//        log.info("=========================================");
//        log.info(comId);
//
//        model.addAttribute("company", comId);
//
//        return "/company/"+comId;
//    }

//    @PreAuthorize("hasRole('ROLE_COMPANY')")
    @PostMapping("/modify/{comId}")
    public String modifyPOST( String comId, CompanyDTO companyDTO, RedirectAttributes rttr){

        log.info("===========================================");
        log.info(comId);
        log.info(companyDTO);
        companyDTO.setComId(comId);
        companyService.update(companyDTO);
        log.info("modified");
        rttr.addFlashAttribute("result","modified");

        return "redirect:/mypage/";
    }


    //==========================================================================================


    // 회원탈퇴=================================================================================
//    @GetMapping("/remove/{comId}")
//    public String removeGET(){
//        return "redirect:/";
//    }

    @PostMapping("/remove/{comId}")
    public String removePOST(@PathVariable("comId") String comId, RedirectAttributes rttr){

        log.info("==============================");
        log.info(comId);
        companyService.delete(comId);
        rttr.addFlashAttribute("result","removed");
        log.info("removed");
        return "redirect:/";
    }
    //==========================================================================================



}
