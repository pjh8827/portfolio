package com.ssafy.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ssafy.dto.EatList;
import com.ssafy.dto.Food;
import com.ssafy.dto.Pagination;



public interface EatListDao {


	public List<EatList> select(String id, String targetdate);
	public Integer insert(EatList eatlist ) ;
    public Integer update(EatList eatlist ) ;
    public Integer delete(EatList eatlist  ) ;
    
	
	

	//freehoon.tistory.com/112 [초보 개발자]
	//public List<Food> searchByName(String name);
	//public List<Food> searchByMaker(String name);
	//public List<Food> searchByMaterial(String name);
	
}
