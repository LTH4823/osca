package org.zerock.oscatest.dto;

import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.time.LocalDate;
import java.util.Collection;

@Getter
@Setter
@ToString
public class CompnayDTO extends User {
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

    public CompnayDTO(String username, String password, Collection<? extends GrantedAuthority> authorities) {
        super(username, password, authorities);

        this.comId = username;
        this.comPw = password;

    }
}
