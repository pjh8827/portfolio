package com.ssafy.domain.service;

import javax.transaction.Transactional;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

import com.ssafy.api.handler.CUserNotFoundException;
import com.ssafy.domain.repository.IUserRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MyUserDetailService implements UserDetailsService {

	private final IUserRepository userRepository;

	@Transactional
	@Override
	public UserDetails loadUserByUsername(String email) {
		return userRepository.findByEmail(email).orElseThrow(CUserNotFoundException::new);
	}
}
