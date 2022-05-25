package org.zerock.oscatest.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CompanyDTO {

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

    public String getProfile(){

        if(comProfile == null){
            return "";
        }
        try {
            return URLEncoder.encode(comProfile, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return "";
    }

}
