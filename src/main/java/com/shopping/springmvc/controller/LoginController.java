package com.shopping.springmvc.controller;

import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shopping.springmvc.pojo.*;
import com.shopping.springmvc.service.*;

@Controller
public class LoginController {
	@Resource
	private IUserService userService;
	@Resource
	private IBookService bookService;
	@Resource
	private IOrdermainService ordermainService;
	@Resource
	private IOrderdetailService orderdetailService;
	
	
	@RequestMapping("/user_order")
	public String user_order(HttpServletRequest request,HttpSession session,String user_name,String password){
		 Object sessionLogin = session.getAttribute("login");
		  if(sessionLogin == null) {
			User user=userService.login(user_name, password);
				if(null==user){
					request.setAttribute("error", "用户名或密码不正确");
					return "login";
				}else{
					  List<Book> booklist = this.bookService.selectAll();
					  session.setAttribute("booklist", booklist);
					session.setAttribute("login", user);
					return "user_order";
				}
		 }else { 
		  	return "user_order";
		 }
	}
	@RequestMapping("/shoppinglist")
	public String shoppinglist(HttpServletRequest request,HttpSession session,Model model){
		 Object sessionLogin = session.getAttribute("login");
		  if(sessionLogin == null) {
			  return "login";
		 }else { 
		  	return "shoppinglist";
		 }
		  
	}
	@RequestMapping("/orderlist")
	public String orderlist(HttpServletRequest request,HttpSession session,Model model){
		Date now = new Date();
		 User sessionLogin = (User)session.getAttribute("login");
		 HashMap session_ordermap = (HashMap)session.getAttribute("ordermap");
		  if(sessionLogin == null) {
			  return "login";
		 }else {
			 int u_id = sessionLogin.getU_id();
			 if(session_ordermap != null) {
					Order_main o_main = new Order_main();
					o_main.setU_id(u_id);
					o_main.setPay(0);
					o_main.setCreatetime(now);
					o_main.setUpdatetime(now);
					int succss= this.ordermainService.insertOmain(o_main);
					 int newid = 0;
					 if(succss == 1) newid = o_main.getO_id();
					 for (Object key : session_ordermap.keySet()) {
						 	orderbook obook = (orderbook)session_ordermap.get(key);
						 	Order_detail o_detail = new Order_detail();
						 	o_detail.setO_id(newid);
						 	o_detail.setB_id(obook.getB_id());
						 	o_detail.setB_count(obook.getB_count());
						 	o_detail.setCreatetime(now);
						 	o_detail.setUpdatetime(now);
						 	int ddid = this.orderdetailService.insertOdetail(o_detail);
						 	if(ddid != 1) break;
				        }
					 session.removeAttribute ("ordermap");	 
			 }
			List<Order_main> o = this.ordermainService.getOmainById(u_id);
			model.addAttribute("ordermain", o);
			 return "orderlist";
		 }
		
		  
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		session.removeAttribute ("login");
		session.removeAttribute ("booklist");
		session.removeAttribute ("ordermap");
		
	    session.invalidate ();
	   return "login";
	}
	@RequestMapping("/shoppingcar")
	@ResponseBody
	public String shoppingcar(HttpServletRequest request,HttpSession session){
		String result = "";
		try {
			HashMap session_ordermap = (HashMap)session.getAttribute("ordermap");
			 if(session_ordermap == null) {
				 session_ordermap = new HashMap();
			 }
			int b_count = Integer.parseInt(request.getParameter("b_count"));
			int b_id    = Integer.parseInt(request.getParameter("b_id"));
			String b_name  = (String)request.getParameter("b_name");
			int b_price = Integer.parseInt(request.getParameter("b_price"));
			orderbook newbook = new orderbook();
			newbook.setB_id(b_id);
			newbook.setB_name(b_name);
			newbook.setB_price(b_price);
			newbook.setB_count(b_count);
			session_ordermap.put( b_id, newbook);
			session.setAttribute("ordermap", session_ordermap);
			result = "您已購買此商品";
		}catch(Exception e) {
			result ="資料發生錯誤";
		}
		//User user = this.userService.getUserById(userId);
		//model.addAttribute("user", user);
		return "\"" + result + "\"";
	}
	@RequestMapping("/removeshopping")
	@ResponseBody
	public String removeshopping(HttpServletRequest request,HttpSession session){
		String result = "";
		try {
			HashMap session_ordermap = (HashMap)session.getAttribute("ordermap");
			int b_id    = Integer.parseInt(request.getParameter("b_id"));
			session_ordermap.remove(b_id);
			session.setAttribute("ordermap", session_ordermap);
			result = "您已移除此商品";
		}catch(Exception e) {
			result ="資料發生錯誤";
		}
		
		return "\"" + result + "\"";
	}
}
