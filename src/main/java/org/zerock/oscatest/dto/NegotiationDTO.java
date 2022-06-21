package org.zerock.oscatest.dto;

import lombok.Data;

import java.time.LocalDate;

@Data
public class NegotiationDTO {

    private Integer negoNo;
    private Integer conNo;
    private String conName;
    private String worker;
    private String price;
    private String requester;
    private Integer commentCount;


    private LocalDate regDate;
    private LocalDate updateDate;
    private int delFlag;

}
