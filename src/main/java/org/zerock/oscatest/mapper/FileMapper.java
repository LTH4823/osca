package org.zerock.oscatest.mapper;

import org.zerock.oscatest.domain.AttachFile;
import org.zerock.oscatest.domain.Pick;

public interface FileMapper {
    void insert(Pick pick);
    void delete (String uuid);
}
