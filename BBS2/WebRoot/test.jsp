<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <h4>a</h4>
  <hr>
  a
    <input type="button" class="btn btn-primary" onclick = "release()" value = "release">
					<script type="text/javascript">
						function release(){
							var xml = new XMLHttpReguest();
							xml.open("POST", "Release", true);
							xml.setRequestHeader("Content-type","application/x-www-form-urlencoded");
							xml.send();
							xml.onreadystatechange=function()
  							{
   								if (xml.readyState==4 && xml.status==200)
     								{
     									xml.responseText;
     								}
   							} 			
							alert("success!");
						}
					</script>
  </body>
</html>
