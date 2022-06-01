package org.zerock.oscatest.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.zerock.oscatest.domain.Company;
import org.zerock.oscatest.domain.Contract;
import org.zerock.oscatest.domain.Negotiation;
import org.zerock.oscatest.domain.Pick;
import org.zerock.oscatest.dto.ContractDTO;
import org.zerock.oscatest.dto.ListResponseDTO;
import org.zerock.oscatest.dto.NegotiationDTO;
import org.zerock.oscatest.dto.NegotiationListDTO;
import org.zerock.oscatest.mapper.NegotiationMapper;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class NegotiationServiceImpl implements NegotiationService {

    private final NegotiationMapper negotiationMapper;
    private final ModelMapper modelMapper;


    @Override
    public void insert(NegotiationDTO negotiationDTO) {

        negotiationMapper.insert(Negotiation.builder()
                .conNo(negotiationDTO.getConNo())
                .worker(negotiationDTO.getWorker())
                .requester(negotiationDTO.getRequester())
                .price(negotiationDTO.getPrice())
                .build());
    }

    @Override
    public ListResponseDTO<NegotiationDTO> getList(NegotiationListDTO negotiationListDTO) {
        List<Negotiation> negotiationList = negotiationMapper.getList(negotiationListDTO);

        List<NegotiationDTO> dtoList =
                negotiationList.stream().map(negotiation ->
                        modelMapper.map(negotiation, NegotiationDTO.class)).collect(Collectors.toList());

        return ListResponseDTO.<NegotiationDTO>builder()
                .dtoList(dtoList)
                .total(negotiationMapper.getTotal(negotiationListDTO)).build();
    }

    @Override
    public NegotiationDTO getOne(Integer negoNo) {
        Negotiation negotiation = negotiationMapper.getOne(negoNo);
        log.info(negotiation);
        NegotiationDTO negotiationDTO = modelMapper.map(negotiation, NegotiationDTO.class);
        log.info(negotiationDTO);
        return negotiationDTO;
    }
}
