package org.zerock.oscatest.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.oscatest.dto.NegotiationDTO;

@Log4j2
@Controller
@RequestMapping("contract/nego/comment")
@RequiredArgsConstructor
public class CommentController {

    @GetMapping("list")
    public void commentListGET(){

    }
}
