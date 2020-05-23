package com.ssafy.dao;

import java.util.List;

import com.ssafy.dto.Notice;
import com.ssafy.dto.Pagination;

public interface NoticeDao {
	public Notice search(int no) ;

	public List<Notice> searchAll() ;

	public boolean add(Notice notice) ;

	public boolean update(Notice notice) ;

	public boolean remove(int no) ;
	

	public int addViewCnt(int no);
	public int getViewCnt(int no);
	
	public List<Notice> searchByCondition(String condition, String key);
	
	
	public int getBoardListCnt() ;
	public List<Notice> searchbypage(Pagination p);
	
}
