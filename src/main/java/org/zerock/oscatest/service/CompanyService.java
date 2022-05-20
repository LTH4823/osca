package org.zerock.oscatest.service;

import org.springframework.transaction.annotation.Transactional;
import org.zerock.oscatest.dto.CompanyDTO;
import org.zerock.oscatest.dto.CompanyRegisterDTO;

@Transactional
public interface CompanyService {
    CompanyDTO getInfo(String comId);
    void register(CompanyRegisterDTO companyDTO);
    void delete(String comId);
    void update(CompanyRegisterDTO companyDTO);
}
