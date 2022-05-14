package org.zerock.oscatest.dto;

import lombok.Data;

import java.time.LocalDate;

@Data
public class ContractorDTO {
    private Integer ctno;
    private String ctID;
    private String categoryNum;
    private String ctName;
    private String businessNum;
    private String ctCall;
    private String ctEmail;
    private String ctAddress;
    private String ctFileNum;

    private LocalDate regDate;
    private LocalDate updateDate;
    private int ctDelFlag ;
}
