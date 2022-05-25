package org.zerock.oscatest.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.oscatest.dto.*;
import org.zerock.oscatest.service.CompanyService;

@Log4j2
@Controller
@RequestMapping("/company/workers/")
@RequiredArgsConstructor
public class workerController {

    private final CompanyService companyService;

    @GetMapping("list")
    public void workersGET(ListDTO listDTO, Model model){
        log.info("=================================");
        log.info("workers");
        log.info(listDTO);
        ListResponseDTO<CompanyDTO> responseDTO = companyService.getList(listDTO);
        model.addAttribute("dtoList",responseDTO.getDtoList());
        int total = responseDTO.getTotal();
        model.addAttribute("pageMaker", new PageMaker(listDTO.getPage(),total));
    }

    @GetMapping("/")
    public String basic(){
        return "redirect:/company/workers/list";
    }

}
