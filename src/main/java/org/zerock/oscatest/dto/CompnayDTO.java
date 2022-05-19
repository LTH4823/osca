package org.zerock.oscatest.dto;

import lombok.Data;

import java.time.LocalDate;

@Data
public class CompnayDTO {
    private String comId;
    private String comPw;
    private String comName;
    private String comPhone;
    private String comEmail;
    private String comAddress;
    private String businessNum;
    private String businessCheck;
    private String comIntro;
    private String comCategory;

    private Integer conNo;
    private String comProfile;

    private String authority;

    private LocalDate regDate;
    private LocalDate updateDate;
    private int delFlag ;
}
