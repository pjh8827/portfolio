package com.ssafy.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.dto.Pagination;
import com.ssafy.dto.QnA;

@Repository
public class QnaDaoImpl implements QnaDao {

    private final static String ns = "com.ssafy.model.qnamapper.";

    @Autowired
    SqlSession session;

    @Override
    public QnA search(int no) {
        String statement = ns + "select";
        return session.selectOne(statement, no);
    }

    @Override
    public List<QnA> searchAll() {
        String statement = ns + "select";

        return session.selectList(statement);
    }

    @Override
    public boolean add(QnA qna) {
        String statement = ns + "insert";
        return session.insert(statement, qna) > 0;
    }

    @Override
    public boolean update(QnA qna) {
        String statement = ns + "update";
        return session.update(statement, qna) > 0;
    }

    @Override
    public boolean remove(int no) {
        String statement = ns + "delete";
        return session.delete(statement, no) > 0;
    }

    @Override
    public int addViewCnt(int no) {
        // TODO Auto-generated method stub

        return session.update(ns + "addViewCnt", no);
    }

    @Override
    public int getViewCnt(int no) {
        // TODO Auto-generated method stub
        return session.selectOne(ns + "getViewCnt", no);
    }

    @Override
    public List<QnA> searchByCondition(String condition, String key) {
        // TODO Auto-generated method stub
        HashMap<String, String> map = new HashMap<String, String>();
        key = "%" + key + "%";
        map.put("condition", condition);
        map.put("key", key);
        return session.selectList(ns + "searchByCondition", map);
    }

    @Override
    public int getBoardListCnt() {

        return session.selectOne(ns + "getBoardListCnt");
    }

    @Override
    public List<QnA> searchbypage(Pagination p) {

        return session.selectList(ns + "getBoardList", p);
    }
}