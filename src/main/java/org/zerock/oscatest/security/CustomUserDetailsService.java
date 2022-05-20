package org.zerock.oscatest.security;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.zerock.oscatest.domain.Company;
import org.zerock.oscatest.dto.CompanyLoginDTO;
import org.zerock.oscatest.mapper.CompanyMapper;

import java.util.Collections;
import java.util.Set;


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

        Set<SimpleGrantedAuthority> authority = Collections.singleton(new SimpleGrantedAuthority("ROLE_" + company.getAuthority()));

//        User user = new User(company.getComId(),company.getPassword(), authority);
//
//        return user;

        CompanyLoginDTO companyDTO = new CompanyLoginDTO(company.getComId(),company.getPassword(), authority);


        return companyDTO;
    }
}

