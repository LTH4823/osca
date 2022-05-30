package org.zerock.oscatest.domain;

import lombok.*;

import java.time.LocalDate;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Comment {

    private Integer rno;
    private Integer negoNo;
    private String replyText;
    private String replyer;
    private LocalDate regDate;
    private LocalDate updateDate;

}
