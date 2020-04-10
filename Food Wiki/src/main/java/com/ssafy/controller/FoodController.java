package com.ssafy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.context.request.WebRequest;

import com.ssafy.Additional.CoupangApi;
import com.ssafy.Additional.CoupangApiConfig;
import com.ssafy.dao.FoodDao;
import com.ssafy.service.FoodService;

@Controller
public class FoodController  {

	@Autowired
	FoodService service;
	@Autowired
	CoupangApiConfig config;
	
	@GetMapping("list.do")
	public String getfoodInfoListView() {
		
		
		System.out.println(config.getAccesskey());
		System.out.println(config.getSecretkey());
		//System.out.println(service.searchAll());
		return "/board/list";
		
	}
	
	@GetMapping("detail.do")
	public String getdetailInfoView(WebRequest req,Model model) {
		
		String code = (req.getParameter("code"));
		
		System.out.println(code);
		model.addAttribute("food_code", code);
		service.addViewCnt(Integer.parseInt(code));
		
		//System.out.println(service.searchAll());
		return "/board/detail";
		
	}
	@GetMapping("video.do")
	public String getVideoView() {
	
		
		//System.out.println(service.searchAll());
		return "/board/video";
		
	}
	@GetMapping("report.do")
	public String getDailyReportView() {
	
		
		//System.out.println(service.searchAll());
		return "/board/dailyReport";
		
	}
	
	
	
}
