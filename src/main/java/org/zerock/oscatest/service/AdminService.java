package org.zerock.oscatest.service;

import org.zerock.oscatest.dto.AdminDTO;
import org.zerock.oscatest.dto.ListDTO;
import org.zerock.oscatest.dto.ListResponseDTO;

public interface AdminService {
    ListResponseDTO<AdminDTO> getAdminList(ListDTO listDTO);
    void remove(Integer adno);
}
