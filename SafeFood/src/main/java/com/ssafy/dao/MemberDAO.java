package com.ssafy.dao;

import java.util.List;

import com.ssafy.dto.Member;

public interface MemberDAO {
	public Member search(String id);

	public List<Member> searchAll();

	public boolean add(Member member);

	public boolean update(Member member);

	public boolean remove(String id);
}
