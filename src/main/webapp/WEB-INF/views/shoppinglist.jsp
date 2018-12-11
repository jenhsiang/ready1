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
            <a href="${pageContext.request.contextPath }/user_order">繼續購物</a>
            <a href="${pageContext.request.contextPath }/orderlist">結帳</a>
        </div>
    </header>
 <!--主体内容-->
 <section class="publicMian ">
     <div class="left">
     <c:choose>
      <c:when test="${ordermap.size()>0}">
         <h2 class="leftH2"><span class="span1"></span>書籍列表 <span></span></h2>
         <nav>
         <table border="0" width="80%">
        	<c:forEach var="item" items="${ordermap}" > 
        	<tr >
            	
                <td width="100%">
                	<table width="300"  border="0">
                   		<tr>
                            <td width="142" height="30">
                                <div style=" padding:0"><font color="#0000FF">${item.value.b_name}</font></div>
                            </td>
               	      	</tr>
                	 	<tr>
               		  		<td height="30">
                            	<font size="+1" color="#FF9900"><strong>￥${item.value.b_price }</strong></font>
                        	</td>
                     	</tr>
                 
                        <tr>
                            <td height="30">
                              	  <form id="shopping${item.value.b_id}" name="shopping${item.value.b_id}" action="javascript:shoppingcar(${item.value.b_id})" method="post">
                              	  
					<input type="text" value="${item.value.b_count}" name="b_count" class="form-control" id="recoSoft" maxlength="5" onkeyup="value=value.replace(/[^\d]/g,'')" placeholder="請輸入數量" style="width: 200px;"/>
                               			<input type="hidden" name="b_id" value= '${item.value.b_id}'/>
                               			<input type="hidden" name="b_name" value='${item.value.b_name}'/>
                               			<input type="hidden" name="b_price" value='${item.value.b_price}'/>
                                  		<input type="submit" value="修改數量" class="click"/>
                                  		<input type="button" value="移除此商品" class="click" onclick="removeshop(${item.value.b_id})"/>
                                  </form>
                            </td>
                        </tr>
                    </table>
              	</td>
            </tr>
            </c:forEach>
        </table>
          
         </nav>
         </c:when>
  <c:otherwise>
    <div>您尚無定購任何商品</div>
  </c:otherwise>
</c:choose> 
     </div>
       <script src="js/jquery-3.1.1.min.js"></script>
     <script>
     
     function shoppingcar(t) {
			//alert(this.form.b_id);
     alert($("#shopping"+t).serialize());
    // alert($("#shopping"+t+ " input[name=b_count]").val());
         if($("#shopping"+t+ " input[name=b_count]").val() == "" || $("#shopping"+t+ " input[name=b_count]").val() == 0){
        	 alert("請選擇購買數量");
         }else{
        	 $.ajax({
 				url: "shoppingcar",
 				data: $("#shopping"+t).serialize(),
 				type: "POST",
 				dataType: "json",
 				success: function(data,textStatus,jqXHR) {
 					console.log(data);
 					console.log(textStatus);
 					console.log(jqXHR);
 					alert(data);
 				},
 				error: function(XMLHttpRequest, textStatus, errorThrown) {
 					alert("資料發生錯誤");
 				},
 				complete: function(XMLHttpRequest) {
 					console.log('寄信結果');
 					console.log(XMLHttpRequest);
 				}
 				
 				}); 
         }
        
     }
     function removeshop(s){
    	var aa = confirm("確認不購買此商品!");
    	if(aa){
    		 $.ajax({
  				url: "removeshopping",
  				data: {b_id:s},
  				type: "POST",
  				dataType: "json",
  				success: function(data,textStatus,jqXHR) {
  					console.log(data);
  					console.log(textStatus);
  					console.log(jqXHR);
  					alert(data);
  					location.reload();
  				},
  				error: function(XMLHttpRequest, textStatus, errorThrown) {
  					alert("資料發生錯誤");
  				},
  				complete: function(XMLHttpRequest) {
  					console.log('寄信結果');
  					console.log(XMLHttpRequest);
  				}
  				
  				}); 
    	}
     }
     </script>
    