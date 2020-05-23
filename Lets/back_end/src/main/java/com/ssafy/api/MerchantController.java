package com.ssafy.api;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.domain.Category;
import com.ssafy.domain.Merchant;
import com.ssafy.domain.Sigun;
import com.ssafy.domain.User;
import com.ssafy.domain.repository.IMerchantRepository;
import com.ssafy.domain.service.MerchantService;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/api")
public class MerchantController {
	public static final Logger logger = LoggerFactory.getLogger(MerchantController.class);

	private final MerchantService service;
	
	@Autowired
	public MerchantController(MerchantService service) {
		this.service = service;
	}
	
	// 모든 merchant 조회
	@GetMapping(value = "/merchants", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<Merchant>> findAll() {

		logger.debug("Calling merchant findAll()");
		
		List<Merchant> list = service.findAll();
		
		return new ResponseEntity<List<Merchant>>(list, HttpStatus.OK);
	}
	
	// 가게명으로  merchant 조회
	@GetMapping(value = "/merchants/{cmpnmNm}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<Merchant>> findByCmpnmNmLike(@PathVariable String cmpnmNm) {

		logger.debug("Calling findByCmpnmNmLike()");

		List<Merchant> merchants = service.findByCmpnmNmLike(cmpnmNm);

		return new ResponseEntity<List<Merchant>>(merchants, HttpStatus.OK);

	}

}
