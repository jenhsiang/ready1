package com.shopping.springmvc.dao;

import java.util.List;

import com.shopping.springmvc.pojo.Order_main;



public interface IOrdermainDao {
	 List<Order_main> selectAll();
		
	    int deleteByPrimaryKey(Integer o_id);

	    int insert(Order_main record);

	    List<Order_main> selectByPrimaryKey(Integer u_id);

	    int updateByPrimaryKey(Order_main record);
}
