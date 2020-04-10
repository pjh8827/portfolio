package com.ssafy.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ssafy.dto.Food;
import com.ssafy.dto.Pagination;


public interface FoodService {

	
	List<Food> searchAll();
	Food search(Integer code);
	List<Food> searchByCondition(String condition,String key);
	
	Integer getViewCnt(Integer code);
	Integer addViewCnt(Integer code);
	Integer addFoodinfo(Food food);


	Integer getTotalFoodListCnt();
	List<Food> getFoodpage(Pagination p);
	
}
