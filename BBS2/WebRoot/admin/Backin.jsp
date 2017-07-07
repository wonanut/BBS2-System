<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>Backin Login</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/menu.css" />
<script type="text/javascript">
function checkform()
{
if(document.getElementById('admin').value=='')
{
alert('用户名不能为空！');
return false;
}
if(document.getElementById('password').value=='')
{
alert('密码不能为空！');
return false;
}
}
</script>
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

</head>
  
  <body style="width:100%">
  <center>
  <form style="width:25%; padding-top:100px" name="login" id="login" method="POST" action="../ALogin">
  <h1>BBS2 Backin Login</h1>
  <hr>
   <span class="glyphicon glyphicon-home"></span>    <span class="glyphicon glyphicon-signal"></span>
    <input class="form-control" placeholder="管理员账号" type="text" name="admin" id="admin" required><br>
    <input class="form-control" placeholder="管理员密码" type= "password" name="password" id="password" required><br>
    <input class="btn btn-primary" type="submit" value="Backin Login" style="width:100%">
  </form >
  </center>
    
  </body>
</html>
