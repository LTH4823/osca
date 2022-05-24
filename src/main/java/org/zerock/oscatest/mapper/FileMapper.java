package org.zerock.oscatest.mapper;

import org.zerock.oscatest.domain.AttachFile;

public interface FileMapper {
    void insert(AttachFile attachFile);
    void delete (String uuid);
}
