<%@ page language="java" import="java.util.*"
	import="com.bbs.dbconnect.message.MessageDAO"
	import="com.bbs.dbconnect.message.Message"
	import="com.bbs.dbconnect.user.UserDAO"
	import="com.bbs.dbconnect.user.User"
	import="com.bbs.dbconnect.comment.Comment"
	import="com.bbs.dbconnect.comment.CommentDAO"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>BBS论坛</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<style>
.mesg
{
	box-shadow: 0 0 10 rgba(150, 150, 150, .9);
}
.mesg:hover {
	box-shadow: 0 0 20 rgba(40, 40, 40, .9);
	transition: box-shadow 1s;
}
</style>

</head>

<body
	style="background:url('img/bkg1.jpg');background-size:100%; background-attachment: fixed">
	<nav class="navbar navbar-default"
		style="position:fixed; width:100%; z-index:3; ">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a class="navbar-brand" href="#">BBS2<span class="glyphicon glyphicon-leaf" aria-hidden="true"></span></a>
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
				<li class="active"><a href="#">论坛广场</a></li>
				<li><a href="#"><abbr title="更多功能正在开发中"><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></abbr></a></li>
			</ul>

			<%
				if (session.getAttribute("userName") != null) {
			%>
			<div class="navbar-form navbar-left">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">提交查找</button>
				<button type="submit" class="btn btn-primary" data-toggle="modal"
					data-target="#myModal">发布新帖</button>
			</div>
			<%
				}
			%>

			<ul class="nav navbar-nav navbar-right">
			<li><a href="<%
				if (session.getAttribute("userName") != null) {
				out.println("UserPage.jsp");
				%>
					">
					<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
				<%
				}
				if(session.getAttribute("userName") != null) {
				out.println(session.getAttribute("userName")); 
				%>
				
				</a></li>
				
				<li><a
					href="
					<%}if (session.getAttribute("userName") == null) {
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

	<div>
		<center>
			<div class="tab-content"
				style="width:80%; padding-top:70px; opacity:0.98">

				<%
					MessageDAO md = new MessageDAO();
					ArrayList<Message> mesglist = new ArrayList<Message>();
					mesglist = md.finAll();
					for (int i = mesglist.size()-1; i >= 0; i--) {
				%>

				<div class="mesg panel panel-default" style="padding:15px">
					<a
						href="DetailPage.jsp?msgid=<%=mesglist.get(i).getMesgid()%>&userid=<%=mesglist.get(i).getUserid()%>">
						<table width=100%;">
							<tr>
								<td width="15%">
									<center>
										<%
										UserDAO udimg = new UserDAO();
										User uimg = new User();
										uimg = udimg.findUserById(mesglist.get(i).getUserid());
										
									 	%>
									 
										<img style="width:100px; height:100px;" src="img/userimg<%=uimg.getUserpic()%>.jpg"
										alt="..." class="img-circle">
										
										<h4>
											<%
												UserDAO ud = new UserDAO();
													String tmp_username = ud.findUserById(
													mesglist.get(i).getUserid()).getUsername();
													out.println(tmp_username);
											%>
										</h4>
									</center>
								</td>
								<td width="80%">
								<div class="row">
								<div class="col-md-10">
								
									<h3 >
									<span class="glyphicon glyphicon-leaf" aria-hidden="true" style="color:#06B9D1"></span>
									
										<%
											out.println(mesglist.get(i).getMesgtitle());
										%>
									
									<small style="color:#bbb; font-size:14px">
										<%
											out.println(mesglist.get(i).getMesgdate());
										%>
									</small>
									<small>&nbsp;&nbsp;&nbsp;
									<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
									评论(
									<% 
										String msgId = mesglist.get(i).getMesgid();
										ArrayList<Comment> comlist = new ArrayList<Comment>();
										CommentDAO cd2 = new CommentDAO();
										comlist = cd2.findCommByMesgId(msgId);
										out.println(comlist.size());
									%>
									)
									</small>
									</h3>
									</div>
									

									
								</div>
									<hr>
									<p style="color:#666666">
										<%
											out.println(mesglist.get(i).getMesgcontent());
										%>
									</p>
								</td>
							</tr>
						</table> </a>
				</div>

				<%
					}
				%>
			</div>

		</center>
	</div>

	<jsp:include page="ender.jsp" flush="true"></jsp:include>

	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">发布新帖</h4>
				</div>
				<form action="../MpSub" method="post">
				<div class="modal-body">
						<div class="form-group">
							<label for="exampleInputEmail1">标题</label> <input type="text" id="title" name="title"
								class="form-control">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">内容</label>
							<textarea id="msg" name="msg" rows="3" class="form-control"></textarea>
						</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<input type="submit" class="btn btn-primary" value="发布">
				</div>
				</form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
</body>
</html>
