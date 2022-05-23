package org.zerock.oscatest.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.zerock.oscatest.domain.Company;

import org.zerock.oscatest.dto.CompanyDTO;
import org.zerock.oscatest.mapper.CompanyMapper;

@Log4j2
@Service
@RequiredArgsConstructor
public class CompanyServiceImpl implements CompanyService{

    private final PasswordEncoder passwordEncoder;
    private final CompanyMapper companyMapper;
    private final ModelMapper modelMapper;
    
    // 회원가입=============================================================================
    @Override
    public void register(CompanyDTO companyDTO) {
        companyMapper.insert(Company.builder()
                .comId(companyDTO.getComId())
                        .password(passwordEncoder.encode(companyDTO.getPassword()))
                .comName(companyDTO.getComName())
                        .comPhone(companyDTO.getComPhone())
                        .comCategory(companyDTO.getComCategory())
                        .comEmail(companyDTO.getComEmail())
                        .comProfile(companyDTO.getComProfile())
                        .conNo(companyDTO.getConNo())
                        .businessNum(companyDTO.getBusinessNum())
                        .businessCheck(companyDTO.getBusinessCheck())
                        .comIntro(companyDTO.getComIntro())
                        .comAddress(companyDTO.getComAddress())
                        .authority("COMPANY")
                .build());
    }

    // mypage 정보=========================================================================
    @Override
    public CompanyDTO getInfo(String comId) {

        Company company = companyMapper.info(comId);

        log.info("=================================");
        log.info("=================================");
        log.info(company);
        log.info("=================================");
        log.info("=================================");



        CompanyDTO companyDTO = modelMapper.map(company, CompanyDTO.class);

        return companyDTO;
    }

    // 회원탈퇴==============================================================================
    @Override
    public void delete(String comId) {
        companyMapper.delete(comId);
    }

    // 회원정보 수정==========================================================================
    @Override
    public void update(CompanyDTO companyDTO) {
        companyMapper.update(Company.builder()
                .comId(companyDTO.getComId())
                .comName(companyDTO.getComName())
                .build());
    }

}
