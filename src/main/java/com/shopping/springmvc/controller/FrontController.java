package com.shopping.springmvc.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shopping.springmvc.pojo.*;
import com.shopping.springmvc.service.*;


@Controller
public class FrontController {
	@Resource
	private IUserService userService;
	@Resource
	private IBookService bookService;
	@Resource
	private IOrdermainService ordermainService;
	@Resource
	private IOrderdetailService orderdetailService;
	@RequestMapping("/")
	public String toIndex(HttpServletRequest request,Model model){
		//int userId = Integer.parseInt(request.getParameter("id"));
		//User user = this.userService.getUserById(userId);
		//model.addAttribute("user", user);
		return "index";
	}
	@RequestMapping("/book")
	public String toBook(HttpServletRequest request,Model model){
		return "book";
	}
	@RequestMapping("/user")
	public String toUser(HttpServletRequest request,Model model){
		return "user";
	}
	@RequestMapping("/all_order")
	public String Allorder(HttpServletRequest request,Model model){
		return "all_order";
	}
	
	@RequestMapping("/userjson")
	@ResponseBody
	public String userjson(){
		String result = "";
		List<User> l_user =  this.userService.selectAll();
		if ( l_user != null && l_user.size()>0 ) {
			for ( int i = 0; i < l_user.size(); i++ ) {
				User temp_user  = (User)l_user.get(i);
				int     u_id      = temp_user.getU_id();
				String user_name  = temp_user.getUserName();
				String password  = temp_user.getPassword();
				int     age      = temp_user.getAge();
				String phone  = temp_user.getPhone();
				String address  = temp_user.getAddress();
				result   += "{\"u_id\":" + u_id + ",\"user_name\":\"" + user_name + "\",\"password\":\"" + password  + "\",\"age\":" + age + ",\"phone\":\"" + phone  +"\",\"address\":\"" + address   + "\"}";
				if(i < l_user.size() - 1){
						result += ",";
					}
			} 
	}
		result = "[" + result + "]";
		return result;
	}
	
	@RequestMapping("/orderjson")
	@ResponseBody
	public String orderjson(){
		String result = "";
		List<Order_main> ordermain =  this.ordermainService.selectAll();
		if ( ordermain != null && ordermain.size()>0 ) {
			for ( int i = 0; i < ordermain.size(); i++ ) {
				Order_main temp_ordermain  = (Order_main)ordermain.get(i);
				int     u_id     = temp_ordermain.getU_id();
				int     o_id     = temp_ordermain.getO_id();
				int     pay      = temp_ordermain.getPay();
				String createtime  = temp_ordermain.getCreatetime().toString();
				String updatetime  = temp_ordermain.getUpdatetime().toString();
				result   += "{\"u_id\":" + u_id + ",\"o_id\":" + o_id + ",\"pay\":" + pay  + ",\"createtime\":\"" + createtime + "\",\"updatetime\":\"" + updatetime  +"\"}";
				if(i < ordermain.size() - 1){
						result += ",";
					}
			} 
	}
		result = "[" + result + "]";
		return result;
	}
	@RequestMapping("/detailjson")
	@ResponseBody
	public String detailjson(HttpServletRequest request){
		int o_id = Integer.parseInt(request.getParameter("o_id"));
		String result = "";
		List<Order_main> ordermain =  this.ordermainService.selectAll();
		if ( ordermain != null && ordermain.size()>0 ) {
			for ( int i = 0; i < ordermain.size(); i++ ) {
				Order_main temp_ordermain  = (Order_main)ordermain.get(i);
				int     u_id     = temp_ordermain.getU_id();
				int     o_id     = temp_ordermain.getO_id();
				int     pay      = temp_ordermain.getPay();
				String createtime  = temp_ordermain.getCreatetime().toString();
				String updatetime  = temp_ordermain.getUpdatetime().toString();
				result   += "{\"u_id\":" + u_id + ",\"o_id\":" + o_id + ",\"pay\":" + pay  + ",\"createtime\":\"" + createtime + "\",\"updatetime\":\"" + updatetime  +"\"}";
				if(i < ordermain.size() - 1){
						result += ",";
					}
			} 
	}
		result = "[" + result + "]";
		return result;
	}
	@RequestMapping("/useredit")
	@ResponseBody
	public String useredit(HttpServletRequest request){
		String result = "";
		String u_id  	   = (String)request.getParameter("u_id");
		String user_name   = (String)request.getParameter("user_name");
		String password    = (String)request.getParameter("password");
		String age         = (String)request.getParameter("age");
		String phone       = (String)request.getParameter("phone");
		String address     = (String)request.getParameter("address");
		String oper  	   = (String)request.getParameter("oper");
		String id  		   = (String)request.getParameter("id");
		String EmpId  	   = (String)request.getParameter("EmpId");
		int sql_result = 0;
		if(oper.equals("add")){
			User adduser = new User();
			adduser.setUserName(user_name);
			adduser.setPassword(password);
			adduser.setAge(Integer.parseInt(age));
			adduser.setPhone(phone);
			adduser.setAddress(address);
			sql_result = this.userService.insertUser(adduser);
		}else if(oper.equals("edit")){
			User edituser = this.userService.getUserById(Integer.parseInt(u_id));
			edituser.setUserName(user_name);
			edituser.setPassword(password);
			edituser.setAge(Integer.parseInt(age));
			edituser.setPhone(phone);
			edituser.setAddress(address);
			sql_result = this.userService.updateUser(edituser);
		}else if(oper.equals("del")){
			sql_result = this.userService.deleteUser(Integer.parseInt(u_id));
		}
		if(sql_result != 1){
			result = "資料發生錯誤!!";
		}
		return result;
	}
	@RequestMapping("/bookjson")
	@ResponseBody
	public String bookjson(){
		String result = "";
		List<Book> l_book =  this.bookService.selectAll();
		if ( l_book != null && l_book.size()>0 ) {
			for ( int i = 0; i < l_book.size(); i++ ) {
				Book temp_book    = (Book)l_book.get(i);
				int     b_id      = temp_book.getB_id();
				String b_name     = temp_book.getB_name();
				int     b_price   = temp_book.getB_price();
				
				result   += "{\"b_id\":" + b_id + ",\"b_name\":\"" + b_name + "\",\"b_price\":" + b_price  + "}";
				if(i < l_book.size() - 1){
						result += ",";
					}
			} 
	}
		result = "[" + result + "]";
		return result;
	}
	@RequestMapping("/bookedit")
	@ResponseBody
	public String bookedit(HttpServletRequest request){
		String result = "";
		String b_id  	   = (String)request.getParameter("b_id");
		String b_name      = (String)request.getParameter("b_name");
		String b_price     = (String)request.getParameter("b_price");
		String oper  	   = (String)request.getParameter("oper");
		String id  		   = (String)request.getParameter("id");
		String EmpId  	   = (String)request.getParameter("EmpId");
		int sql_result = 0;
		if(oper.equals("add")){
			Book addbook = new Book();
			addbook.setB_name(b_name);
			addbook.setB_price(Integer.parseInt(b_price));
			sql_result = this.bookService.insertBook(addbook);
		}else if(oper.equals("edit")){
			Book editbook = this.bookService.getBookById(Integer.parseInt(b_id));
			editbook.setB_name(b_name);
			editbook.setB_price(Integer.parseInt(b_price));
			sql_result = this.bookService.updateBook(editbook);
		}else if(oper.equals("del")){
			sql_result = this.bookService.deleteBook(Integer.parseInt(b_id));
		}
		if(sql_result != 1){
			result = "資料發生錯誤!!";
		}
		return result;
	}
	
}
