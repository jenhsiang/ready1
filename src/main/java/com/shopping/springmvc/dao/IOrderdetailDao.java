package com.shopping.springmvc.dao;

import java.util.List;

import com.shopping.springmvc.pojo.Order_detail;



public interface IOrderdetailDao {
	 List<Order_detail> selectAll();
		
	    int deleteByPrimaryKey(Integer d_id);

	    int insert(Order_detail record);

	    List<Order_detail> selectByPrimaryKey(Integer o_id);

	    int updateByPrimaryKey(Order_detail record);
}
