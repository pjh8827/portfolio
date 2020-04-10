package com.ssafy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.dao.FoodDao;
import com.ssafy.dto.Food;
import com.ssafy.dto.Pagination;

@Service
public class FoodServiceImpl implements FoodService {

	@Autowired
	FoodDao dao;

	@Override
	public List<Food> searchAll() {
		
		return dao.selectAll();
	}

	@Override
	public Food search(Integer code) {
		
		return dao.select(code);
	}

	@Override
	public Integer addFoodinfo(Food food) {
		
		return dao.insert(food);
	}

	@Override
	public List<Food> searchByCondition(String condition, String key) {

		return dao.searchByCondition(condition, key);

	}

	@Override
	public Integer addViewCnt(Integer code) {
		
		return dao.addViewCnt(code);
	}

	@Override
	public Integer getViewCnt(Integer code) {
		
		return dao.getViewCnt(code);
	}

	@Override
	public Integer getTotalFoodListCnt() {
	
		return dao.getBoardListCnt();
	}

	@Override
	public List<Food> getFoodpage(Pagination p) {
		
		return dao.searchbypage(p);
	}
	
}
