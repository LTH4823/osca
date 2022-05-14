package org.zerock.oscatest.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.oscatest.dto.AdminDTO;
import org.zerock.oscatest.dto.ListDTO;
import org.zerock.oscatest.dto.ListResponseDTO;
import org.zerock.oscatest.dto.PageMaker;
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

}
