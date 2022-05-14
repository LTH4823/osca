package org.zerock.mapper;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.zerock.oscatest.dto.ListDTO;
import org.zerock.oscatest.mapper.AdminMapper;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class AdminMapperTests {

    @Autowired(required = false)
    private AdminMapper adminMapper;

    @Test
    public void testAdminList(){
        ListDTO listDTO = new ListDTO();
        adminMapper.selectAdminList(listDTO);
    }

}
