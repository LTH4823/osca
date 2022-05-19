package org.zerock.oscatest.security.handler;

import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;


@Log4j2
public class CustomUserDetailsService implements UserDetailsService {
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        log.info("===============================");
        log.info("===============================");
        log.info(username);
        log.info("===============================");
        log.info("===============================");
        log.info("===============================");

        return null;
    }
}
