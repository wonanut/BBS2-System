<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	import = "com.bbs.dbconnect.JDBCUtils"
	import = "java.sql.Connection"
	import = "java.sql.ResultSet"
	import = "java.sql.Statement"
	import = "com.bbs.dbconnect.message.MessageDAO"
	import = "com.bbs.dbconnect.message.Message"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>delMesg</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="refresh" content="0;url=ShowMesg.jsp">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <%
    	MessageDAO md = new MessageDAO();
    	String del_id = request.getParameter("uid");
    	md.delete(del_id);
    	
     %>
     
  </body>
</html>
