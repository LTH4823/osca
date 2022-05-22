package org.zerock.oscatest.mapper;

import org.zerock.oscatest.domain.Contract;

import java.util.List;

public interface ContractMapper {

    List<Contract>contractList();
    List<Contract>contractProgressList();
    List<Contract>contractSuccessList();
    List<Contract>contractFailList();

    void registerContract();
    void removeContract();
    void modifyContract();

}
