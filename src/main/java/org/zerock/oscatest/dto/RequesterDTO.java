package org.zerock.oscatest.dto;

import lombok.Data;

import java.time.LocalDate;

@Data
public class RequesterDTO {
    private Integer reqno;
    private String reqID;
    private String reqName;
    private String reqCall;
    private String reqEmail;
    private String reqImg;

    private LocalDate regDate;
    private LocalDate updateDate;
    private int reqDelFlag ;

    private String reqAddress;
    private String reqPW;
    private String reqBirth;
}
