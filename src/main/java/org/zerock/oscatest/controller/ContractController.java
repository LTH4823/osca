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

    @GetMapping("/add/list")
    public void addListGET(){

    }

    @GetMapping("/del/list")
    public void delListGET(){

    }

    @GetMapping("/nego/list")
    public void negoListGET(){

    }

    @GetMapping("/progress/list")
    public void progressListGET(){

    }

    @GetMapping("/finish/list")
    public void finshListGET(){

    }
}
