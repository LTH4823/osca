package org.zerock.oscatest.security;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.zerock.oscatest.domain.Company;
import org.zerock.oscatest.mapper.CompanyMapper;

import java.util.Collections;


@Log4j2
@RequiredArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {

    private final CompanyMapper companyMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        log.info("===============================");
        log.info("===============================");
        log.info(username);
        log.info("===============================");
        log.info("===============================");
        log.info("===============================");

        Company company = companyMapper.info(username);

        SimpleGrantedAuthority authority = new SimpleGrantedAuthority(company.getAuthority());

        User user = new User(company.getComId(),company.getComPw(), Collections.singleton(authority));

        return user;
    }
}
