package org.zerock.oscatest.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.coobird.thumbnailator.Thumbnails;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.oscatest.dto.UploadResultDTO;
//import org.zerock.oscatest.service.FileService;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Log4j2
@Controller
@RequiredArgsConstructor
public class UploadController {

//    private final FileService fileService;

    @GetMapping("/view")
    public ResponseEntity<byte[]> viewFile(String fileName){
        log.info("===================================");
        log.info(fileName);
        log.info("===================================");

        File targetFile = new File("C:\\upload\\"+fileName);

        log.info(targetFile);

        try {
            String mimeType = Files.probeContentType(targetFile.toPath());

            log.info("========================");
            log.info(mimeType);

            byte[] data = FileCopyUtils.copyToByteArray(targetFile);

            return ResponseEntity.ok().header("Content-Type",mimeType)
                    .body(data);

        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(404).build();
        }

    }


    @PostMapping("/delete")
    @ResponseBody
    public Map<String, String> deleteFile(String fileName){
        int idx = fileName.lastIndexOf("/");
        String path = fileName.substring(0,idx);
        String name = fileName.substring(idx+1);//uuid_fileName
        String uuid = name.substring(0,name.indexOf("_"));

        log.info("path: " + path);
        log.info("name: " + name);

        File targetFile = new File("C:\\upload\\"+fileName);

        boolean result = targetFile.delete();

        //thumbnail
        if(result){
            File thumbFile = new File("C:\\upload\\"+path+"\\s_"+name);
            thumbFile.delete();
        }

        return Map.of("result", "success");
    }

    @PostMapping("/upload1")
    @ResponseBody
    public List<UploadResultDTO> upload1(MultipartFile[] files) {
        log.info("======================");
        log.info(files);
        log.info("======================");

        List<UploadResultDTO> list = new ArrayList<>();

        //업로드된 파일 있다고 가정
        for (MultipartFile file : files) {

            log.info("======================");
            log.info(file.getOriginalFilename());
            log.info(file.getResource());
            log.info(makeFolders());
            log.info(file.getContentType());
            log.info("======================");


            String originalFileName = file.getOriginalFilename();

            boolean img = file.getContentType().startsWith("image");

            String uuid = UUID.randomUUID().toString();

            String saveName = uuid + "_" + originalFileName;

            String saveFolder = makeFolders();

            File saveFile = new File("C:\\upload\\" + saveFolder + "\\" + saveName);

            try (InputStream in = file.getInputStream();
                 FileOutputStream fos = new FileOutputStream(saveFile);
            ) {

                FileCopyUtils.copy(in, fos);
            } catch (IOException e) {
                e.printStackTrace();
            }

            if (img) {
                //saveName = UUID+"_"+fileName
                String thumbFileName = saveFolder + "\\s_" + saveName;
                File thumbFile = new File("C:\\upload\\" + thumbFileName);

                try {
                    Thumbnails.of(saveFile)
                            .size(200, 200)
                            .toFile(thumbFile);
                } catch (IOException e) {
                    e.printStackTrace();
                }

            }

            UploadResultDTO uploadResultDTO =UploadResultDTO.builder()
                    .fileName(originalFileName)
                    .uuid(uuid)
                    .img(img)
                    .savePath(saveFolder)
                    .build();

            list.add(uploadResultDTO);
            log.info("======================");
        }

        return list;
    }


    //저장할 파일들의 폴더 위치 생성
    private String makeFolders() {

        //날짜 데이터는 기본 단순 자료형이 아니기 때문에 자료 형을 단순화 시켜야함
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        //단순화 자료화된 변수에 기본 날짜값 선언
        String str = sdf.format(new java.util.Date());
        //저장 할 폴더 경로 지정
        File folderPath = new File("C:\\upload\\" + str);

        //위치에 폴더가 존재하지 않을 시
        if (!folderPath.exists()) {
            //저장 폴더 생성
            folderPath.mkdirs();
        }

        return str;
    }

}
