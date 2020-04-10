package com.ssafy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.Api;
import com.ssafy.dto.Food;
import com.ssafy.dto.Pagination;
import com.ssafy.dto.Food;
import com.ssafy.service.FoodRecommendService;
import com.ssafy.service.FoodService;
import com.ssafy.service.FoodService;

import io.swagger.annotations.ApiOperation;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/rest")
public class FoodRestController {

	private static final Logger logger = LoggerFactory.getLogger(FoodRestController.class);

	@Autowired
	FoodService service;

	@Autowired
	FoodRecommendService foodRecommandService;

	
	
	
	private ResponseEntity<Map<String, Object>> response(Object data, boolean status, HttpStatus hStatus) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status", status);
		resultMap.put("data", data);
		return new ResponseEntity<>(resultMap, hStatus);
	}

	@GetMapping("/Food")
	@ApiOperation("전체 식품정보를 반환한다..")
	public ResponseEntity<Map<String, Object>> getAllFoods() {
		try {
			List<Food> list = service.searchAll();
			System.out.println(list);
			return response(list, true, HttpStatus.OK);
		} catch (Exception e) {
			logger.error("목록조회실패", e);
			return response(e.getMessage(), false, HttpStatus.CONFLICT);
		}
	}
	

	@RequestMapping(method = RequestMethod.GET, value = "/Food/Page")
	@ApiOperation("식품정보 페이지를 반환한다.")
	public ResponseEntity<Map<String, Object>> getFoodPage(@RequestParam  Map<String,String> params) {
		try {
			
			Integer page= Integer.parseInt(params.get("page"));
			Integer range= Integer.parseInt(params.get("range"));

			Integer foodlistCnt = service.getTotalFoodListCnt();

			Pagination p = new Pagination();
		
			p.pageInfo(page, range, foodlistCnt);
		
			List<Food> foodres = service.getFoodpage(p);
			HashMap<String,Object> res=new HashMap<>();
			res.put("items", foodres);
			res.put("pagination", p);

			return response(res, true, HttpStatus.OK);
		} catch (Exception e) {
			logger.error("식품정보조회실패", e);
			return response(e.getMessage(), false, HttpStatus.CONFLICT);
		}
	}
	
	
	@GetMapping("/augument")
	@ApiOperation("데이터추가")
	public ResponseEntity<Map<String, Object>> addfooddb() {
		try {
			
			System.out.println("데이터추가시작");
			HashMap<String, Food> res= Api.getFoodData();
			//System.out.println(res);
			
			int i=res.size();
			int x=0;
			for (String f : res.keySet()) {
				
				Food food =res.get(f);
			
				service.addFoodinfo(food);
				//logger.trace("insert left" + (--i));
				
			}
			System.out.println("추가완료");
			return response("success", true, HttpStatus.OK);
		} catch (Exception e) {
			logger.error("목록조회실패", e);
			return response(e.getMessage(), false, HttpStatus.CONFLICT);
		}
	}
	

	@GetMapping("/Food/{id}")
	@ApiOperation("ID에 해당하는 하나의 식품정보를 반환한다.")
	public ResponseEntity<Map<String, Object>> getFood(@PathVariable String id) {
		try {
			Food food = service.search(Integer.parseInt(id));
			return response(food, true, HttpStatus.OK);
		} catch (Exception e) {
			logger.error("식품정보조회실패", e);
			return response(e.getMessage(), false, HttpStatus.CONFLICT);
		}
	}

	@GetMapping("/Food/Recommand/{id}")
	@ApiOperation("ID에 해당하는 식품과 비슷한 영양구성을 가진 식품들을 반환한다.")
	public ResponseEntity<Map<String, Object>> getSimularFoodRecommandList(@PathVariable String id) {
		try {
			System.out.println("food recommend test");
			List<Food> foodlist = foodRecommandService.getRecommendFoods(id);
			return response(foodlist, true, HttpStatus.OK);
		} catch (Exception e) {
			
			logger.error("식품정보조회실패", e);
			return response(e.getMessage(), false, HttpStatus.CONFLICT);
		}
	}

	@PostMapping("/Food/Search")
	@ApiOperation("조건에 따른 식품을 검색한다")
	public ResponseEntity<Map<String, Object>> getSerarchByconditionResult(@RequestBody Map<String, Object> params) {
		try {

			String condition = (String) params.get("condition");
			String key = (String) params.get("key");
			List<Food> foodlist;
			
			if (condition == "" || key == "") {
				foodlist = service.searchAll();
			} else {
				foodlist = service.searchByCondition(condition, key);
			}
			Pagination p =new Pagination();
			p.pageInfo(1, 1, foodlist.size());
			HashMap<String,Object> res=new HashMap<>();
			res.put("items", foodlist);
			res.put("pagination", p);

			return response(res, true, HttpStatus.OK);
		} catch (Exception e) {
			logger.error("식품정보조회실패", e);
			return response(e.getMessage(), false, HttpStatus.CONFLICT);
		}
	}

	/*
	 * @PostMapping("/Food")
	 * 
	 * @ApiOperation("전달받은 식품정보를 저장한다.") public ResponseEntity<Map<String, Object>>
	 * insertFood(@RequestBody Food Food){ try { boolean result = service(Food);
	 * return response(result, true, HttpStatus.CREATED); }catch(RuntimeException e)
	 * { logger.error("식품 가입 실패", e); return response(e.getMessage(), false,
	 * HttpStatus.CONFLICT); } }
	 */

	/*
	 * @PutMapping("/Food")
	 * 
	 * @ApiOperation("전달받은 식품정보를 업데이트한다.") public ResponseEntity<Map<String,
	 * Object>> updateFood(@RequestBody Food Food){ try { boolean result =
	 * service.update(Food); return response(result, true, HttpStatus.OK);
	 * }catch(Exception e) { logger.error("식품정보 수정 실패", e); return
	 * response(e.getMessage(), false, HttpStatus.CONFLICT); } }
	 */
	/*
	 * @DeleteMapping("/Food/{id}")
	 * 
	 * @ApiOperation("전달받은 식품정보를 삭제한다.") public ResponseEntity<Map<String, Object>>
	 * deleteFood(@PathVariable String id){ try { boolean result =
	 * service.remove(id); return response(result, true, HttpStatus.OK);
	 * }catch(Exception e) { logger.error("식품 탈퇴 실패", e); return
	 * response(e.getMessage(), false, HttpStatus.CONFLICT); } }
	 */
}
