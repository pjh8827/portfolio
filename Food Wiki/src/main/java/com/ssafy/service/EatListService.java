package com.ssafy.service;

import java.util.List;

import com.ssafy.dto.EatList;
import com.ssafy.dto.Food;
import com.ssafy.dto.Pagination;


public interface EatListService {

	
	List<EatList> searchFoodByIdWithDate(String id, String targetdate);
	Integer addEatList(EatList eatlist);
	Integer updateEatList(EatList eatlist);
	Integer removeEatList(EatList eatlist);
	
	
	
}
