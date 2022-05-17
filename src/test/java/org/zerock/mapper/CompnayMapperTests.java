package org.zerock.mapper;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.zerock.oscatest.mapper.CompanyMapper;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class CompnayMapperTests {

    @Autowired(required = false)
    private CompanyMapper companyMapper;

    @Test
    public void insert(){
        String comId = "com00";
        String comName = "ct";

        for (int i = 0; i < 12; i++) {
//            companyMapper.insert(comId+i,comName+i);
        }

    }

    @Test
    public void info(){
        String comId = "comId";
        log.info(companyMapper.info(comId));

    }

    @Test
    public void delete(){
        String comId = "comId04";
       companyMapper.delete(comId);
    }

    @Test
    public void update(){
        String comId = "comId03";
        String comName = "sad";
//        companyMapper.update(comName,comId);
    }

}
