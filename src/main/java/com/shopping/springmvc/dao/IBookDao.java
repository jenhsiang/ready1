package com.shopping.springmvc.dao;

import java.util.List;

import com.shopping.springmvc.pojo.Book;


public interface IBookDao {
	 List<Book> selectAll();
		
	    int deleteByPrimaryKey(Integer b_id);

	    int insert(Book record);

	    Book selectByPrimaryKey(Integer b_id);

	    int updateByPrimaryKey(Book record);
}
