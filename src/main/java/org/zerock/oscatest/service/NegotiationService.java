package org.zerock.oscatest.service;

import org.springframework.transaction.annotation.Transactional;
import org.zerock.oscatest.domain.Negotiation;
import org.zerock.oscatest.dto.*;

@Transactional
public interface NegotiationService {
    void insert(NegotiationDTO negotiationDTO);

    ListResponseDTO<NegotiationDTO> getList(NegotiationListDTO negotiationListDTO);
    NegotiationDTO getOne(Integer negoNo);

}
