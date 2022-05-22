package org.zerock.oscatest.mapper;

import org.zerock.oscatest.domain.Contract;
import org.zerock.oscatest.dto.ContractDTO;
import org.zerock.oscatest.dto.ListDTO;

import java.util.List;

public interface ContractMapper {

    List<Contract>contractAuctionList(ListDTO listDTO);

//    원래 company 나 admin 가야할 놈들
    List<Contract>contractProgressList();
    List<Contract>contractSuccessList();
    List<Contract>contractFailList();

    int getTotal(ListDTO listDTO);

    Contract getOne(Integer conNo);

    void insert(Contract contract);
    void updateAsRemove(Integer conNo);
    void update(Contract contract);

}
