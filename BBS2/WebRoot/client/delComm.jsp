<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
			import="com.bbs.dbconnect.comment.CommentDAO"
	import="com.bbs.dbconnect.comment.Comment"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'delMesg.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="refresh" content="0;url=UserPage.jsp">

  </head>
  
  <body>
    <%
    	
    	CommentDAO cd = new CommentDAO();
    	Comment comm = new Comment();
    	
    	String comid = request.getParameter("commid");
    	cd.delete(comid);
     %>
  </body>
</html>
