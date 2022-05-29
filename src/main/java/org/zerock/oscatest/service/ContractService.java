package org.zerock.oscatest.service;

import org.springframework.transaction.annotation.Transactional;
import org.zerock.oscatest.dto.*;

import java.util.List;

@Transactional
public interface ContractService {

    void register(ContractDTO contractDTO);

    ListResponseDTO<ContractDTO>getList(ListDTO listDTO);
    ContractDTO getOne(Integer conNo);

    void insert(ContractDTO contractDTO);
    void update(ContractDTO contractDTO);
    void remove(Integer conNo);
    List<UploadResultDTO> getFiles(Integer conNo);

    ListResponseDTO<ContractDTO>getAddList(ContractAddListDTO contractAddListDTO);

}
