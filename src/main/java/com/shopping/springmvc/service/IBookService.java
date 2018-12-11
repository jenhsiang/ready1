package com.shopping.springmvc.service;

import java.util.List;

import com.shopping.springmvc.pojo.Book;

public interface IBookService {

	public	Book getBookById(int b_id);
	
	public List<Book> selectAll();
	
	public int insertBook(Book record);
	
	public int updateBook(Book record);
	
	public int deleteBook(int b_id);


}
