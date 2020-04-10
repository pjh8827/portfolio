package com.ssafy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.dao.QnaDao;
import com.ssafy.dto.Pagination;
import com.ssafy.dto.QnA;

@Service
public class QnaServiceImpl implements QnaService {

    @Autowired
    private QnaDao dao;

    @Override
    public QnA search(int no) {
        return dao.search(no);
    }

    @Override
    public List<QnA> searchAll() {
        return dao.searchAll();
    }

    @Override
    public boolean update(QnA qna) {
        return dao.update(qna);
    }

    @Override
    public boolean remove(int no) {
        return dao.remove(no);
    }

    @Override
    public boolean add(QnA qna) {
        return dao.add(qna);
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
    public List<QnA> searchByCondition(String condition, String key) {

        return dao.searchByCondition(condition, key);
    }

    @Override
    public Integer getTotalQnAListCnt() {

        return dao.getBoardListCnt();
    }

    @Override
    public List<QnA> getQnApage(Pagination p) {

        return dao.searchbypage(p);
    }
}
