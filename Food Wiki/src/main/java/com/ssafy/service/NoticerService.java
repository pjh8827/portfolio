package com.ssafy.service;

import java.util.List;

import com.ssafy.dto.Notice;
import com.ssafy.dto.Pagination;


public interface NoticerService {
	public Notice search(int no);
	public List<Notice> searchAll();

	public boolean add(Notice Notice);
	public boolean update(Notice Notice);
	public boolean remove(int no);
	
	Integer getViewCnt(Integer no);
	Integer addViewCnt(Integer no);
	
	List<Notice> searchByCondition(String condition,String key);

	
	Integer getTotalNoticeListCnt();
	List<Notice> getNoticepage(Pagination p);
	
}
