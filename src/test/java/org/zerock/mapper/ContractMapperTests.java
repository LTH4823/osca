package org.zerock.mapper;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.zerock.oscatest.mapper.ContractMapper;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class ContractMapperTests {

    @Autowired(required = false)
    private ContractMapper contractMapper;

    @Test
    public void contractList(){
        contractMapper.contractAuctionList();
        log.info("success");
    }


    @Test
    public void insert(){
        contractMapper.insert();
        log.info("success");
    }


    @Test void  update(){
        contractMapper.update();
        log.info("success");
    }

    @Test void  updateAsRemove(){
        contractMapper.updateAsRemove();
        log.info("success");
    }

}
