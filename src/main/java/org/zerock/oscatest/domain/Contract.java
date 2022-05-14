package org.zerock.oscatest.domain;

import lombok.*;

import java.time.LocalDate;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Contract {

    private Integer conno;
    private String reqID;
    private String conID;
    private String categoryNum;
    private String conArea;
    private String conScope;
    private String conContent;
    private LocalDate conStart;
    private LocalDate conEnd;
    private String conName;
    private String conFileNum;
    private String price;
    private String negotiationNum;

    private LocalDate regDate;
    private LocalDate updateDate;
}
