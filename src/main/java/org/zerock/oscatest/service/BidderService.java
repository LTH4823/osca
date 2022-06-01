package org.zerock.oscatest.service;

import org.springframework.transaction.annotation.Transactional;
import org.zerock.oscatest.domain.Bidder;
import org.zerock.oscatest.dto.*;

import java.util.List;

@Transactional
public interface BidderService {
    ListResponseDTO<BidderDTO> getList(BidderListDTO bidderListDTO);
    void insert(BidderDTO bidderDTO);
    void updateAsBid(BidderDTO bidderDTO);
    void updateAsRemove(String comId, Integer conNo);
    BidderDTO getOne(Integer bno);

    void updateAsSelect(String comId);
    void allUpdateAsRemove();

}
