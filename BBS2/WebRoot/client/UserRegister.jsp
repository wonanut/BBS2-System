<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>新用户注册</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/formValidation.css"/>
<link rel="stylesheet" type="text/css" href="css/default.css">

<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/formValidation.js"></script>
<script type="text/javascript" src="js/framework/bootstrap.js"></script>
<script type="text/javascript" src="js/language/zh_CN.js"></script>

</head>

<body style="background-size:100% 100%; height:100%; width:100%" background="img/bkg1.jpg">
	<div style="width:100%; padding-top:20px">
		<p class="navbar-brand" style="color:white"><b>BBS2新用户注册</b></p>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="MainPage.jsp" style="color:white">随便逛逛</a></li>
			</ul>
		</div>
	</div>

	<center>
	<div style="height:55%; width:100%; padding-left:60%">
		<div id="divcontent"
			style="padding-top:30px; width:700px; height:100%; "
			>
			<form id="signupForm" class="form-horizontal" action="../Register" method="post">
				
				 <div class="form-group">
                      <label class="col-md-2 control-label">用户名</label>
                      <div class="col-md-6">
                          <input type="text" class="form-control" id="username" name="username" placeholder="小于20位用户名，数字字母下划线和小数点"/>
                      </div>
           	  	 </div>
	              
	              <div class="form-group">
                      <label class="col-md-2 control-label">密码</label>
                      <div class="col-md-6">
                          <input type="password" class="form-control" id="password" name="password" placeholder="6-20位密码，数字字母下划线和小数点"/>
                          <span class="help-block"></span>
                      </div>
                  </div>
                  
                  <div class="form-group">
                      <label class="col-md-2 control-label">重复密码</label>
                      <div class="col-md-6">
                          <input type="password" class="form-control" id="repassword" name="repassword" placeholder="确认两次密码输入一致"/>
                          <span class="help-block"></span>
                      </div>
                  </div>
                  
                  <div class="form-group">
                      <label class="col-md-2 control-label">个人描述</label>
                      <div class="col-md-6">
                          <textarea type="password" class="form-control" name="desp" placeholder="输入你的个性描述"></textarea>
                          <span class="help-block"></span>
                      </div>
                  </div>
                  
                  <div class="form-group">
                      <div class="col-md-8 col-lg-offset-1" style="float:left">
                          <h3><button type="submit" class="btn btn-primary">提交注册</button>
                          <small>已有BBS论坛帐号？<a href="Login.jsp">立即登录</a></small></h3>
                      </div>
                  </div>

			</form>
		</div>
	</center>
	</div>
	
	<center><div style="position:absolute; bottom:0px;width:100%; height:18%; background-color:#888888;background:url('img/end.png') no-repeat center; background-size:100%; width:100%; height:200px;">
		<p style="padding-top:100px; padding-left:50px;font-size:14px; color:#ffffff">Powered By  |  童瑶  |  吴慧  |  安冰玉  |  李博闻  |  何新杰  |  黄永钦  |  林泽暘  |  潘文雯  |  王一凡  |  赵昕禹;</p>
		<p style="padding-left:50px;font-size:14px; color:#ffffff">Xi`an Jiaotong University, Xi`an, Shaanxi, China</p>
	</div></center>
	
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
		            repassword: {
		                validators: {
		                    notEmpty: {
		                        message: '确认密码不能为空'
		                    },
		                    identical: {
		                        field: 'password',
		                        message: '确保两次输入内容一致'
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
