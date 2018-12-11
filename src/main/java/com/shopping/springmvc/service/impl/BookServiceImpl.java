package com.shopping.springmvc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shopping.springmvc.dao.IBookDao;
import com.shopping.springmvc.pojo.Book;

import com.shopping.springmvc.service.IBookService;

@Service("bookService")
public class BookServiceImpl implements IBookService {
	@Resource
	private IBookDao bookDao;
	public Book getBookById(int b_id) {
		// TODO Auto-generated method stub
		return this.bookDao.selectByPrimaryKey(b_id);
	}

	public List<Book> selectAll() {
		// TODO Auto-generated method stub
		return this.bookDao.selectAll();
	}

	public int insertBook(Book record) {
		// TODO Auto-generated method stub
		return this.bookDao.insert(record);
	}

	public int updateBook(Book record) {
		// TODO Auto-generated method stub
		return this.bookDao.updateByPrimaryKey(record);
	}

	public int deleteBook(int b_id) {
		// TODO Auto-generated method stub
		return this.bookDao.deleteByPrimaryKey(b_id);
	}

	

}
