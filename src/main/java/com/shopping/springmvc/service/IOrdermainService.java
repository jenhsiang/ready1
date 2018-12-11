package com.shopping.springmvc.service;

import java.util.List;

import com.shopping.springmvc.pojo.Order_main;

public interface IOrdermainService {

	public	List<Order_main> getOmainById(int u_id);
	
	public List<Order_main> selectAll();
	
	public int insertOmain(Order_main record);
	
	public int updateOmain(Order_main record);
	
	public int deleteOmain(int o_id);


}
