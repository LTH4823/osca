package org.zerock.oscatest.mapper;

import org.zerock.oscatest.domain.Bidder;
import org.zerock.oscatest.dto.BidderDTO;

import java.util.List;

public interface BidderMapper {

    List<Bidder>getList(String comId);
    void updateAsBid(BidderDTO bidderDTO);
    void updateAsRaise(BidderDTO bidderDTO);
    void updateAsPay(BidderDTO bidderDTO);
    void updateAsRemove(String comId, Integer conNo);
//    void updateAsRemove(String comId, Integer conNo);

    void delete();
}
