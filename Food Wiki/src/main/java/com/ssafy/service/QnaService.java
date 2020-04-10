package com.ssafy.service;

import java.util.List;

import com.ssafy.dto.QnA;
import com.ssafy.dto.Pagination;

public interface QnaService {
    public QnA search(int no);

    public List<QnA> searchAll();

    public boolean add(QnA qna);

    public boolean update(QnA qna);

    public boolean remove(int no);

    Integer getViewCnt(Integer no);

    Integer addViewCnt(Integer no);

    List<QnA> searchByCondition(String condition, String key);

    Integer getTotalQnAListCnt();

    List<QnA> getQnApage(Pagination p);

}
