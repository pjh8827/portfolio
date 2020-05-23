package com.ssafy;

import java.io.Console;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.ssafy.dto.EatList;
import com.ssafy.dto.Food;
import com.ssafy.dto.Notice;
import com.ssafy.service.EatListService;
import com.ssafy.service.FoodRecommendService;
import com.ssafy.service.FoodService;
import com.ssafy.service.NoticerService;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;


@SpringBootTest
class SafeFoodSpringBootApplicationTests {

	@Autowired
	NoticerService service;

	@Autowired
	FoodRecommendService service2;

	@Autowired
	EatListService eatlistservice;

	void contextLoads() {
	}

	void servicetest() {

		for (int i = 0; i < 100; i++) {
			Notice testnotice = new Notice(0, "ssafy", "test" + i, "helloworld" + i, 0);
			service.add(testnotice);
		}
		

	}

	void dataapitest() {

		try {
			HashMap<String, Food> res = Api.getFoodData();
			for (String k : res.keySet()) {
				System.out.println(res.get(k));
			}
			System.out.println(res.size());

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	void eatlisttest() {

		int res =eatlistservice.addEatList(new EatList(0, "ssafy", 5, 10, "2019-09-09"));
		assertThat(res, is(1));

		res =eatlistservice.addEatList(new EatList(0, "ssafy", 8, 10, "2019-01-01"));
		assertThat(res, is(1));


		res =eatlistservice.updateEatList(new EatList(2, "ssafy", 10, 999, "2019-08-21"));
		assertThat(res, is(1));
		ArrayList<EatList> el = (ArrayList<EatList>) eatlistservice.searchFoodByIdWithDate("ssafy", "2019-11-27");


		assertThat(res, is(1));



		System.out.println(el);




	}
}
