package org.zerock.oscatest.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.oscatest.dto.CompanyDTO;
import org.zerock.oscatest.service.CompanyService;
import org.zerock.oscatest.service.ContractService;

@Log4j2
@Controller
@RequestMapping("/info/")
@RequiredArgsConstructor
public class GetInfoController {

    private final CompanyService companyService;
    private final ContractService contractService;
    private final ModelMapper modelMapper;

    @GetMapping("/{comId}")
    @ResponseBody
//    , Model model
    public CompanyDTO companyGET(@PathVariable("comId")String comId){
        log.info("===============================");
        log.info(comId);
        CompanyDTO companyDTO = companyService.getInfo(comId);
        log.info(companyDTO);
//        model.addAttribute("company", companyService.getInfo(comId));
        return companyDTO;
    }
}
