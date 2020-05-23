package com.ssafy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.dao.EatListDao;
import com.ssafy.dao.FoodDao;
import com.ssafy.dto.EatList;
import com.ssafy.dto.Food;
import com.ssafy.dto.Pagination;

@Service
public class EatListServiceImpl implements EatListService {

	@Autowired
	EatListDao dao;

	@Override
	public List<EatList> searchFoodByIdWithDate(String id, String targetdate) {
		
		return dao.select(id, targetdate);
	}

	@Override
	public Integer addEatList(EatList eatlist) {
		// 
		return dao.insert(eatlist);
	}

	@Override
	public Integer updateEatList(EatList eatlist) {
	
		return dao.update(eatlist);
	}

	@Override
	public Integer removeEatList(EatList eatlist) {
	
		return dao.delete( eatlist);
	}

	
	
}
