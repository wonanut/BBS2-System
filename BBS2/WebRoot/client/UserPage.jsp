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

<title><%=session.getAttribute("userName") %>的个人主页</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/formValidation.css"/>

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

<body style="background:url('img/bkg1.jpg');background-size:100%; background-attachment: fixed">
		<nav class="navbar navbar-default"
		style="position:fixed; width:100%; z-index:3">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<a class="navbar-brand" href="#">BBS2<span class="glyphicon glyphicon-leaf" aria-hidden="true"></span></a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">个人主页<span class="sr-only">(current)</span>
					</a></li>
					<li><a href="MainPage.jsp">论坛广场</a></li>
				<li><a href="#"><abbr title="更多功能正在开发中"><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></abbr></a></li>
				</ul>
				<div class="navbar-form navbar-left">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-default">提交查找</button>
					<button type="submit" class="btn btn-primary" data-toggle="modal"
						data-target="#myModal">发布新帖</button>
				</div>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> <%=session.getAttribute("userName") %></a></li>
					<li><a href="logout.jsp">
					<%
						if(session.getAttribute("userId") != null)
						{
							out.println("注销用户");
						}
					%></a></li>
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
										uimg = udimg.findUserById((String)session.getAttribute("userId"));
										
									 %>
									 
									<img style="width:150px; height:150px;" src="img/userimg<%=uimg.getUserpic()%>.jpg"
										alt="..." class="img-thumbnail">
								</center></td>
							<td>
								<div style="padding-left:30px">
									<p style="padding-top:0px; font-size:28px" class="username">
										<b>
											<%=session.getAttribute("userName") %>
										</b>
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
											if(session.getAttribute("userId") != null)
											{
												UserDAO ud = new UserDAO();
												User user = new User();
												user = ud.findUserById((String)session.getAttribute("userId"));
												username = user.getUsername();
												userid = user.getUserid();
												userdesp = user.getDescription();
												usericon = user.getUserpic();
												userpass = user.getPassword();
												out.println(userdesp);
										 	}
										 %>
									</p>
								</div>
							</td>
						</tr>
					</table>
				</div>


				<div class="panel panel-default" style="padding:30px;">
					<ul id="myTab" class="nav nav-tabs">
						<li class="active"><a data-toggle="tab" href="#userMesgtab">我的帖子</a>
						</li>
						<li><a href="#userInfo" data-toggle="tab">我的资料</a></li>
						<li><a href="#userConf" data-toggle="tab">个性配置</a></li>
					</ul>

					<br>

					<!-- 以下内容动态生成 -->
					<div class="tab-content">
						
						<div class="tab-pane fade in active" id="userMesgtab">
							<%
							MessageDAO md = new MessageDAO();
							ArrayList<Message> mesglist = new ArrayList<Message>();
							mesglist = md.findMesgByUserId((String)session.getAttribute("userId"));
							for(int i = mesglist.size()-1; i >= 0; i--)
							{
							%>
							<a href="DetailPage.jsp?msgid=<%= mesglist.get(i).getMesgid() %>&userid=<%= mesglist.get(i).getUserid() %>">
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
													<small>
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
											<p style="color:#666666">
											<% out.println(mesglist.get(i).getMesgcontent()); %>
											</p>
										</td>
									</tr>
								</table>
							</div>
							
							<%
								} 
							%>
							</a>
						</div>

						<div class="tab-pane fade" id="userInfo">
							<%
								String user_id = (String)session.getAttribute("userId");
								UserDAO ud = new UserDAO();
								User tmp_user = new User();
								tmp_user = ud.findUserById(user_id);
			
							 %>
							 
							 <form id="signupForm" class="form-horizontal" action="../UUpdate" method="post">
				
								 <div class="form-group">
				                      <label class="col-md-2 control-label">用户名</label>
				                      <div class="col-md-6">
				                          <input type="text" class="form-control" id="username" name="username" placeholder="小于20位用户名，数字字母下划线和小数点" value="<%=tmp_user.getUsername()%>"/>
				                      </div>
				           	  	 </div>
					              
					              <div class="form-group">
				                      <label class="col-md-2 control-label">密码</label>
				                      <div class="col-md-6">
				                          <input type="password" class="form-control" id="password" name="password" placeholder="6-20位密码，数字字母下划线和小数点" value="<%=tmp_user.getPassword()%>"/>
				                          <span class="help-block"></span>
				                      </div>
				                  </div>
				                  
				                  <div class="form-group">
				                      <label class="col-md-2 control-label">个人描述</label>
				                      <div class="col-md-6">
				                          <textarea type="password" class="form-control" name="desp" placeholder="输入你的个性描述"><%=tmp_user.getDescription()%></textarea>
				                          <span class="help-block"></span>
				                      </div>
				                  </div>
				                  
				                  <div class="form-group">
				                  		<label class="col-md-2 control-label"></label>
				                      <div class="col-md-6">
				                         <button type="submit" class="btn btn-primary" style="width:100%">修改信息</button>
				                      </div>
				                  </div>
				
							</form>
						</div>

						<div class="tab-pane fade" id="userConf">
							<!-- 头像修改框 -->
							<div>
								<div class="panel panel-default">
									<div class="panel-heading">头像修改</div>
									<div class="panel-body">
										<div class="sys_item_spec">
											<a href="../ChangeUImg?p=0"> <img style="width:100px; height:100px;"
												src="img/userimg0.jpg" alt="..."
												class="userimg userimg1 img-thumbnail"> </a> <a href="../ChangeUImg?p=1">
												<img style="width:100px; height:100px;"
												src="img/userimg1.jpg" alt="..."
												class="userimg userimg2 img-thumbnail"> </a> <a href="../ChangeUImg?p=2">
												<img style="width:100px; height:100px;"
												src="img/userimg2.jpg" alt="..."
												class="userimg userimg3 img-thumbnail"> </a> <a href="../ChangeUImg?p=3">
												<img style="width:100px; height:100px;"
												src="img/userimg3.jpg" alt="..."
												class="userimg userimg4 img-thumbnail"> </a> <a href="../ChangeUImg?p=4">
												<img style="width:100px; height:100px;"
												src="img/userimg4.jpg" alt="..."
												class="userimg userimg5 img-thumbnail"> </a> <a href="../ChangeUImg?p=5">
												<img style="width:100px; height:100px;"
												src="img/userimg5.jpg" alt="..."
												class="userimg userimg6 img-thumbnail"> </a> <a href="../ChangeUImg?p=6">
												<img style="width:100px; height:100px;"
												src="img/userimg6.jpg" alt="..."
												class="userimg userimg7 img-thumbnail"> </a> <a href="../ChangeUImg?p=7">
												<img style="width:100px; height:100px;"
												src="img/userimg7.jpg" alt="..."
												class="userimg userimg8 img-thumbnail"> </a>
												
										</div>
									</div>
								</div>

								<div class="panel panel-default">
									<div class="panel-heading">个性颜色</div>
									<div class="panel-body">
										<div></div>
									</div>
								</div>

							</div>
						</div>

					</div>

				</div>

			</div>
		</center>

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
				<form action="../Release" method="post">
				<div class="modal-body">
					
						<div class="form-group">
							<label for="exampleInputEmail1">标题</label> <input id="title" name="title" type="text"
								class="form-control">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">内容</label> <textarea id="msg" name="msg" rows="3"
								class="form-control"></textarea>
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
			
