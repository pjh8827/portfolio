package com.ssafy.api;

import com.ssafy.api.handler.CUserNotFoundException;
import com.ssafy.domain.User;
import com.ssafy.domain.exception.DomainException;
import com.ssafy.domain.exception.EmptyListException;
import com.ssafy.domain.exception.NotFoundException;
import com.ssafy.domain.repository.IUserRepository;
import com.ssafy.domain.service.UserService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

import javax.websocket.server.PathParam;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/api")
public class UserController {
	public static final Logger logger = LoggerFactory.getLogger(UserController.class);

	private final UserService service;
	
	@Autowired
	public UserController(UserService service) {
		this.service = service;
	}
	
	// user 생성
	@PostMapping(value = "/users")
	public ResponseEntity<Void> postUser(@RequestBody User user) {

		logger.debug("Calling postUser()");

		service.postUser(user);
		
		return new ResponseEntity<Void>(HttpStatus.CREATED);
	}

	// user의 email로 조회
	@GetMapping(value = "/users/{email}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<User> findByEmail(@PathVariable String email) {

		logger.debug("Calling findByEmail() ");

		User user = service.findByEmail(email);

		if (user == null) {
			logger.error("NOT FOUND email: ", email);
			throw new NotFoundException(email + " 회원 정보를 찾을 수 없습니다.");
		}

		return new ResponseEntity<User>(user, HttpStatus.OK);

	}

	// 모든 user 조회
	@GetMapping(value = "/users", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<User>> findAll() {

		logger.debug("Calling findAll()");

		List<User> list = service.findAll();

		return new ResponseEntity<List<User>>(list, HttpStatus.OK);
	}

	// user의 email로 삭제
	@DeleteMapping(value = "/users/{email}")
	public ResponseEntity<Void> deleteUser(@PathVariable String email) {

		logger.debug("Calling deleteUser() ");

		service.deleteUser(email);

		return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
	}

}
