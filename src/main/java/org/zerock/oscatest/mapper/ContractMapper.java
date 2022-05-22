package org.zerock.oscatest.mapper;

import org.zerock.oscatest.domain.Contract;

import java.util.List;

public interface ContractMapper {

    List<Contract>contractAuctionList();

//    원래 company 나 admin 가야할 놈들
    List<Contract>contractProgressList();
    List<Contract>contractSuccessList();
    List<Contract>contractFailList();

    void insert();
    void updateAsRemove();
    void update();

}
