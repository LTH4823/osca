package org.zerock.oscatest.domain;

import lombok.*;

import java.time.LocalDate;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Requester {
    private Integer reqno;
    private String reqID;
    private String reqName;
    private String reqCall;
    private String reqEmail;
    private String reqImg;
    private String residentNum;

    private LocalDate regDate;
    private LocalDate updateDate;
    private int reqDelFlag ;

    private String reqAddress;
    private String reqPW;
    private String reqBirth;
}
