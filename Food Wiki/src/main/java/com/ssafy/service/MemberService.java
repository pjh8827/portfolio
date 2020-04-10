package com.ssafy.service;

import java.util.List;

import com.ssafy.dto.Member;

public interface MemberService {
	public Member search(String id);

	public List<Member> searchAll();

	public boolean login(String id, String pw);

	public boolean checkID(String id);

	public boolean add(Member member);

	public boolean update(Member member);

	public boolean remove(String id);
}
