package org.zerock.oscatest.security.handler;

import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Log4j2
public class CustomLogoutSuccessHandler implements LogoutSuccessHandler {
    @Override
    public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        if (authentication != null && authentication.getDetails() != null) {
            try {
                request.getSession().invalidate();

                log.info("Login............................");
                log.info("----------------------------------");
                log.info("----------------------------------");

                log.info(request);
                log.info(response);


                log.info("--------------------------------------");

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        response.setStatus(HttpServletResponse.SC_OK);
        response.sendRedirect("/");
    }
}

