package org.zerock.oscatest.dto;

import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.time.LocalDate;
import java.util.Collection;

@Getter
@Setter
@ToString
//@Data

public class CompanyDTO extends User{
    private String comId;
    private String password;
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



    public CompanyDTO(String username, String password, Collection<? extends GrantedAuthority> authorities) {
        super(username, password, authorities);

        this.comId = username;
        this.password = password;

    }
}
