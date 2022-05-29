package org.zerock.oscatest.dto;

import lombok.Data;

import java.time.LocalDate;

@Data
public class NegoDTO {

    private Integer negoNo;
    private String worker;
    private String requester;
    private Integer replyCount;

    private LocalDate regDate;
    private LocalDate updateDate;
    private int delFlag;

}
