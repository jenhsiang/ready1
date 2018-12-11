<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>	
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>超市订单管理系统</title>
  
</head>
<body>
<!--头部-->
    <header class="publicHeader">
        <h1>超市订单管理系统</h1>
        <div class="publicHeaderR">
            <p><span>下午好！</span><span style="color: #fff21b"> ${login.userName }</span> , 欢迎你！</p>
            <a href="${pageContext.request.contextPath }/logout">退出</a>
             <a href="${pageContext.request.contextPath }/shoppinglist">前往購物車</a>
        </div>
    </header>
 <!--主体内容-->
 <section class="publicMian ">
     <div class="left">
         <h2 class="leftH2"><span class="span1"></span>書籍列表 <span></span></h2>
         <nav>
         <table border="0" width="80%">
        	<c:forEach var="item" items="${ordermain}" > 
        	<tr>
        	 <td width="100%">訂單日期:${item.createtime}</td>
        	</tr>
        	<tr >
                <td width="100%">
                	<table width="300"  border="0">
                		<c:forEach var="item2" items="${item.order_detailList}" > 
                   		<tr>
                            <td  height="30">
                                <div style=" padding:0"><font color="#0000FF">${item2.b_id}</font></div>
                            </td>
                             <td  height="30">
                                <div style=" padding:0"><font color="#0000FF">品名:${item2.b_name}</font></div>
                            </td>
                             <td  height="30">
                                <div style=" padding:0"><font color="#0000FF">價錢:${item2.b_price}</font></div>
                            </td>
                            <td height="30">
                            	<font size="+1" color="#FF9900"><strong>數量:${item2.b_count }</strong></font>
                        	</td>
               	      	</tr>
               	      	 </c:forEach>
                    </table>
              	</td>
            </tr>
            </c:forEach>
        </table>
          
         </nav>
     </div>
       <script src="js/jquery-3.1.1.min.js"></script>
  
    