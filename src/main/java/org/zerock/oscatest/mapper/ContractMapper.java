package org.zerock.oscatest.mapper;

import org.zerock.oscatest.domain.Contract;
import org.zerock.oscatest.domain.Pick;
import org.zerock.oscatest.dto.ContractAddListDTO;
import org.zerock.oscatest.dto.ListDTO;

import java.util.List;

public interface ContractMapper {

    List<Contract>allList(ListDTO listDTO);

//    원래 company 나 admin 가야할 놈들
    List<Contract>progressList();
    List<Contract>finishList();
    List<Contract>addList(ContractAddListDTO contractAddListDTO);

    int getTotal(ListDTO listDTO);
    int getContractTotal(ContractAddListDTO contractAddListDTO);

    Contract getOne(Integer conNo);

    void insert(Contract contract);
    void updateAsRemove(Integer conNo);
    void update(Contract contract);

    void updateToWorker(Contract contract);

    void updateAsNegotiation(Integer conNo);

    List<Pick> selectFiles(Integer conNo);



}
