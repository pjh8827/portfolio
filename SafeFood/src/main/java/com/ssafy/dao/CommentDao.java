package com.ssafy.dao;

import java.util.List;

import com.ssafy.dto.Comment;
import com.ssafy.dto.Pagination;

public interface CommentDao {
    public List<Comment> searchAll();

    // public Comment search(int no);

    public List<Comment> search(int no);

    public boolean add(Comment comment);

    public boolean update(Comment comment);

    public boolean remove(int c_code);

}
