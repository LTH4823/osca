package org.zerock.oscatest.domain;

import lombok.*;

import java.time.LocalDate;

@Getter
@Builder
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Negotiation {

    private Integer negoNo;
    private String worker;
    private String requester;
    private Integer commentCount;

    private LocalDate regDate;
    private LocalDate updateDate;
    private int delFlag;

}
