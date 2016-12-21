<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
    	<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <title>Network Fingerprint Scanner</title>		
		
		<!-- Fav and touch icons -->
		<link rel="shortcut icon" href="static/image/w1.png" />
	    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">		
		<link href="rweb/assets/css/font-awesome.min.css" rel="stylesheet">
		<link href="rweb/assets/css/style.css" rel="stylesheet" type="text/css">	
		<link href="rweb/css/header.css"  type="text/css" rel="stylesheet">	
<!-- 		<link href="static/css/release.css"  type="text/css" rel="stylesheet">
 -->		<script>
			if (navigator.userAgent.split(";")[1].toLowerCase().indexOf("msie") > 0 ){
				window.location.href = "supportInfo";
			}
		</script>
		<style>
		.login-box,
			.register-box {
			  width: 400px;
			  padding: 20px;
			  margin: 110px auto;
			  background: #fff;
			}	
			.login-box .header,
			.register-box .header {
			  background: #414141;
			  color: white;
			  text-align: center;
			  margin: -20px -20px 20px -20px;
			  padding: 15px;
			  text-transform: uppercase;
			}	
			.login-box .text-center li {
			  display: inline-block;  
			}
			.login-box .text-center li a {
			  width: 45px;
			  height: 45px;
			  text-decoration: none;
			  padding-top: 13px;
			  font-size: 23px;
			}
			.login-box .text-center li a:hover {
			  color: #fff;
			}
			.login-box label,
			.register-box label {
			  margin: 10px 5px -10px 5px;
			}
			.login-box .confirm,
			.register-box .confirm {
			  position: relative;
			  margin: 20px 0 10px -15px;
			}
			.login-box .confirm label,
			.register-box .confirm label {
			  position: absolute;
			  top: -9px;
			  left: 30px;
			}
			.login-box form.register .input-group-addon,
			.register-box form.register .input-group-addon {
			  width: 35%;
			}
		/* ydj */
			.action-item {
			    display: inline-block;
			    padding-right: .5rem;
			    padding-left: .25rem;
			    border-right-width: 1px;
			    border-right-style: solid;
				    line-height: 1.25rem;
			    font-size: 1rem;
			    color: #999;
			    text-transform: uppercase;
			}
			.action-item a{
				cursor:pointer;
			}
			.radio-inline, .checkbox-inline{
				line-height:22px;
			}
			.btn1 {
	display: inline-block;
	margin-bottom: 0;
	font-weight: 400;
	text-align: center;
	vertical-align: middle;
	cursor: pointer;
	background-image: none;
	border: 1px solid transparent;
	white-space: nowrap;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	border-radius: 4px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none
}
.contactContent {
    font-size: 14px;
    margin-left: 10px;
    /* margin-right: 10px; */
}

.fieldWrapper #hint {
    margin-left: 10px;
    opacity: 0.5;
}
		</style>
	</head>
</head>

<body style="font-size:medium; line-height: 1.5em">
	<div class="container">
		<!-- Header -->
			<header id="" class="sticky-header" style="opacity: 1;padding:0;">
				
				<!-- Main Header -->
				<div id="main-header" style="height: 80px;">
					<div id="logo" class="col-lg-12 col-md-12 col-sm-12">
							<img src="static/image/b2.png" style="width: 110px;margin-top: -20px;margin-right: -20px;"/>
							<span style="color:white;font-size:33px;margin-top: 1px;">Network Fingerprint Scanner</span> 
							<span style="color: white; font-size: 15px; top: 28px; margin-left: 5px;">NFPscanner:a server for knowledge-based characterization of biomedical networks
