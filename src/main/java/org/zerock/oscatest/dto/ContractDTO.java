package org.zerock.oscatest.dto;

import lombok.Data;

import java.time.LocalDate;

@Data
public class ContractDTO {
    private Integer conno;
    private String reqID;
    private String conID;
    private String categoryNum;
    private String conArea;
    private String conScope;
    private String conContent;
    private LocalDate conStart;
    private LocalDate conEnd;
    private String conName;
    private String conFileNum;
    private String price;
    private String negotiationNum;

    private LocalDate regDate;
    private LocalDate updateDate;
}
