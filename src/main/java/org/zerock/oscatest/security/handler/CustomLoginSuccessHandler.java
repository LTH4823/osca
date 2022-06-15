package org.zerock.oscatest.security.handler;

import lombok.Data;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.zerock.oscatest.dto.CompanyDTO;
import org.zerock.oscatest.service.CompanyService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Data
@Log4j2
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

    CompanyService companyService;

    private static int TIME = 60 * 60 * 24;
    private String defaultUrl;

    private RequestCache reqCache = new HttpSessionRequestCache();
    private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {

        log.info("================================================");
        log.info("================================================");
        log.info("================================================");

        //로그인 유저 DTO 정보
        HttpSession session = request.getSession();
        log.info(session);
        session.setAttribute("comdto", "companyDTO");
        session.setMaxInactiveInterval(TIME);
        log.info("================================================");
        log.info("================================================");
        log.info("================================================");
        //에러 세션 지우기



    }



}
