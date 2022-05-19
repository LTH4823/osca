package org.zerock.oscatest.domain;

import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.time.LocalDate;
import java.util.Collection;

@Getter
@Builder
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Company{
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
