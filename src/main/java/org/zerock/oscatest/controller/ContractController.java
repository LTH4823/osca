package org.zerock.oscatest.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequestMapping("/company/contract/")
@RequiredArgsConstructor
public class ContractController {

    @GetMapping("/addlist")
    public void addListGET(){

    }

    @GetMapping("/dellist")
    public void delListGET(){

    }

    @GetMapping("/negolist")
    public void negoListGET(){

    }

    @GetMapping("/progresslist")
    public void progressListGET(){

    }

    @GetMapping("/finshlist")
    public void finshListGET(){

    }
}
