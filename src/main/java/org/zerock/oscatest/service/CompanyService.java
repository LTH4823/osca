package org.zerock.oscatest.service;

import org.springframework.transaction.annotation.Transactional;
import org.zerock.oscatest.dto.CompanyDTO;

@Transactional
public interface CompanyService {
    CompanyDTO getInfo(String comId);
    void register(CompanyDTO companyDTO);
    void delete(String comId);
    void update(CompanyDTO companyDTO);
}
