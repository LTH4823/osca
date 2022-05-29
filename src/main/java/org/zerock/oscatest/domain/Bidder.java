package org.zerock.oscatest.domain;


import lombok.*;

import java.time.LocalDate;

@Getter
@Builder
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Bidder {

    private Integer bno;
    private Integer conNo;
    private String comId;
    private String price;
    private int state;

    private String comPhone;
    private String comEmail;
    private String businessNum;
    private String comIntro;
    private String comProfile;




    private LocalDate regDate;
    private LocalDate updateDate;
    private int delFlag ;

}
