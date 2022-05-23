package org.zerock.oscatest.dto;

import lombok.*;

@Data
@Builder
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class UploadResultDTO {
    private String uuid;
    private String original;
    private String savePath;
    private boolean img;

    public String getLink(){
        return savePath+"/"+uuid+"_"+original;
    }

    public String getThumbnail(){
        return savePath+"/s_"+uuid+"_"+original;
    }

}
