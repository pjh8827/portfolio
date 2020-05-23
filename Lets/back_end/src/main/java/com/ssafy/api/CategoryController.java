package com.ssafy.api;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.domain.Category;
import com.ssafy.domain.Merchant;
import com.ssafy.domain.repository.ICategoryRepository;
import com.ssafy.domain.service.CategoryService;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/api")
public class CategoryController {
	
	public static final Logger logger = LoggerFactory.getLogger(CategoryController.class);
	
	private final CategoryService service;
	
	@Autowired
	public CategoryController(CategoryService service) {
		this.service = service;
	}
	
	
	// 모든 category 조회
	@GetMapping(value = "/Categories", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<Category>> findAll(){
		
		logger.debug("Calling category findAll() ");
		
		List<Category> list = service.findAll();
		
		return new ResponseEntity<List<Category>>(list, HttpStatus.OK);
		
	}
	

	// 특정 category(cate_big 기준) merchant 조회
	@GetMapping(value = "/categories/{cateBig}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<Merchant>> findByCateBigLike(@PathVariable String cateBig){
		
		logger.debug("Calling findByCateBigLike()" );
		
		List<Merchant> merchants = service.findByCateBigLike(cateBig);
		
		return new ResponseEntity<List<Merchant>>(merchants, HttpStatus.OK);
		
	}
}
