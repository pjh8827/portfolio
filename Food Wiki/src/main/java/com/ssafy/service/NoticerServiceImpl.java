package com.ssafy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.dto.Notice;
import com.ssafy.dto.Pagination;
import com.ssafy.dao.NoticeDao;

@Service
public class NoticerServiceImpl implements NoticerService {

	@Autowired
	private NoticeDao dao;

	@Override
	public Notice search(int no) {
		return dao.search(no);
	}

	@Override
	public List<Notice> searchAll() {
		return dao.searchAll();
	}

	@Override
	public boolean update(Notice Notice) {
		return dao.update(Notice);
	}

	@Override
	public boolean remove(int no) {
		return dao.remove(no);
	}

	@Override
	public boolean add(Notice Notice) {
		return dao.add(Notice);
	}

	@Override
	public Integer addViewCnt(Integer no) {
		

		return dao.addViewCnt(no);
	}

	@Override
	public Integer getViewCnt(Integer no) {
		
		return dao.getViewCnt(no);
	}

	@Override
	public List<Notice> searchByCondition(String condition, String key) {
		
		return dao.searchByCondition(condition, key);
	}

	@Override
	public Integer getTotalNoticeListCnt() {
		
		return dao.getBoardListCnt();
	}

	@Override
	public List<Notice> getNoticepage(Pagination p) {
	
		return dao.searchbypage(p);
	}
}
