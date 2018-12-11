package com.shopping.springmvc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shopping.springmvc.dao.IOrdermainDao;
import com.shopping.springmvc.pojo.Order_main;

import com.shopping.springmvc.service.IOrdermainService;

@Service("ordermainService")
public class OrdermainServiceImpl implements IOrdermainService {
	@Resource
	private IOrdermainDao ordermainDao;

	public List<Order_main> getOmainById(int u_id) {
		// TODO Auto-generated method stub
		return this.ordermainDao.selectByPrimaryKey(u_id);
	}

	public List<Order_main> selectAll() {
		// TODO Auto-generated method stub
		return this.ordermainDao.selectAll();
	}

	public int insertOmain(Order_main record) {
		// TODO Auto-generated method stub
		return this.ordermainDao.insert(record);
	}

	public int updateOmain(Order_main record) {
		// TODO Auto-generated method stub
		return this.ordermainDao.updateByPrimaryKey(record);
	}

	public int deleteOmain(int o_id) {
		// TODO Auto-generated method stub
		return this.ordermainDao.deleteByPrimaryKey(o_id);
	}


}
