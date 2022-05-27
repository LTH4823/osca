package org.zerock.oscatest.domain;


import lombok.*;

import java.time.LocalDate;

@Getter
@Builder
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Bidder {

    private String bId;
    private Integer conNo;
    private String comId;
    private String price;
    private int state;

    private LocalDate regDate;
    private LocalDate updateDate;
    private int delFlag ;

}
