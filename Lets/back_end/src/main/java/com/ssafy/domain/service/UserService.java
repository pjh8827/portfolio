package com.ssafy.domain.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.ssafy.api.handler.CUserNotFoundException;
import com.ssafy.domain.User;
import com.ssafy.domain.repository.IUserRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class UserService {

	private final IUserRepository repository;
	
	@Transactional
	public void postUser(User user) {
		
		String email = user.getEmail();
		String password = user.getPassword();
		
		repository.save(new User(email, password));
	}
	
	@Transactional
	public List<User> findAll() {

		List<User> list = new ArrayList<>();
		Iterable<User> users = repository.findAll();

		users.forEach(list::add);

		return list;
	}
	
	@Transactional
	public User findByEmail(String email) {
		
		User user = repository.findByEmail(email).orElseThrow(CUserNotFoundException::new);
		
		return user;
	}
	
	@Transactional
	public void deleteUser(String email) {

		repository.deleteByEmail(email);
	}
}
