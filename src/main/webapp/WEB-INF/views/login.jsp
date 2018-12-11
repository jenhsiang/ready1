<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>訂單管理</title>
   
</head>
<body class="login_bg">
    <section class="loginBox">
        <header class="loginHeader">
            <h1>訂單管理</h1>
        </header>
        <section class="loginCont">
	        <form class="loginForm" action="${pageContext.request.contextPath }/user_order"  name="actionForm" id="actionForm"  method="post" >
				<div class="info">${error }</div>
				<div class="inputbox">
                    <label for="user">用户名：</label>
					<input type="text" class="input-text" id="user_name" name="user_name" placeholder="请输入用户名" required/>
				</div>	
				<div class="inputbox">
                    <label for="mima">密碼：</label>
                    <input type="password" id="password" name="password" placeholder="请输入密码" required/>
                </div>	
				<div class="subBtn">
					
                    <input type="submit" value="登入"/>
                    <input type="reset" value="重置"/>
                </div>	
			</form>
        </section>
    </section>
</body>
</html>
