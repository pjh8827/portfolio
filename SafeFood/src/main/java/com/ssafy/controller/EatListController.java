package com.ssafy.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.WebRequest;

import io.swagger.annotations.ApiOperation;

import org.springframework.http.HttpStatus;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ssafy.Additional.CoupangApiConfig;
import com.ssafy.dto.EatList;
import com.ssafy.dto.Food;
import com.ssafy.service.EatListService;
import com.ssafy.service.FoodService;

@RestController
@RequestMapping("/rest")
public class EatListController {

	@Autowired
	FoodService Foodservice;
    @Autowired
    EatListService EatListservice;
    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

    private ResponseEntity<Map<String, Object>> response(Object data, boolean status, HttpStatus hStatus) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status", status);
		resultMap.put("data", data);
		return new ResponseEntity<>(resultMap, hStatus);
	}

	@GetMapping("/Eatlist")
	@ApiOperation("날짜와 아이디에 해당하는 식품섭취정보를 반환")
	public ResponseEntity<Map<String, Object>> getAllFoods( @RequestParam String id, @RequestParam String  targetdate ) {
		try {
            List<EatList> eatlist = EatListservice.searchFoodByIdWithDate(id, targetdate);
            List<Integer> cntlist =new ArrayList<>();
            List<Food> foodlist=new ArrayList<>();
            HashMap<String,Object> m=new HashMap<>();

            HashMap<Integer,Integer> dup=new HashMap<>();
            

            for (EatList e : eatlist) {
                int foodcode = e.getCode() ;
                int cnt = e.getCnt();


                if(dup.containsKey(foodcode)){

                    dup.put(foodcode, dup.get(foodcode)+cnt);
                }
                else{
                    dup.put(foodcode, cnt);
                }
              
            }
            for (Integer foodcode : dup.keySet()) {
                
                foodlist.add(Foodservice.search(foodcode));
                cntlist.add(dup.get(foodcode));

            }
            
            m.put("cntlist", cntlist);
            m.put("foodlist", foodlist);
			return response(m, true, HttpStatus.OK);
		} catch (Exception e) {
			logger.error("목록조회실패", e);
			return response(e.getMessage(), false, HttpStatus.CONFLICT);
		}
    }
    
    @PostMapping("/Eatlist")
    @ApiOperation("섭취정보를 추가")
    public ResponseEntity<Map<String, Object>> addEatList(@RequestBody  EatList eatlist ) {
		try {
            
           boolean res = EatListservice.addEatList(eatlist) >=1?true:false;
            
			return response(res, true, HttpStatus.OK);
		} catch (Exception e) {
			logger.error("섭취정보추가실패", e);
			return response(e.getMessage(), false, HttpStatus.CONFLICT);
		}
	}
	


	@DeleteMapping("/Eatlist")
	@ApiOperation("해당 식품코드와 날짜의 섭취정보를 삭제")
	public ResponseEntity<Map<String, Object>> deleteEatList( @RequestParam String id, @RequestParam Integer code,  @RequestParam String  targetdate ) {
		try {
            
           boolean res = EatListservice.removeEatList(new EatList(0, id, code, 0, targetdate)) >=1?true:false;
            
			return response(res, true, HttpStatus.OK);
		} catch (Exception e) {
			logger.error("목록조회실패", e);
			return response(e.getMessage(), false, HttpStatus.CONFLICT);
		}
	}
	
	
}
