package org.zerock.oscatest.service;

import org.springframework.transaction.annotation.Transactional;
import org.zerock.oscatest.dto.CompnayDTO;

@Transactional
public interface CompanyService {
    CompnayDTO getInfo(String comId);
    void register(CompnayDTO compnayDTO);
    void delete(String comId);
    void update(CompnayDTO compnayDTO);
}
