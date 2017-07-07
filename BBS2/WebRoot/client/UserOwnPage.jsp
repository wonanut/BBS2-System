<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	import="com.bbs.dbconnect.user.UserDAO"
	import="com.bbs.dbconnect.user.User"
	import="com.bbs.dbconnect.message.MessageDAO"
	import="com.bbs.dbconnect.message.Message"
	import="com.bbs.dbconnect.comment.Comment"
	import="com.bbs.dbconnect.comment.CommentDAO"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<% UserDAO getN = new UserDAO(); %>
<title><% if(getN.findUserById(request.getParameter("ownerId")) != null) out.print(getN.findUserById(request.getParameter("ownerId")).getUsername()); %>的个人主页</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="http://www.jq22.com/jquery/font-awesome.4.6.0.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/formValidation.css" />

<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/formValidation.js"></script>
<script type="text/javascript" src="js/framework/bootstrap.js"></script>
<script type="text/javascript" src="js/language/zh_CN.js"></script>

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
	<%
	if(request.getParameter("ownerId").equals("deny")){
		%>
		<a href="MainPage.jsp">
			<center><div style="margin:20px" class="alert alert-warning" role="alert">Error:该用户已经不存在</p></div></center>
		</a>
		<% 
	}
	else{
	 %>
	<nav class="navbar navbar-default"
		style="position:fixed; width:100%; z-index:3">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a class="navbar-brand" href="#">BBS2<span
				class="glyphicon glyphicon-leaf" aria-hidden="true"></span>
			</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">个人主页<span class="sr-only">(current)</span>
				</a>
				</li>
				<li><a href="MainPage.jsp">论坛广场</a>
				</li>
				<li><a href="#"><abbr title="更多功能正在开发中"><span
							class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
					</abbr>
				</a>
				</li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#"><span class="glyphicon glyphicon-user"
						aria-hidden="true"></span> <%=session.getAttribute("userName")%></a>
				</li>
				<li><a href="logout.jsp"> <%
 	if (session.getAttribute("userId") != null) {
 		out.println("注销用户");
 	}
 %>
				</a>
				</li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>


	<center>
		<div style="width:80%; padding-top:80px">
			<div class="panel panel-default" style="padding:30px;">
				<table width=100%>
					<tr style="height = 100%;">

						<td style="width:15%"><center>
								<%
									UserDAO udimg = new UserDAO();
									User uimg = new User();
									uimg = udimg.findUserById(request.getParameter("ownerId"));
									//System.out.println(uimg.getUserid());
								%>

								<img style="width:150px; height:150px;"
									src="img/userimg<%=uimg.getUserpic()%>.jpg" alt="..."
									class="img-thumbnail">
							</center>
						</td>
						<td>
							<div style="padding-left:30px">
								<p style="padding-top:0px; font-size:28px" class="username">
									<b> <%=uimg.getUsername()%> </b>
								</h2>
								<p style="font-size:12px; padding-top:10px" class="userclass">
									<span class="label label-warning">LV0 
								</p>
								</span>
								<hr>
								<p class="userdesp" style="font-size:14px">
									<%
										String username = "";
										String userid = "";
										String userdesp = "";
										String usericon = "";
										String userpass = "";
										if (request.getParameter("ownerId") != null) {
											UserDAO ud = new UserDAO();
											User user = new User();
											user = ud.findUserById(request.getParameter("ownerId"));
											username = user.getUsername();
											userid = user.getUserid();
											userdesp = user.getDescription();
											usericon = user.getUserpic();
											userpass = user.getPassword();
											out.println(userdesp);
										}
									%>
								</p>
							</div></td>
					</tr>
				</table>
			</div>


			<br>

			<!-- 以下内容动态生成 -->
			<div class="tab-content">

				<div class="tab-pane fade in active" id="userMesgtab">
					<%
						MessageDAO md = new MessageDAO();
						ArrayList<Message> mesglist = new ArrayList<Message>();
						mesglist = md.findMesgByUserId(request.getParameter("ownerId"));
						for (int i = mesglist.size() - 1; i >= 0; i--) {
					%>
					<a
						href="DetailPage.jsp?msgid=<%=mesglist.get(i).getMesgid()%>&userid=<%=mesglist.get(i).getUserid()%>">
						<div class="userMesg panel panel-default"
							style="padding-left:20px; padding-right:20px; padding-bottom:30px">
							<table width=100%>
								<tr>
									<td>
										<div class="page-header">
											<h3>
												<%
													out.println(mesglist.get(i).getMesgtitle());
												%>
												<small> <%
														 	out.println(mesglist.get(i).getMesgdate());
														 %> </small> <small>&nbsp;&nbsp;&nbsp; <span
													class="glyphicon glyphicon-edit" aria-hidden="true"></span>
													评论( <%
 	String msgId = mesglist.get(i).getMesgid();
 		ArrayList<Comment> comlist = new ArrayList<Comment>();
 		CommentDAO cd2 = new CommentDAO();
 		comlist = cd2.findCommByMesgId(msgId);
 		out.println(comlist.size());
 %> ) </small>
											</h3>
										</div>
										<p style="color:#666666">
											<%
												out.println(mesglist.get(i).getMesgcontent());
											%>
										</p></td>
								</tr>
							</table>
						</div> <%
 	}
 %> </a>
				</div>

			</div>

		</div>
	</center>

	<jsp:include page="ender.jsp" flush="true"></jsp:include>
<%} %>
</body>
</html>
