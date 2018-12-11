package com.shopping.springmvc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shopping.springmvc.dao.IOrderdetailDao;
import com.shopping.springmvc.pojo.Order_detail;

import com.shopping.springmvc.service.IOrderdetailService;

@Service("orderdetailService")
public class OrderdetailServiceImpl implements IOrderdetailService {
	@Resource
	private IOrderdetailDao orderdetailDao;

	public List<Order_detail> getOdetailById(int o_id) {
		// TODO Auto-generated method stub
		return this.orderdetailDao.selectByPrimaryKey(o_id);
	}

	public List<Order_detail> selectAll() {
		// TODO Auto-generated method stub
		return this.orderdetailDao.selectAll();
	}

	public int insertOdetail(Order_detail record) {
		// TODO Auto-generated method stub
		return this.orderdetailDao.insert(record);
	}

	public int updateOdetail(Order_detail record) {
		// TODO Auto-generated method stub
		return this.orderdetailDao.updateByPrimaryKey(record);
	}

	public int deleteOdetail(int d_id) {
		// TODO Auto-generated method stub
		return  this.orderdetailDao.deleteByPrimaryKey(d_id);
	}

	
}
