package org.zerock.oscatest.service;

import org.springframework.transaction.annotation.Transactional;
import org.zerock.oscatest.dto.CompanyDTO;
import org.zerock.oscatest.dto.ListDTO;
import org.zerock.oscatest.dto.ListResponseDTO;

import java.util.List;

@Transactional
public interface CompanyService {
    ListResponseDTO<CompanyDTO> getList(ListDTO listDTO);
    CompanyDTO getInfo(String comId);
    void register(CompanyDTO companyDTO);
    void delete(String comId);
    void update(CompanyDTO companyDTO);
}
