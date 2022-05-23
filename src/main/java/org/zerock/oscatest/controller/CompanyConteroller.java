package org.zerock.oscatest.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.oscatest.dto.CompanyLoginDTO;
import org.zerock.oscatest.dto.CompanyDTO;
import org.zerock.oscatest.service.CompanyService;

import javax.servlet.http.HttpSession;
import java.security.Principal;

@Log4j2
@Controller
@RequestMapping("/company/")
@RequiredArgsConstructor

public class CompanyConteroller {

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
//    @PreAuthorize("hasRole('ROLE_COMPANY')")
//    @GetMapping("/{comId}")
//    public String myPageGET(@PathVariable("comId")String comId, Model model){
//        log.info("===============================");
//        log.info(comId);
//        model.addAttribute("company", companyService.getInfo(comId));
//        return "/company/mypage";
//    }
//

    @PreAuthorize("hasRole('ROLE_COMPANY')")
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
        return "/company/mypage";
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

    @PreAuthorize("hasRole('ROLE_COMPANY')")
    @PostMapping("/modify/{comId}")
    public String modifyPOST( String comId, CompanyDTO companyDTO, RedirectAttributes rttr){

        log.info("===========================================");
        log.info(comId);
        log.info(companyDTO);
        companyDTO.setComId(comId);
        companyService.update(companyDTO);
        log.info("modified");
        rttr.addFlashAttribute("result","modified");

        return "redirect:/company/mypage/";
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

    // 현재 계약 진행중 List======================================================================

    // =========================================================================================


    // 계약 완료(임금 확인) List==================================================================

    // =========================================================================================


    // 현재 계약 파기(취소 삭제 요청) List=========================================================

    // =========================================================================================


}
