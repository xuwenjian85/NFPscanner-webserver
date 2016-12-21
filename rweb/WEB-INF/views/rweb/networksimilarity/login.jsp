<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style>
	.control-group.warning > label,
	.control-group.warning .help-block,
	.control-group.warning .help-inline {
	  color: #c09853;
	}
	
	.control-group.warning input,
	.control-group.warning select,
	.control-group.warning textarea {
	  color: #c09853;
	 /* border-color: #c09853;*/
	}
	
	.control-group.warning input:focus,
	.control-group.warning select:focus,
	.control-group.warning textarea:focus {
	  /*border-color: #a47e3c;*/
	  -webkit-box-shadow: 0 0 6px #dbc59e;
	     -moz-box-shadow: 0 0 6px #dbc59e;
	          box-shadow: 0 0 6px #dbc59e;
	}
	
	.control-group.warning .input-prepend .add-on,
	.control-group.warning .input-append .add-on {
	  color: #c09853;
	  background-color: #fcf8e3;
	  /*border-color: #c09853;*/
	}
	
	.control-group.error > label,
	.control-group.error .help-block,
	.control-group.error .help-inline {
	  color: #b94a48;
	}
	
	.control-group.error input,
	.control-group.error select,
	.control-group.error textarea {
	  color: #b94a48;
	  /*border-color: #b94a48;*/
	}
	
	.control-group.error input:focus,
	.control-group.error select:focus,
	.control-group.error textarea:focus {
	  /*border-color: #953b39;*/
	  -webkit-box-shadow: 0 0 6px #d59392;
	     -moz-box-shadow: 0 0 6px #d59392;
	          box-shadow: 0 0 6px #d59392;
	}
	
	.control-group.error .input-prepend .add-on,
	.control-group.error .input-append .add-on {
	  color: #b94a48;
	  background-color: #f2dede;
	 /* border-color: #b94a48;*/
	}
	
	.control-group.success > label,
	.control-group.success .help-block,
	.control-group.success .help-inline {
	  color: #468847;
	}
	
	.control-group.success input,
	.control-group.success select,
	.control-group.success textarea {
	  color: #468847;
	  /*border-color: #468847;*/
	}
	
	.control-group.success input:focus,
	.control-group.success select:focus,
	.control-group.success textarea:focus {
	  /*border-color: #356635;*/
	  -webkit-box-shadow: 0 0 6px #7aba7b;
	     -moz-box-shadow: 0 0 6px #7aba7b;
	          box-shadow: 0 0 6px #7aba7b;
	}
	
	.control-group.success .input-prepend .add-on,
	.control-group.success .input-append .add-on {
	  color: #468847;
	  background-color: #dff0d8;
	  /*border-color: #468847;*/
	}
	.help-block,
	.help-inline {
	  color: #555555;
	}
	
	.help-block {
	  display: block;
	  margin-bottom: 9px;
	  padding-left:10px;
	}
	
	.help-inline {
	  display: inline-block;
	  *display: inline;
	  padding-left: 5px;
	  vertical-align: middle;
	  *zoom: 1;
	}
	</style>
	<script src="rweb/js/bootstrap-validator/jqBootstrapValidation.js"></script>
	<script src="rweb/js/login.js"></script>
  </head>
  
  <div class="modal fade" id="loginModal" style="overflow: hidden;top:25%;margin:0 auto;width:400px;" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel">
	  <div class="modal-dialog" style="border:none;" role="document">
		<div class="box">
				<div class="login-box" style="margin:0 auto;">
						 <button type="button" style="margin-top:-8px;color:white;" class="close" 
			               data-dismiss="modal" aria-hidden="true">
			                  &times;
			            </button>
						<div class="header">
						Login to Proton
						</div>
						<form class="form-horizontal login" method="post" action="networksimilarity/loginAction.form?url=<%=request.getHeader("Referer")%>">
						
							<fieldset class="col-sm-12" style="border:none;">
								<div class="form-group">
									<div class="controls row">
										<div class="input-group col-sm-12" style="width:340px;margin:0 auto;">	
											<input type="text" name="username" class="form-control" id="loginusername" placeholder="Username or E-mail" minlength="6" required>
											<span class="input-group-addon"><i class="fa fa-user"></i></span>
										</div>	
									</div>
								</div>
							
								<div class="form-group">
									<div class="controls row">
										<div class="input-group col-sm-12" style="width:340px;margin:0 auto;margin-top:15px;">	
											<input type="password" name="password" class="form-control" id="loginpassword" placeholder="Password" minlength="6" required>
											<span class="input-group-addon"><i class="fa fa-key"></i></span>
										</div>	
									</div>
								</div>

									

								<div class="row" style="margin:0 auto;margin-top:30px;">
							
									<button type="submit" class="btn btn-lg btn-primary col-xs-12">Login</button>
							
								</div>
								
							</fieldset>	

						</form>
					
						<a class="pull-left" href="page-login.html#" style="margin-left:12px;">Forgot Password?</a>
						<a class="pull-right" href="page-register.html" style="margin-right:12px;">Sign Up!</a>
					
						<div class="clearfix"></div>				
						
					</div>
			</div>
		</div>
	</div>	
	
	<div class="modal fade" id="signupModal" style="overflow: hidden;top:20%;margin:0 auto;width:400px;" tabindex="-1" role="dialog" aria-labelledby="signupModalLabel">
	  <div class="modal-dialog" style="border:none;" role="document">
		<div class="row">
			<div class="login-box" style="margin: 0 auto;">
						<button type="button" style="margin-top:-8px;color:white;" class="close" 
			               data-dismiss="modal" aria-hidden="true">
			                  &times;
			            </button>
						<div class="header">
						Create new account
						</div>
					
						<form class="form-horizontal register" method="post" action="networksimilarity/signup.form?url=<%=request.getHeader("Referer")%>">
						
							<fieldset class="col-sm-12" style="border: none;">
								<div class="form-group control-group">							  	
									<div class="controls row">
										<div class="input-group col-sm-12" style="width:364px;margin:0 auto;">
											<input type="text" class="form-control" name="username" placeholder="Username" id="signusername" minlength="6" required>
										</div>	
									</div>
								</div>
								
								<div class="form-group control-group">							  	
									<div class="controls row">
										<div class="input-group col-sm-12" style="width:364px;margin:0 auto;margin-top:15px;">
											<input type="email" class="form-control" name="email" placeholder="Email Address" id="signemail" required>
										</div>	
										
									</div>
								</div>
							
								<div class="form-group">							  	
									<div class="controls row">
										<div class="input-group col-sm-12" style="width:364px;margin:0 auto;margin-top:15px;">
											<input type="password" class="form-control" name="password" placeholder="Password" id="signpassword" minlength="6" required>
										</div>	
									</div>
								</div>
								
								<div class="form-group">							  	
									<div class="controls row">
										<div class="input-group col-sm-12" style="width:364px;margin:0 auto;margin-top:15px;">
											<input type="password" class="form-control" name="comfirmpassword" placeholder="Confirm Password" id="signcomfirmpassword" minlength="6" required>
										</div>	
									</div>
								</div>
		
								<!-- <div class="confirm">
									<input type="checkbox" name="agree">
									<label for="agree">I agree to <a href="page-register.html#">Term of Use</a></label>
								</div>	
								 -->
							
								<div class="row" style="margin-top:20px;">
									<button type="submit" class="btn btn-primary btn-lg col-xs-12">Create Account!</button>
								</div>
							</fieldset>	

						</form>			
				</div>	</div>
		</div>
	</div>	
	
	<div class="modal fade" id="myinfoModal" style="top:25%;margin:0 auto;width:520px;" tabindex="-1" role="dialog" aria-labelledby="myinfoModalLabel">
	  <div class="modal-dialog" style="border:none;" role="document">
		<div class="box border">
			<div class="box-title">
				<h4><i class="fa fa-check-square-o"></i>System Info</h4>
				<div class="tools">
					<a href="javascript:;" data-dismiss="modal" aria-label="Close" class="remove">
						<i class="fa fa-times"></i>
					</a>
				</div>
			</div>
			<div class="box-body">
				Sign Up failed!
			</div>
		</div>
	  </div>
	</div>
	<div class="modal fade" id="loginfoModal" style="top:25%;margin:0 auto;width:520px;" tabindex="-1" role="dialog" aria-labelledby="loginfoModalLabel">
	  <div class="modal-dialog" style="border:none;" role="document">
		<div class="box border">
			<div class="box-title">
				<h4><i class="fa fa-check-square-o"></i>System Info</h4>
				<div class="tools">
					<a href="javascript:;" data-dismiss="modal" aria-label="Close" class="remove">
						<i class="fa fa-times"></i>
					</a>
				</div>
			</div>
			<div class="box-body">
				Login failed!
			</div>
		</div>
	  </div>
	</div>
</html>
