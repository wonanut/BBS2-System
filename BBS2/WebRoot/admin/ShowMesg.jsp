<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	import="com.bbs.dbconnect.message.MessageDAO"
	import="com.bbs.dbconnect.message.Message"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>ShowUser</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>


<style>
body {
	padding: 0px;
	margin: 0px;
}
</style>

</head>

<body>
<%if(session.getAttribute("admin") == null){%>
<center><p style="font-size:108">Access Denied</p></center>
 <%}
 else{
 %>
	<nav class="navbar navbar-default"
		style="position:fixed; width:100%; z-index:3">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a class="navbar-brand" href="#">BBS2</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="ShowUser.jsp">用户列表</a>
				</li>
				<li class="active"><a href="#">帖子列表<span class="sr-only">(current)</span>
				</a>
				</li>

				<li><a href="#">更多</a>
				</li>
			</ul>
			<form class="navbar-form navbar-left">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">提交查找</button>
			</form>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>

	<center>
	<div style="width:90%; z-index:1; padding-top:60px;">
		<table class="table table-hover" style="font-size:15">
			<tr style="width:100%;">
				<td colspan="8">
					<center>用户列表</center></td>
			</tr>
			<tr>
				<td width="5%"><center>编号</center>
				</td>
				<td width="5%"><center>ID</center>
				</td>
				<td width="10%"><center>发帖人ID</center>
				</td>
				<td width="10%"><center>帖子标题</center>
				</td>
				<td width="55%"><center>帖子内容</center>
				</td>
				<td width="10%"><center>日期</center>
				</td>
				<td width="5%"><center>删除</center>
				</td>
			</tr>
			<%
				MessageDAO md = new MessageDAO();
				ArrayList<Message> mesglist = new ArrayList<Message>();
				mesglist = md.finAll();
				for (int i = 0; i < mesglist.size(); i++) {
			%>

			<tr class="list">
				<td>
					<%
						out.println(i + 1);
					%>
				</td>
				<td>
					<%
						out.println(mesglist.get(i).getMesgid());
					%>
				</td>
				<td class="list">
					<%
						out.println(mesglist.get(i).getUserid());
					%>
				</td>
				<td class="list">
					<%
						out.println(mesglist.get(i).getMesgtitle());
					%>
				</td>
				<td class="list">
					<%
						out.println(mesglist.get(i).getMesgcontent());
					%>
				</td>
				<td class="list">
					<%
						out.println(mesglist.get(i).getMesgdate());
					%>
				</td>

				<td class="list"><a
					href="delMesg.jsp?uid=<%=mesglist.get(i).getMesgid()%>"> <input
						type="submit" value="删除" class="btn btn-danger"
						style="font-size:12"> </a></td>

			</tr>

			<%
				}
			%>

		</table>
	</div>
	</center>
<%} %>
</body>
</html>
