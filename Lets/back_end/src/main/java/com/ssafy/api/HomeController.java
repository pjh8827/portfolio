package com.ssafy.api;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


// test controller

@RestController
@RequestMapping("/home")

public class HomeController {
	
	static Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@GetMapping("/hello")
	public String home(Model model) {
		
		logger.debug("Calling home()" );
		
		return "hello haksu";
	}
	
}
