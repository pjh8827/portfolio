package com.ssafy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
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
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.dto.Member;
import com.ssafy.service.MemberService;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/rest")
public class MemberRestController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberRestController.class);
	
	@Autowired
	MemberService service;

	private ResponseEntity<Map<String, Object>> response(Object data, boolean status, HttpStatus hStatus){ 
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status", status);
		resultMap.put("data", data);
		return new ResponseEntity<>(resultMap, hStatus);
	}
	
	@GetMapping("/Member")
	@ApiOperation("전체 회원정보를 반환한다.")
	public ResponseEntity<Map<String, Object>> getAllMember(){
		try {
			List<Member> list = service.searchAll();
			return response(list, true, HttpStatus.OK);
		}catch(Exception e) {
			logger.error("목록조회실패", e);
			return response(e.getMessage(), false, HttpStatus.CONFLICT);
		}
	}
	
	@GetMapping("/Member/{id}")
	@ApiOperation("ID에 해당하는 하나의 회원정보를 반환한다.")
	public ResponseEntity<Map<String, Object>> getMember(@PathVariable String id){
		try {
			Member member = service.search(id);
			return response(member, true, HttpStatus.OK);
		}catch(Exception e) {
			logger.error("회원조회실패", e);
			return response(e.getMessage(), false, HttpStatus.CONFLICT);
		}
	}
	
	@PostMapping("/Member")
	@ApiOperation("전달받은 회원정보를 저장한다.")
	public ResponseEntity<Map<String, Object>> insertMember(@RequestBody Member member){
		try {
			boolean result = service.add(member);
			return response(result, true, HttpStatus.CREATED);
		}catch(RuntimeException e) {
			logger.error("회원 가입 실패", e);
			return response(e.getMessage(), false, HttpStatus.CONFLICT);
		}
	}
	
	@PutMapping("/Member")
	@ApiOperation("전달받은 회원정보를 업데이트한다.")
	public ResponseEntity<Map<String, Object>> updateMember(@RequestBody Member member){
		try {
			boolean result = service.update(member);
			return response(result, true, HttpStatus.OK);
		}catch(Exception e) {
			logger.error("회원정보 수정 실패", e);
			return response(e.getMessage(), false, HttpStatus.CONFLICT);
		}
	}

	@PutMapping("/Member/wishlist")
	@ApiOperation("찜리스트를 업데이트한다")
	public ResponseEntity<Map<String, Object>> updateMember(@RequestBody Map<String,String> param,HttpSession session ){
		try {
			System.out.println("찜리스트 테스트");
			String id=   param.get("id");

			Member member = service.search(id);
			String wishlist = param.get("wishlist");

			System.out.println("id "+id);
			System.out.println("wishlist "+wishlist);

		
				member.setWishlist(wishlist);
			
			
				boolean res = service.update(member);
				session.setAttribute("member", member);
		
			return response(res, true, HttpStatus.OK);
		}catch(Exception e) {
			logger.error("회원정보 수정 실패", e);
			return response(e.getMessage(), false, HttpStatus.CONFLICT);
		}
	}
	
	@DeleteMapping("/Member/{id}")
	@ApiOperation("전달받은 회원정보를 삭제한다.")
	public ResponseEntity<Map<String, Object>> deleteMember(@PathVariable String id, HttpSession session){
		try {
			boolean result = service.remove(id);
			if(result==true) {
				session.invalidate();
			}
			return response(result, true, HttpStatus.OK);
		}catch(Exception e) {
			logger.error("회원 탈퇴 실패", e);
			return response(e.getMessage(), false, HttpStatus.CONFLICT);
		}
	}





}
