package com.shopping.springmvc.dao;

import java.util.List;

import com.shopping.springmvc.pojo.User;

public interface IUserDao {
	 List<User> selectAll();
	
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);
    
    User getLoginUser(String user_name);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}