package org.zerock.oscatest.domain;

import lombok.*;

import java.time.LocalDate;

@Getter
@Builder
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Nego {

    private Integer negoNo;
    private String worker;
    private String requester;
    private Integer replyCount;

    private LocalDate regDate;
    private LocalDate updateDate;
    private int delFlag;

}
