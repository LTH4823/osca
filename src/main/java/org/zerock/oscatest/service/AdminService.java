package org.zerock.oscatest.service;

import org.zerock.oscatest.dto.*;

public interface AdminService {
    ListResponseDTO<AdminDTO> getAdminList(ListDTO listDTO);
    ListResponseDTO<RequesterDTO> getRequesterList(ListDTO listDTO);
    ListResponseDTO<ContractDTO> getContractList(ListDTO listDTO);
    ListResponseDTO<ContractorDTO> getContractorList(ListDTO listDTO);
//    void remove(Integer adno);
}
