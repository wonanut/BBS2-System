<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	import="com.bbs.dbconnect.user.UserDAO"
	import="com.bbs.dbconnect.user.User"%>

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
				<li class="active"><a href="#">用户列表<span class="sr-only">(current)</span>
				</a></li>
				<li><a href="ShowMesg.jsp">帖子列表</a></li>
				<li><a href="#">更多</a></li>
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

	<div class="row">
		<div class="col-xs-6 col-md-3"
			style="margin-left:10px; position:fixed; top:70px; z-index:2; background-color:#ffffff; height:100%">
			<center>
				<img style="width:150px; height:150px;" src="img/userimg.jpg"
					alt="..." class="img-circle"> <br> <br>
				<h4>BBS Admin</h4>
				<hr>

				<div>
					<form action="insertUser.jsp">
						<div>
							<!-- Stack the columns on mobile by making one full-width and the other half-width -->
							<div class="row">
								<div class="col-xs-4 col-md-4">用户名</div>
								<div class="col-xs-8 col-md-8">
									<input type="text" name="username" class="form-control">
								</div>
							</div>
							<div class="row" style="padding-top:5px;">
								<div class="col-xs-4 col-md-4">密 码</div>
								<div class="col-xs-8 col-md-8">
									<input type="password" name="password" class="form-control">
								</div>
							</div>
							<div class="row" style="padding-top:5px;">
								<div class="col-xs-4 col-md-4">介 绍</div>
								<div class="col-xs-8 col-md-8">
									<input type="text" name="desp" class="form-control">
								</div>
							</div>
							<input type="submit" value="添加用户" class="btn btn-default"
								style="width:100%; margin-top:5px"></input>
						</div>

					</form>
					<!-- 					<form action="delUser.jsp">
					删除用户名<input type="text" name="delusername">
			  			<input type="submit" value="添加用户"></input>
			  		</form> -->

				</div>
			</center>
		</div>
		
		<div class="col-xs-12 col-md-9"
			style="position:absolute; left:25%; top:80px; z-index:1">
			<table class="table table-hover" style="font-size:15">
				<tr style="width:100%;">
					<td colspan="8">
						<center>用户列表</center>
					</td>
				</tr>
				<tr>
					<td width="7%"><center>编号</center></td>
					<td width="10%"><center>用户ID</center></td>
					<td width="10%"><center>用户名</center></td>
					<td width="10%"><center>用户密码</center></td>
					<td width="7%"><center>头像</center></td>
					<td width="43%"><center>用户介绍</center></td>
					<td width="5%"><center>编辑</center></td>
					<td width="5%"><center>删除</center></td>
				</tr>
				<%
					UserDAO ud = new UserDAO();
					ArrayList<User> userlist = new ArrayList<User>();
					userlist = ud.finAll();
					for (int i = 0; i < userlist.size(); i++) {
				%>

				<tr class="list">
					<td>
						<%
							out.println(i + 1);
						%>
					</td>
					<td>
						<%
							out.println(userlist.get(i).getUserid());
						%>
					</td>
					<td class="list">
						<%
							out.println(userlist.get(i).getUsername());
						%>
					</td>
					<td class="list">
						<%
							out.println(userlist.get(i).getPassword());
						%>
					</td>
					<td class="list">
						<%
							out.println(userlist.get(i).getUserpic());
						%>
					</td>
					<td class="list">
						<%
							out.println(userlist.get(i).getDescription());
						%>
					</td>
					<td class="list"><input type="submit" value="编辑" id=<%=userlist.get(i).getUserid() %>
						class="btn btn-success" style="font-size:12" data-toggle="modal"
						data-target="#myModal" onclick="updateMsg()">
					</td>
					
					<td class="list"><a
						href="delUser.jsp?uid=<%=userlist.get(i).getUserid()%>"> <input
							type="submit" value="删除" class="btn btn-danger"
							style="font-size:12"> </a>
					</td>

				</tr>

				<%
					}
				%>

			</table>
		</div>
	</div>

	<!--  <div style="height:19%; width:100%; background-color:#bdbdbd">
     	<br><br>
     	<center>By Howard Wonanut and his team.</center>
     </div> -->

	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">编辑用户信息</h4>
				</div>
				<div class="modal-body">
					<form action="../AUpdate" method="post">
						<div class="form-group">
							<label for="exampleInputEmail1">用户Id</label> <input name="userId" type="text"
								class="form-control">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">用户名</label> <input name="userName" type="text"
								class="form-control">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">密码</label> <input name="psw" type="text"
								class="form-control">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">个人介绍</label> <input name="desp" type="text"
								class="form-control">
							<label for="exampleInputEmail1">用户头像</label> <input name="img" type="text"
								class="form-control">
						</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<input type="submit" class="btn btn-primary" value="提交更改">
					<script type="text/javascript">
						function submits(){
							var xml = new XMLHttpRequest();
							xml.open("POST", "../ChangeUser", true);
							xml.setRequestHeader("Content-type","application/x-www-form-urlencoded");
							xml.send("userId="+decument.getElementById("userId")+
							"&userName="+document.getElementById("userName").value+
							"&psw="+document.getElementById("psw")+
							"&desp="+document.getElemenById("desp")+
							"&img="+document.getElementById("img"));
						}
						/* function editInfo(obj) {  
						    var id = $(obj).attr("id");  
						    //获取表格中的一行数据  
						    var stuno = document.getElementById("table").rows[id].cells[0].innerText;  
						    var pass = document.getElementById("table").rows[id].cells[1].innerText;  
						   	var name = document.getElementById("table").rows[id].cells[2].innerText;  
						    var sex = document.getElementById("table").rows[id].cells[3].innerText;  
						    //向模态框中传值  
						    $('#stuno').val(stuno);  
						    $('#pass').val(pass);  
						    $('#stuname').val(name);  
    						$('#update').modal('show');  
						}   */
						
					</script>
				</div>
					</form>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
<%} %>
</body>
</html>
