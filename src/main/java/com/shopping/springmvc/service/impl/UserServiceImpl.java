package com.shopping.springmvc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shopping.springmvc.dao.IUserDao;
import com.shopping.springmvc.pojo.User;
import com.shopping.springmvc.service.IUserService;

@Service("userService")
public class UserServiceImpl implements IUserService {
	@Resource
	private IUserDao userDao;
	public User getUserById(int userId) {
		// TODO Auto-generated method stub
		return this.userDao.selectByPrimaryKey(userId);
	}
	public User login(String user_name,String password) {
		// TODO Auto-generated method stub
		User user = null;
		user = this.userDao.getLoginUser(user_name);
		if (null != user) {
			if (!user.getPassword().equals(password))
				user = null;
		}
		return user;
	}
	public List<User> selectAll() {
		// TODO Auto-generated method stub
		return this.userDao.selectAll();
	}
	public int insertUser(User record) {
		// TODO Auto-generated method stub
		return this.userDao.insert(record);
	}
	public int updateUser(User record) {
		// TODO Auto-generated method stub
		return this.userDao.updateByPrimaryKey(record);
	}
	public int deleteUser(int userid) {
		// TODO Auto-generated method stub
		return this.userDao.deleteByPrimaryKey(userid);
	}

}
