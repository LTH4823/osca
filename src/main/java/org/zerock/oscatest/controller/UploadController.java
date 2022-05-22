package org.zerock.oscatest.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@Log4j2
@RestController
@RequiredArgsConstructor
public class UploadController {

    //단일
    public void upload(MultipartFile file){

        log.info("======================");
        log.info(file);

    }


    //멀티
    public void uploadMulti(MultipartFile[] files){

        log.info("======================");
        log.info(files);

    }


}
