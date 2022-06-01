package org.zerock.oscatest.mapper;

import org.apache.ibatis.annotations.Param;
import org.zerock.oscatest.domain.Bidder;
import org.zerock.oscatest.dto.BidderDTO;
import org.zerock.oscatest.dto.BidderListDTO;
import org.zerock.oscatest.dto.ListDTO;

import java.util.List;

public interface BidderMapper {

    List<Bidder>getList(BidderListDTO bidderListDTO);
    void insert(Bidder bidder);
    Bidder getOne(Integer bno);

    void updateAsSelect(String comId);
    void allUpdateAsRemove();

//    void updateAsRemove(String comId, Integer conNo);
//    int getBidderTotal(@Param("comId") String comId, @Param("conNo") Integer conNo);

    int getBidderTotal(BidderListDTO bidderListDTO);
    void delete();
}