</span> <span style="position:absolute;right:10;top:6;display: none;" >
								<c:choose>
									<c:when test="${sessionScope.username != null}">
										<button type="button" class="btn btn-primary" id="btn-user"><i class="fa fa-user"></i> <%=session.getAttribute("username") %></button>
										<button type="button" class="btn btn-primary" onclick="logout()" id="btn-out"><i class="fa  fa-user-md"></i> Log Out</button>
									</c:when>
									<c:otherwise>
										<button type="button" class="btn btn-primary" id="btn-login" data-toggle="modal" data-target="#loginModal"><i class="fa fa-lightbulb-o"></i> Login</button>
										<button type="button" class="btn btn-primary" id="btn-signup" data-toggle="modal" data-target="#signupModal"><i class="fa  fa-user-md"></i> Sign Up</button>
									</c:otherwise>
								</c:choose>
							</span> 
					</div>
					
				</div>
				<!-- /Main Header -->
				
				<!-- Lower Header -->
				<div id="lower-header">
					
					<div class="container">
					
					<div id="menu-button">
						<div>
						<span></span>
						<span></span>
						<span></span>
						</div>
						<span>Menu</span>
					</div>
					
					<ul id="navigation" style="">
						
						
						<!-- Home -->
						<li class="current-menu-item">
						
							<a class="fa " href="networksimilarityHome.html">Home</a>
							
							
						</li>
						<!-- /home -->
						
						<!-- Events -->
						<li  style="width: 300px;">
							<a class="fa  " href="networksimilarityAnalysis?type=1">Network Fingerprint Scan</a>
						</li>
						<li style="width: 250px;">
							<a class="fa  " href="networksimilarityAnalysis?type=2">Pairwise Alignment</a>
						</li>
				
						
						<!-- /Events -->
						
						<!-- Media -->
						<!-- /Media -->
						
						
						
						
						<!-- Features -->
						<li>
							<a class="fa " href="networksimilaritystatistical">Resource</a>
							<c:choose>
								<c:when test="${sessionScope.username != null}">
									<ul>
										<li><a id="resource1" href="networksimilaritystatistical">Statistics of current release</a></li>
										<li><a id="resource2" href="networksimilarityprofiles">My Profiles</a></li>
									</ul>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
						</li>
						<!-- /Features -->
						
						
						<!-- Get Involved -->
						<li>
							<a class="fa  " href="networksimilarityHelp">Help</a>
							
						</li>
						<!-- /Get Involved -->
						
						
						
						<!-- CONTACT -->
						<li>
								<a class="fa  " href="networksimilarityContact">Contact</a>
						</li>
						<!-- /CONTACT -->
						
					</ul>
					
					</div>
					
				</div>
				<!-- /Lower Header -->
				
				
			</header>
			<!-- /Header -->

		<!-- /Header -->
			
			<!-- Section -->
			<section class="section full-width-bg" style="padding-top:20px;height:100%;">
		<div class="">

			<div class="legacyTitle" style="margin-left: 15px;margin-top: 10px;">Version 1.4 online</div>
			<div class="legacyContent">
				<div class="legacyDate" style="margin-left: 15px;">10th November 2015</div>
				<div class="legacyDes">
					<p>
						<span >
							Server web interface and help page is updated.
 </span> 
					</p>

				</div>
			</div>
			<div class="legacyTitle" style="margin-left: 15px;margin-top: 10px;">Version 1.3 online</div>
			<div class="legacyContent">
				<div class="legacyDate" style="margin-left: 15px;">10th November 2015</div>
				<div class="legacyDes">
					<p>
						<span>
							Example data are deployed. Step-by-step tutorial guide are implemented. 
						 </span> 
					</p>

				</div>
			</div>
			<div class="legacyTitle" style="margin-left: 15px;margin-top: 10px;">Version 1.2 online</div>
			<div class="legacyContent">
				<div class="legacyDate" style="margin-left: 15px;">1st November 2015</div>
				<div class="legacyDes">
					<p>
						<span>
							Alternative basic networks are added and organized as public resource of NFPscanner server. 
						 </span> 
					</p>

				</div>
			</div>
			<div class="legacyTitle" style="margin-left: 15px;margin-top: 10px;">Version 1.1 online</div>
			<div class="legacyContent">
				<div class="legacyDate" style="margin-left: 15px;">15th October 2015</div>
				<div class="legacyDes">
					<p>
						<span >
							Pairwise alignment service, IsoRank algorithm, SPINAL algorithm, GHOST algorithm are added. 
							</span> 
					</p>

				</div>
			</div>
			<div class="legacyTitle" style="margin-left: 15px;margin-top: 10px;">Version 1.0 online</div>
			<div class="legacyContent">
				<div class="legacyDate" style="margin-left: 15px;">1st October 2015</div>
				<div class="legacyDes">
					<p>
						<span >
							The APcluster algorithm and KEGG basic networks are implemented.  </span> 
					</p>

				</div>
			</div>									


		</div>		
		
					</section>
			<!-- /Section -->
			
			
			
				<footer id="footer1" >	
				<!-- Lower Footer -->
				<div id="lower-footer" >
			
					<div class="row">
						
						<div class="col-lg-4 col-md-4 col-sm-4" style="opacity: 1;width: 100%;">
						
							<div align="center">
 								 <p class="copyright">NFPscanner is supported by a grant from National Nature Science Foundation of China.
								 </p>
								 <p class="copyright">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Copyright © 2015-2016 Beijing Institute of Radiation Medicine</p>
 								</div>

						</div>
						
						
					</div>
					
				</div>
				<!-- /Lower Footer -->
				
			
			</footer>
	</div>
		
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.1.min.js"></script>
 	<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="static/js/networksimilarityContact.js"></script>	
	<script type="text/javascript">
	function startIntro(){
		document.getElementById('pariwiseIframe').contentWindow.startIntro();
	}
	</script>
	

</body>
</html>