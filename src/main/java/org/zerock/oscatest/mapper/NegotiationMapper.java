package org.zerock.oscatest.mapper;

import org.zerock.oscatest.domain.Negotiation;
import org.zerock.oscatest.dto.ListDTO;
import org.zerock.oscatest.dto.NegotiationListDTO;

import java.util.List;

public interface NegotiationMapper {

    void insert(Negotiation negotiation);
    List<Negotiation> getList(NegotiationListDTO negotiationListDTO);
    int getTotal(NegotiationListDTO negotiationListDTO);
}