<script type="text/javascript">
		$(document).ready(function() {
		    $('#signupForm').formValidation({
		        message: 'This value is not valid',
		        icon: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        fields: {
		            username: {
		                validators: {
		                    notEmpty: {
		                        message: '必须输入合法有效的用户名'
		                    },
		                    stringLength: {
	                        min: 2,
	                        max: 20,
	                    	}
	 
		                }
		            },
		            password: {
		                validators: {
		                    notEmpty: {
		                        message: '密码不能为空'
		                    },
		                    different: {
	                        field: 'username',
	                        message: '密码和用户名相同'
	                    	},
		                    stringLength: {
	                        min: 6,
	                        max: 20
	                    	}
		                }
		            },
		             desp: {
		                validators: {
		                    notEmpty: {
		                        message: '个人描述不能为空'
		                    }
		                }
		            },
		        }
		    });

		    // Enable the password/confirm password validators if the password is not empty
		    $('#signupForm').find('[name="password"]').on('keyup', function() {
		        var isEmpty = $(this).val() == '';
		        $('#signupForm').formValidation('enableFieldValidators', 'password', !isEmpty)
		                        .formValidation('enableFieldValidators', 'repassword', !isEmpty);
		        if ($(this).val().length == 1) {
		            $('#signupForm').formValidation('validateField', 'password')
		                            .formValidation('validateField', 'repassword');
		        }
		    });
		});
	</script>

</body>
</html>
