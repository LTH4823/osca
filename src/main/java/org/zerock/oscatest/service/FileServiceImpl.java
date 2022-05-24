package org.zerock.oscatest.service;

import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.zerock.oscatest.domain.AttachFile;
import org.zerock.oscatest.dto.UploadResultDTO;
import org.zerock.oscatest.mapper.FileMapper;

@Service
@RequiredArgsConstructor
public class FileServiceImpl implements FileService{

    private final FileMapper fileMapper;
    private final ModelMapper modelMapper;

    @Override
    public void register(UploadResultDTO uploadResultDTO) {
        //uploadResultDTO => AttachFile
        AttachFile attachFile = modelMapper.map(uploadResultDTO, AttachFile.class);
        fileMapper.insert(attachFile);
    }

    @Override
    public void remove(String uuid) {
        fileMapper.delete(uuid);
    }
}
