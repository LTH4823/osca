package org.zerock.mapper;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.zerock.oscatest.domain.Requester;
import org.zerock.oscatest.dto.ListDTO;
import org.zerock.oscatest.mapper.RequesterMapper;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class RequesterMapperTests {
    @Autowired(required = false)
    private RequesterMapper requesterMapper;

    @Test
    public void testAdminList(){
        Requester requester = Requester.builder()
                .reqID("dfdf")
                .reqName("이이이")
                .reqCall("01025557895")
                .reqEmail("asdf343@naver.com")
                .reqAddress("서울특별시 종로구 학원")
                .reqImg("dfdfsdfsadfased")
                .reqBirth("980620")
                .reqPW("dfdsfsd").build();
        requesterMapper.insert(requester);

    }

}
