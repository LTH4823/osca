package org.zerock.oscatest.service;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.zerock.oscatest.domain.Company;
import org.zerock.oscatest.dto.CompnayDTO;
import org.zerock.oscatest.mapper.CompanyMapper;

@Log4j2
@Service
@RequiredArgsConstructor
public class CompanyServiceImpl implements CompanyService{

    private final PasswordEncoder passwordEncoder;
    private final CompanyMapper companyMapper;
    private final ModelMapper modelMapper;

    // mypage 정보=========================================================================
    @Override
    public CompnayDTO getInfo(String comId) {

        Company company = companyMapper.info(comId);

        CompnayDTO compnayDTO = modelMapper.map(company, CompnayDTO.class);

        return compnayDTO;
    }

    // 회원가입=============================================================================
    @Override
    public void register(CompnayDTO compnayDTO) {
        companyMapper.insert(Company.builder()
                .comId(compnayDTO.getComId())
                        .comPw(passwordEncoder.encode(compnayDTO.getComPw()))
                .comName(compnayDTO.getComName())
                        .comPhone(compnayDTO.getComPhone())
                        .comCategory(compnayDTO.getComCategory())
                        .comEmail(compnayDTO.getComEmail())
                        .comProfile(compnayDTO.getComProfile())
                        .conNo(compnayDTO.getConNo())
                        .businessNum(compnayDTO.getBusinessNum())
                        .businessCheck(compnayDTO.getBusinessCheck())
                        .comIntro(compnayDTO.getComIntro())
                        .comAddress(compnayDTO.getComAddress())
                        .authority("COMPANY")
                .build());
    }

    // 회원탈퇴==============================================================================
    @Override
    public void delete(String comId) {
        companyMapper.delete(comId);
    }

    // 회원정보 수정==========================================================================
    @Override
    public void update(CompnayDTO compnayDTO) {
        companyMapper.update(Company.builder()
                .comId(compnayDTO.getComId())
                .comName(compnayDTO.getComName())
                .build());
    }
}
