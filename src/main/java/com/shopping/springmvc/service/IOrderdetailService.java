package com.shopping.springmvc.service;

import java.util.List;

import com.shopping.springmvc.pojo.Order_detail;

public interface IOrderdetailService {

	public	List<Order_detail> getOdetailById(int o_id);
	
	public List<Order_detail> selectAll();
	
	public int insertOdetail(Order_detail record);
	
	public int updateOdetail(Order_detail record);
	
	public int deleteOdetail(int d_id);


}
