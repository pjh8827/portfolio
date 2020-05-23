package com.ssafy.dao;

import java.util.List;

import com.ssafy.dto.Food;
import com.ssafy.dto.Pagination;

public interface FoodDao {

	public List<Food> selectAll();

	public Food select(int code);

	public List<Food> searchByCondition(String condition, String key);

	public int addViewCnt(int code);

	public int getViewCnt(int code);

	public int insert(Food food);

	public int getBoardListCnt();

	public List<Food> searchbypage(Pagination p);

}
