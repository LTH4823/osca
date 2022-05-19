package org.zerock.oscatest.domain;

import lombok.*;

import java.time.LocalDate;

@Getter
@Builder
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Company {
    private String comId;
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

    private LocalDate regDate;
    private LocalDate updateDate;
    private int delFlag ;
}
