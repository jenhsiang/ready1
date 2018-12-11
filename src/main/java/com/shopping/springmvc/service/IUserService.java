package com.shopping.springmvc.service;

import java.util.List;

import com.shopping.springmvc.pojo.User;

public interface IUserService {

	public	User getUserById(int userId);
	
	public User login(String user_name,String password);
	
	public List<User> selectAll();
	
	public int insertUser(User record);
	
	public int updateUser(User record);
	
	public int deleteUser(int userid);


}
