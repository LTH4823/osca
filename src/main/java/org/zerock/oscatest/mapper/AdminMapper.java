package org.zerock.oscatest.mapper;

import org.zerock.oscatest.domain.Admin;
import org.zerock.oscatest.domain.Contract;
import org.zerock.oscatest.domain.Contractor;
import org.zerock.oscatest.domain.Requester;
import org.zerock.oscatest.dto.ListDTO;

import java.util.List;

public interface AdminMapper {

    List<Admin> selectAdminList(ListDTO listDTO);
    int getAdminTotal(ListDTO listDTO);

    List<Contract> selectContractList(ListDTO listDTO);
    int getContractTotal(ListDTO listDTO);

    List<Contractor> selectContractorList(ListDTO listDTO);
    int getContractorTotal(ListDTO listDTO);

    List<Requester> selectRequesterList(ListDTO listDTO);
    int getRequesterTotal(ListDTO listDTO);
}
