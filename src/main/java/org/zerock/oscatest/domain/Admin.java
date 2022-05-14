package org.zerock.oscatest.domain;

import lombok.*;

import java.time.LocalDate;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Admin {
    private Integer adno;
    private String adID;
    private String adName;
    private String adCall;
    private String adEmail;
    private Integer authority;

    private LocalDate regDate;
    private LocalDate updateDate;
}
