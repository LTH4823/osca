package org.zerock.oscatest.domain;

import lombok.*;

import java.time.LocalDate;

@Getter
@Builder
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Member {

    private String memId;
    private String password;
    private String memName;
    private String memPhone;
    private String memEmail;
    private String memAddress;
    private String businessNum;
    private String businessCheck;
    private String memIntro;
    private String memCategory;

    private Integer memNo;
    private String memProfile;

    private String authority;

    private LocalDate regDate;
    private LocalDate updateDate;
    private int delFlag ;


}
