package org.zerock.oscatest.mapper;

import org.zerock.oscatest.domain.Bidder;

import java.util.List;

public interface BidderMapper {

    List<Bidder>getList(String comId);
    void updateAsBid(Integer conNo, String comId, String price);
    void updateAsRaise(String comId, Integer conNo, String price);
    void updateAsPay(String price, String comId, Integer conNo);
    void updateAsRemove(String comId, Integer conNo);
    void delete();

}
