<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	import="com.bbs.dbconnect.user.UserDAO"
	import="com.bbs.dbconnect.user.User"
	import="com.bbs.dbconnect.message.MessageDAO"
	import="com.bbs.dbconnect.message.Message"
	import="com.bbs.dbconnect.comment.CommentDAO"
	import="com.bbs.dbconnect.comment.Comment"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>UserPage</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/menu.css" />

<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<style>
.userimg {
	margin: 10px;
}

.userimg:hover {
	
	box-shadow: 0 0 10 #0CC;
	transition: box-shadow 0.5s;
}
</style>

</head>

<body
	style="background:url('img/bkg1.jpg');background-size:100%; background-attachment: fixed">
	<div>
		<nav class="navbar navbar-default"
			style="position:fixed; width:100%; z-index:3; ">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<a class="navbar-brand" href="#">BBS2<span
					class="glyphicon glyphicon-leaf" aria-hidden="true"></span> </a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<%
						if (session.getAttribute("userName") != null) {
					%>
					<li><a href="UserPage.jsp">个人主页<span class="sr-only">(current)</span>
					</a> <%
 	}
 %>
					</li>
					<li><a href="MainPage.jsp">论坛广场</a></li>
					<li><a href="#"><abbr title="更多功能正在开发中"><span
								class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
						</abbr> </a></li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<li><a
						href="<%if (session.getAttribute("userName") != null) {
				out.println("UserPage.jsp");%>
					">
							<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
							<%
								}
								if (session.getAttribute("userName") != null) {
									out.println(session.getAttribute("userName"));
							%> </a></li>

					<li><a
						href="
					<%}
			if (session.getAttribute("userName") == null) {
				out.println("Login.jsp");
			}%>
					">
							<%
								if (session.getAttribute("userName") == null) {
									out.println("请登陆");
								}
							%> </a></li>
					<li><a href="logout.jsp"> <%
 	if (session.getAttribute("userId") != null) {
 		out.println("注销用户");
 	}
 %> </a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid --> </nav>



		<center>
			<div style="width:80%; padding-top:80px">
				<div class="panel panel-default" style="padding:30px;">
					<table width=100%>
						<tr style="height:100%;">

							<td style="width:20%"><center>
									<%
											UserDAO ud = new UserDAO();
											String userid = request.getParameter("userid");
											User user = ud.findUserById(userid);
											if(user == null){
												user = new User();
												user.setUserid("error");
												user.setUsername("SNow");
												user.setUserpic("0");
											}
									%>
									<a href="UserOwnPage.jsp?ownerId=<%= user.getUserid() %>">
									<img style="width:150px; height:150px;" src="img/userimg<%=user.getUserpic()%>.jpg"
										alt="..." class="img-thumbnail">
									</a>
									<h3 style="padding-top:10px">
										<%
											out.print(user.getUsername());
										%>
									</h3>
								</center>
							</td>
							<td>
								<div style="padding-left:20px">
									<h2 style="padding-top:0px; class="username">
										 <%
											 	MessageDAO md = new MessageDAO();
											 	Message mesg = new Message();
											 	String mesgid = request.getParameter("msgid");
											 	mesg = md.findMesgByMesgId(mesgid);
											 	out.print(mesg.getMesgtitle());
											 %>
									
									<small style="font-size:16px">
										<%
											out.println(mesg.getMesgdate());
										%>
										<%
										String mid = (String)session.getAttribute("userId");										
										if(mesg.getUserid().equals(mid))
										{
										 %>
										 
										<a style="color:#888888" href="delMesg.jsp?msgid=<%=mesg.getMesgid() %>" ><span
												class="glyphicon glyphicon-trash" aria-hidden="true" style="color:#888888"></span>
										删除</a>
										<%} %>
										</small>
									</h2>
									<hr>
									<p class="userdesp" style="font-size:14px">
										<%
											out.println(mesg.getMesgcontent());
										%>
									</p>
								</div></td>
						</tr>
					</table>
				</div>
				
				<%
				if(session.getAttribute("userName") != null)
				{
				%>
				<div class="panel panel-default">
					<!-- Default panel contents -->
					<div class="panel-heading">添加评论</div>
					<div class="panel-body" width="80%">
						<form action="../NewComment" method="post">
							<table width="100%">
								<tr>
									<td width="90%"><input type="text" class="form-control"
										id="comm" name="comm" placeholder="输入你的评论">
										<%
											if(session.getAttribute("userId") != null)
											{
										 %>
										<input type="hidden" class="form-control"
										id="userid" name="userid" value="<%=
										session.getAttribute("userId")%>">
										<%} %>
										<input type="hidden" class="form-control"
										id="ownerid" name="ownerid" value="<%=request.getParameter("userid")%>">
										<input type="hidden" class="form-control"
										id="msgid" name="msgid" value="<%=request.getParameter("msgid")%>">
										</td>
									<td width="10%" style="padding-left:10px">
										<button type="submit" class="btn btn-primary">提交评论</button>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
				<%} %>

				<div class="panel panel-default">
					<!-- Default panel contents -->
					<div class="panel-heading">评论列表</div>
					<table class="table">
						<%
							ArrayList<Comment> commlist = new ArrayList<Comment>();
							CommentDAO cd = new CommentDAO();
							commlist = cd.findCommByMesgId(mesg.getMesgid());
							if (commlist.size() == 0) {
						%>
						<br>
						<p>目前无人问津啊</p>
						<br>
						<%
							} else {
						for (int i = 0; i < commlist.size(); i++) {
						%>
						<tr>
							<td width="80px">
								<center>
							 	<%
						 			UserDAO ud_c = new UserDAO();
						 			User user_c = ud_c.findUserById(commlist.get(i).getUserid());
						 			if(user_c == null){
					 	 				user_c = new User();
					 	 				user_c.setUserid("deny");
						 				user_c.setUsername("Snow");
						 				user_c.setUserpic("0");
						 			}

								 %> </b>
								 	<a href="UserOwnPage.jsp?ownerId=<%= user_c.getUserid() %>">
									<img style="width:50px; height:50px;" src="img/userimg<%=user_c.getUserpic()%>.jpg"
										alt="..." class="img-thumbnail">
									</a>
								</center></td>
							<td width="12%">
								<p>
									<b> <%

								 			out.println(user_c.getUsername());
										 %> </b>
								</p>
								<p style="font-size:12px">
									<%
										out.println(commlist.get(i).getComdate());
									%>
								</p></td>
							<td width="70%" >
								<p style="padding-top:10px;">
									<%
										out.println(commlist.get(i).getComcontent());
									%>
								</p></td>
							<td>
							<%									
							if(mesg.getUserid().equals(mid) || user_c.getUserid().equals(mid))
							{
							 %>
							<a href="delComm.jsp?commid=<%=commlist.get(i).getComid() %>" style="color:#888888"><span
												class="glyphicon glyphicon-trash" aria-hidden="true" style="color:#888888"></span>
										删除</a>
							<%} %>
							</td>
						</tr>
						<%
							}
							}
						%>
					</table>
				</div>
			</div>
		</center>

		<jsp:include page="ender.jsp" flush="true"></jsp:include>
	</div>

</body>
</html>
