<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	import = "com.bbs.dbconnect.user.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>后台添加用户成功，正在跳转。。。</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="refresh" content="0;url=ShowUser.jsp">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <%
    	
	
    	Calendar cal = Calendar.getInstance();
		String newId = null;
		newId = String.valueOf(cal.get(Calendar.YEAR) - 2000)
				+ "0"
				+ String.valueOf(cal.get(Calendar.MONTH)) 
				+ String.valueOf(cal.get(Calendar.DAY_OF_MONTH))
				+ String.valueOf((int)(Math.random()*100000));
		
   		UserDAO ud = new UserDAO();
		User user = new User();
		user.setUsername(request.getParameter("username"));
		user.setUserid(newId);
		user.setPassword(request.getParameter("password"));
		user.setDescription(request.getParameter("desp"));
		user.setUserpic("0");
		if(!ud.isUserNameExist(request.getParameter("username")))
		{
			ud.insert(user);
		}
     %>
  </body>
</html>
