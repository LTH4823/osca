package org.zerock.oscatest.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.zerock.oscatest.domain.Bidder;
import org.zerock.oscatest.dto.BidderDTO;
import org.zerock.oscatest.mapper.BidderMapper;

import java.util.List;

@Log4j2
@Service
@RequiredArgsConstructor
public class BidderServiceImpl implements BidderService{

    private final BidderMapper bidderMapper;

    @Override
    public List<Bidder> getList(String comId) {
        return null;
    }

    @Override
    public void insert(BidderDTO bidderDTO) {
        bidderMapper.insert(Bidder.builder()
                .comId(bidderDTO.getComId())
                        .conNo(bidderDTO.getConNo())
                        .price(bidderDTO.getPrice())
                .build());
    }

    @Override
    public void updateAsBid(BidderDTO bidderDTO) {

    }

    @Override
    public void updateAsRaise(BidderDTO bidderDTO) {

    }

    @Override
    public void updateAsRemove(String comId, Integer conNo) {

    }
}
