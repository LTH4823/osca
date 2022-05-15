package org.zerock.oscatest.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.zerock.oscatest.domain.Requester;
import org.zerock.oscatest.dto.RequesterDTO;
import org.zerock.oscatest.mapper.RequesterMapper;

@Log4j2
@Service
@RequiredArgsConstructor
public class RequesterServiceImpl implements RequesterService {

    private RequesterMapper requesterMapper;
    private ModelMapper modelMapper;

    @Override
    public void insert(RequesterDTO requesterDTO) {
        requesterMapper.insert(Requester.builder()
                .reqID(requesterDTO.getReqID())
                .reqName(requesterDTO.getReqName())
                .reqCall(requesterDTO.getReqCall())
                .reqEmail(requesterDTO.getReqEmail())
                .reqAddress(requesterDTO.getReqAddress())
                .reqImg(requesterDTO.getReqImg())
                .reqBirth(requesterDTO.getReqBirth())
                .reqPW(requesterDTO.getReqPW())
                .build());
    }
}
