/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.chandra.prakash.service;

import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.chandra.prakash.repository.UserRepository;

/**
 *
 * @author developer
 */
@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String emailID) throws UsernameNotFoundException {
        return userRepository
                .findByEmailID(emailID)
                .map(u -> new org.springframework.security.core.userdetails.User(
                u.getEmailID(),
                u.getPassword(),
                u.getStatus(),
                u.getStatus(),
                u.getStatus(),
                u.getStatus(),
                AuthorityUtils.createAuthorityList(
                        u.getRoles()
                                .stream()
                                .map(r -> "ROLE_" + r.getName().toUpperCase())
                                .collect(Collectors.toList())
                                .toArray(new String[]{}))))
                .orElseThrow(() -> new UsernameNotFoundException("No user with "
                        + "the name " + emailID + "was found in the database"));
    }

}
