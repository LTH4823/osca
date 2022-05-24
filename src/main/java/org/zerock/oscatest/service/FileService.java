package org.zerock.oscatest.service;

import org.zerock.oscatest.dto.UploadResultDTO;

public interface FileService {

    void register(UploadResultDTO uploadResultDTO);

    void remove(String uuid);

}
