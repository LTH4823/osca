package org.zerock.oscatest.dto;

import lombok.Data;

import java.time.LocalDate;

@Data
public class BidderDTO {

    private String bId;
    private Integer conNo;
    private String comId;
    private String price;
    private int state;

    private LocalDate regDate;
    private LocalDate updateDate;
    private int delFlag ;

}
