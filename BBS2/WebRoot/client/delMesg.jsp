<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
			import="com.bbs.dbconnect.message.MessageDAO"
	import="com.bbs.dbconnect.message.Message"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'delMesg.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="refresh" content="0;url=MainPage.jsp">

  </head>
  
  <body>
    <%
    	MessageDAO md = new MessageDAO();
    	Message mesg = new Message();
    	mesg = md.findMesgByMesgId(request.getParameter("msgid"));
    	System.out.println(session.getAttribute("userId"));
    	System.out.println(mesg.getUserid());
    	String mid = (String)session.getAttribute("userId");
    	 if(mid.equals(mesg.getUserid()))
    	{
    		md.delete(request.getParameter("msgid"));
    	} 
    	//md.delete(request.getParameter("msgid"));
     %>
  </body>
</html>
