package com.ssafy.dao;

import java.util.HashMap;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.dto.EatList;


@Repository
public class EatListDaoImpl implements EatListDao {

	private final String ns = "com.ssafy.model.eatlistmapper.";

	@Autowired
	SqlSession session;

	@Override
	public List<EatList> select(String id, String targetdate) {

		HashMap<String, Object> param = new HashMap<>();
		param.put("id", id);
		param.put("targetdate", targetdate);
		return session.selectList(ns + "getTargetDateEatList", param);
	}

	@Override
	public Integer insert(EatList eatlist) {
		return session.insert(ns + "addTargetDateEatList", eatlist);
	}

	@Override
	public Integer update(EatList eatlist) {

		return session.update(ns + "updateTargetDateEatList", eatlist);
	}

	@Override
	public Integer delete(EatList eatlist ) {
		
		return session.delete(ns + "deleteTargetDateEatList", eatlist);
	}

}
