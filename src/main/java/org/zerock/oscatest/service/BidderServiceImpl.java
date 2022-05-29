package org.zerock.oscatest.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.zerock.oscatest.domain.Bidder;
import org.zerock.oscatest.domain.Company;
import org.zerock.oscatest.dto.*;
import org.zerock.oscatest.mapper.BidderMapper;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class BidderServiceImpl implements BidderService{

    private final BidderMapper bidderMapper;
    private final ModelMapper modelMapper;


    @Override
    public ListResponseDTO<BidderDTO> getList(BidderListDTO bidderListDTO) {
        List<Bidder> bidderList = bidderMapper.getList(bidderListDTO);


        List<BidderDTO> dtoList =
                bidderList.stream().map(bidder -> modelMapper.map(bidder, BidderDTO.class))
                        .collect(Collectors.toList());


        return ListResponseDTO.<BidderDTO>builder()
                .dtoList(dtoList)
                .total(bidderMapper.getBidderTotal(bidderListDTO))
                .build();
    }

    @Override
    public void insert(BidderDTO bidderDTO) {
        bidderMapper.insert(Bidder.builder()
                .comId(bidderDTO.getComId())
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
