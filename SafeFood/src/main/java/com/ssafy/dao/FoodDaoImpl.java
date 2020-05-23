package com.ssafy.dao;

import java.util.HashMap;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.dto.Food;
import com.ssafy.dto.Pagination;

@Repository
public class FoodDaoImpl implements FoodDao {

	private final String ns = "com.ssafy.model.FoodMapper.";

	@Autowired
	SqlSession session;

	@Override
	public List<Food> selectAll() {
		// TODO Auto-generated method stub
		return session.selectList(ns + "selectAll");
	}

	@Override
	public Food select(int code) {
		// TODO Auto-generated method stub
		return session.selectOne(ns + "select", code);
	}

	@Override
	public int insert(Food food) {
		// TODO Auto-generated method stub
		return session.insert(ns + "insert", food);
	}

	@Override
	public int addViewCnt(int code) {
		// TODO Auto-generated method stub
		return session.update(ns + "addViewCnt", code);
	}

	@Override
	public int getViewCnt(int code) {
		// TODO Auto-generated method stub
		return session.selectOne(ns + "getViewCnt", code);
	}

	@Override
	public List<Food> searchByCondition(String condition, String key) {
		// TODO Auto-generated method stub
		HashMap<String, String> map = new HashMap<String, String>();
		key = "%" + key + "%";
		map.put("condition", condition);
		map.put("key", key);
		return session.selectList(ns + "searchByCondition", map);
	}

	@Override
	public int getBoardListCnt() {

		// TODO Auto-generated method stub
		return session.selectOne(ns + "getBoardListCnt");
	}

	@Override
	public List<Food> searchbypage(Pagination p) {
		
		return session.selectList(ns + "getBoardList",p);
	}
	
	
	

}
