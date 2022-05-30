package org.zerock.oscatest.mapper;

import org.zerock.oscatest.domain.Negotiation;
import org.zerock.oscatest.dto.ListDTO;

import java.util.List;

public interface NegotiationMapper {

    void insert(Negotiation negotiation);
    List<Negotiation> getList(ListDTO listDTO);

}
