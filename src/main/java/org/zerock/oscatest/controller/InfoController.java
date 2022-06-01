package org.zerock.oscatest.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.zerock.oscatest.dto.CompanyDTO;
import org.zerock.oscatest.dto.ContractDTO;
import org.zerock.oscatest.service.CompanyService;
import org.zerock.oscatest.service.ContractService;

@Log4j2
@Controller
@RequestMapping("/info/")
@RequiredArgsConstructor
public class InfoController {

    private final CompanyService companyService;
    private final ContractService contractService;

    @GetMapping("company/{comId}")
    @ResponseBody
    public CompanyDTO companyGET(@PathVariable("comId") String comId) {
        log.info("===============================");
        log.info(comId);
        CompanyDTO companyDTO = companyService.getInfo(comId);
        log.info(companyDTO);
        return companyDTO;
    }

    @GetMapping("contract/{conNo}")
    @ResponseBody
    public ContractDTO cotractGET(@PathVariable("conNo") Integer conNo) {
        log.info("===============================");
        log.info(conNo);
        ContractDTO contractDTO = contractService.getOne(conNo);
        log.info(contractDTO);
        return contractDTO;
    }
}

