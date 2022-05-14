package org.zerock.oscatest.mapper;

import org.zerock.oscatest.domain.Admin;
import org.zerock.oscatest.dto.ListDTO;

import java.util.List;

public interface AdminMapper {
    List<Admin> selectAdminList(ListDTO listDTO);
    int getAdminTotal(ListDTO listDTO);
    void updateAsRemove(Integer adno);
}
