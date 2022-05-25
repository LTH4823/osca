package org.zerock.oscatest.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ContractDTO {
    private Integer conNo;
    private String conName;
    private String conCategory;
    private String conLocation;
    private String conSpace;
    private String conContent;
    private String conRequest;
    private String conCondition;
    private String conStartDay;
    private String conEndDay;
    private String conPrice;
    private String conDocument;
    private String conImg;
    private String memId;
    private String comId;
    private String conState;

    private List<UploadResultDTO> uploads = new ArrayList<>();

    private LocalDate regDate;
    private LocalDate updateDate;
    private int delFlag;

    public String getMain(){
        if (conImg ==null){
            return null;
        }

        int idx = conImg.indexOf("s_");
        String first = conImg.substring(0, idx);
        String second = conImg.substring(idx +2);

        return first + second;
    }

}
