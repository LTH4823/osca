package org.zerock.oscatest.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.oscatest.dto.*;
import org.zerock.oscatest.service.AdminService;

@Log4j2
@Controller
@RequestMapping("/admin/")
@RequiredArgsConstructor
public class AdminController {

    private final AdminService adminService;

    @GetMapping("/")
    public String basic(){
        return "redirect:/admin/adminList";
    }

    @GetMapping("/adminList")
    public void adminList(ListDTO listDTO, Model model){
        log.info("adminList test............");
        log.info(listDTO );

        ListResponseDTO<AdminDTO> responseDTO = adminService.getAdminList(listDTO);

        model.addAttribute("adDtoList",responseDTO.getDtoList());

        int total = responseDTO. getTotal();
        model.addAttribute("pageMaker",new PageMaker(listDTO.getPage(),total));
        model.addAttribute("aa","Delete");
    }

    @GetMapping("/contractList")
    public void contractList(ListDTO listDTO, Model model){
        log.info("contractList test............");
        log.info(listDTO );

        ListResponseDTO<ContractDTO> responseDTO = adminService.getContractList(listDTO);

        model.addAttribute("conDtoList",responseDTO.getDtoList());

        int total = responseDTO. getTotal();
        model.addAttribute("pageMaker",new PageMaker(listDTO.getPage(),total));
        model.addAttribute("aa","Delete");
    }

    @GetMapping("/contractorList")
    public void contractorList(ListDTO listDTO, Model model){
        log.info("contractorList test............");
        log.info(listDTO );

        ListResponseDTO<ContractorDTO> responseDTO = adminService.getContractorList(listDTO);

        model.addAttribute("ctDtoList",responseDTO.getDtoList());

        int total = responseDTO. getTotal();
        model.addAttribute("pageMaker",new PageMaker(listDTO.getPage(),total));
        model.addAttribute("aa","Delete");
    }

    @GetMapping("/requesterList")
    public void controllerList(ListDTO listDTO, Model model){
        log.info("requesterList test............");
        log.info(listDTO );

        ListResponseDTO<RequesterDTO> responseDTO = adminService.getRequesterList(listDTO);

        model.addAttribute("reqDtoList",responseDTO.getDtoList());

        int total = responseDTO. getTotal();
        model.addAttribute("pageMaker",new PageMaker(listDTO.getPage(),total));
        model.addAttribute("aa","Delete");
    }
}
