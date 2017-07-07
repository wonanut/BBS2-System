<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>BBS登陆</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

</head>

<body style="background-size:100% 100%; height:100%; width:100%" background="img/bkg1.jpg">
	<div style="width:100%; padding-top:20px">
		<p class="navbar-brand" style="color:white"><b>BBS2用户登陆</b></p>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="MainPage.jsp" style="color:white">随便逛逛</a></li>
			</ul>
		</div>
	</div>
	
	<table width=100% height=60%>
		<tr>
			<td width=50% height=100%"></td>
			<td>
				<!-- 登录框 -->
				<center>
					<div align="right" style="text-align:center; width:50%" id="log"
						class="panel panel-default">
						<div class="panel-heading" style="padding:15px">账号密码登陆</div>
						<div id="log_form">
							<form action = "../Login" method = "post">
								<div
									style="padding-left:30px; padding-right:30px; padding-top:30px">
									<input type="text" name="u_name" class="form-control"
										id="u_name" placeholder="输入用户名" required>
								</div>
								</br>
								<div style="padding-left:30px; padding-right:30px;">
									<input type="password" name="u_password" id="u_password"
										class="form-control" placeholder="输入密码" required>
								</div>
								</br>
								<div id="u_remember"
									style="text-align:left;padding-left:30px">
									<a href="UserRegister.jsp"><p style="font-size:12px; color:black">忘记密码/没有账号</p></a>

								</div>
								</br>


								<div
									style="width:100%; padding-left:30px; padding-right:30px; padding-bottom:30px;" >
									<input type = "submit" onclick = "next()" value = "登   录" class="btn btn-primary" style="width:100%"/>
									</div>
							</form>
							<script>
								function next(){
									var xml = new XMLHttpRequest();
									xml.open("POST", "../Login", true);
									xml.setRequestHeader("Content-type","application/x-www-form-urlencoded");
									xml.send("u_password="+document.getElementById("u_password").value+"&u_name="+docunment.getElementById("u_name"));
									if (xmlhttp.readyState==4 && xmlhttp.status==200)
									{
										if("error" == xml.responseText){
											alert("无法识别给出的用户名密码组合！");
										}
									}
								}
							</script>
						</div>
					</div>
				</center></td>
		</tr>
	</table>
	<center><div style="position:absolute; bottom:0px;width:100%; height:18%; background-color:#888888;background:url('img/end.png') no-repeat center; background-size:100%; width:100%; height:200px;">
		<p style="padding-top:100px; padding-left:50px;font-size:14px; color:#ffffff">Powered By  |  童瑶  |  吴慧  |  安冰玉  |  李博闻  |  何新杰  |  黄永钦  |  林泽暘  |  潘文雯  |  王一凡  |  赵昕禹;</p>
		<p style="padding-left:50px;font-size:14px; color:#ffffff">Xi`an Jiaotong University, Xi`an, Shaanxi, China</p>
	</div></center>
</body>
</html>
