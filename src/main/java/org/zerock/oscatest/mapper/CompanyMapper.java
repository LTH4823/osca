package org.zerock.oscatest.mapper;

import org.apache.ibatis.annotations.Param;
import org.zerock.oscatest.domain.Company;
import org.zerock.oscatest.dto.CompnayDTO;

import java.util.List;

public interface CompanyMapper {
//    @Param("comId") String comId, @Param("comName") String comName
    void insert(Company company);

    Company info(String comId);

    void delete(String comId);

    //    void update(@Param("comName") String comName ,@Param("comId") String comId);
    void update(Company company);
}
