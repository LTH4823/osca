package org.zerock.oscatest.dto;

import lombok.Data;

import java.time.LocalDate;

@Data
public class AdminDTO {
    private Integer adno;
    private String adID;
    private String adName;
    private String adCall;
    private String adEmail;
    private Integer authority;

    private LocalDate regDate;
    private LocalDate updateDate;
}
