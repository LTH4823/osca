package org.zerock.oscatest.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.oscatest.domain.Company;
import org.zerock.oscatest.dto.CompnayDTO;
import org.zerock.oscatest.mapper.CompanyMapper;
import org.zerock.oscatest.service.CompanyService;

import java.lang.reflect.Member;

@Log4j2
@Controller
@RequestMapping("/company/")
@RequiredArgsConstructor
public class CompanyConteroller {

    private final CompanyService companyService;

    // 회원가입=================================================================================
    @GetMapping("/register")
    public void registerGET(){}

    @PostMapping("/register")
    public String registerPOST(CompnayDTO compnayDTO, RedirectAttributes rttr){
        log.info("==============================");
        log.info(compnayDTO);
        companyService.register(compnayDTO);
        rttr.addFlashAttribute("result","register");
        log.info("registered");
        return "redirect:/";
    }
    // =========================================================================================


    // mypage ==================================================================================
    @GetMapping("/{comId}")
    public String myPageGET(@PathVariable("comId")String comId, Model model){
        log.info("===============================");
        log.info(comId);
        model.addAttribute("company", companyService.getInfo(comId));
        return "/company/mypage";
    }
    //=========================================================================================

    // 회원정보 수정=============================================================================

    @GetMapping("/modify/{comId}")
    public String modifyGET(@PathVariable("comId")String comId, Model model){

        log.info("=========================================");
        log.info(comId);

        model.addAttribute("company", comId);

        return "/company/"+comId;
    }

    @PostMapping("/modify/{comId}")
    public String modifyPOST(@PathVariable("comId")String comId, CompnayDTO compnayDTO, RedirectAttributes rttr){

        log.info("===========================================");
        log.info(comId);
        log.info(compnayDTO);
        compnayDTO.setComId(comId);
        companyService.update(compnayDTO);
        log.info("modified");
        rttr.addFlashAttribute("result","modified");

        return "redirect:/company/"+comId;
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
