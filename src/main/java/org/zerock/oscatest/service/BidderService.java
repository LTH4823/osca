package org.zerock.oscatest.service;

import org.springframework.transaction.annotation.Transactional;
import org.zerock.oscatest.domain.Bidder;
import org.zerock.oscatest.dto.BidderDTO;

import java.util.List;

@Transactional
public interface BidderService {
    List<Bidder> getList(String comId);
    void insert(BidderDTO bidderDTO);
    void updateAsBid(BidderDTO bidderDTO);
    void updateAsRaise(BidderDTO bidderDTO);
    void updateAsRemove(String comId, Integer conNo);
}
