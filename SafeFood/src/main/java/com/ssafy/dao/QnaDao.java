package com.ssafy.dao;

import java.util.List;

import com.ssafy.dto.Pagination;
import com.ssafy.dto.QnA;

public interface QnaDao {
    public QnA search(int no);

    public List<QnA> searchAll();

    public boolean add(QnA qna);

    public boolean update(QnA qna);

    public boolean remove(int no);

    public int addViewCnt(int no);

    public int getViewCnt(int no);

    public List<QnA> searchByCondition(String condition, String key);

    public int getBoardListCnt();

    public List<QnA> searchbypage(Pagination p);

}
