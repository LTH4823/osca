package org.zerock.oscatest.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Controller;
import org.zerock.oscatest.service.CompanyService;
import org.zerock.oscatest.service.ContractService;

@Log4j2
@Controller
@RequiredArgsConstructor
public class GetInfoController {

    private final CompanyService companyService;
    private final ContractService contractService;
    private final ModelMapper modelMapper;

}
