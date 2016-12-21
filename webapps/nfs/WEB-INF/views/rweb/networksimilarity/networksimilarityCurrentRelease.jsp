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
<!--  		<link rel="shortcut icon" href="rweb/assets/ico/favicon.ico" type="image/x-icon" />    
 --> 		<script src="rweb/assets/js/jquery-2.1.1.min.js"></script>
	    <link href="rweb/assets/css/bootstrap.min.css" rel="stylesheet">		
		<link href="rweb/assets/css/font-awesome.min.css" rel="stylesheet">
		<link href="rweb/assets/css/style.css" rel="stylesheet" type="text/css">	
		<link href="rweb/css/header.css"  type="text/css" rel="stylesheet">	
		<link href="static/css/release.css"  type="text/css" rel="stylesheet">
		<script>
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

<body style="padding-top: 142px;background: #fff;padding-bottom: 0px;">
	<div class="container">
		<!-- Header -->
		<header id="header" class="sticky-header"
			style="opacity: 1;padding:0;"> <!-- Main Header -->
		<div id="main-header" style="height: 80px;">
			<div id="logo" class="col-lg-12 col-md-12 col-sm-12">

				<!-- <a href="networksimilarityHome"><img
					src="rweb/assets/img/logo.png" alt="Logo"></a> <span
					style="color: white; font-size: 15px; position: absolute; top: 30px;">Biomedical
					network similarity combining interaction networks and functional
					annotations</span>  -->
				<span style="color: white; font-size: 33px; margin-top: 1px;">Network
					Finger Print</span> <span
					style="color: white; font-size: 15px; top: 28px; margin-left: 5px;">Biomedical
					network similarity combining interaction networks and functional
					annotations</span> <span style="position: absolute; right: 10; top: 6;">
					<!-- <c:choose>
						<c:when test="${sessionScope.username != null}">
							<button type="button" class="btn btn-primary" id="btn-user">
								<i class="fa fa-user"></i>
								<%=session.getAttribute("username") %></button>
							<button type="button" class="btn btn-primary" onclick="logout()"
								id="btn-out">
								<i class="fa  fa-user-md"></i> Log Out
							</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-primary" id="btn-login"
								data-toggle="modal" data-target="#loginModal">
								<i class="fa fa-lightbulb-o"></i> Login
							</button>
							<button type="button" class="btn btn-primary" id="btn-signup"
								data-toggle="modal" data-target="#signupModal">
								<i class="fa  fa-user-md"></i> Sign Up
							</button>
						</c:otherwise>
					</c:choose> -->
				</span>
			</div>

		</div>
		<!-- /Main Header --> <!-- Lower Header -->
		<div id="lower-header">

			<div class="container">

				<div id="menu-button">
					<div>
						<span></span> <span></span> <span></span>
					</div>
					<span>Menu</span>
				</div>

				<ul id="navigation" style="">


					<!-- Home -->
					<li class="current-menu-item"><a class="fa fa-home"
						href="networksimilarityHome">Home</a></li>
					<!-- /home -->

					<!-- Events -->
<!-- 					<li><a class="fa fa-puzzle-piece"
						class="fa fa-sort-amount-desc" class="fa fa-sort-amount-desc"
						id="topAnalysis" href="networksimilarityAnalysis">Analysis</a>

						<ul>

							<li><a href="networksimilarityAnalysis?type=1">Pairwase
									Alignment</a></li>
							<li><a href="networksimilarityAnalysis?type=2">NetworkFingerPrint</a></li>

						</ul>

						<div class="dropdown-button"></div></li> -->
						<li  style="width: 300px;">
							<a class="fa  fa-comments" href="networksimilarityAnalysis?type=2">Network Fingerprint Scan</a>
						</li>
						<li style="width: 250px;">
							<a class="fa  fa-comments" href="networksimilarityAnalysis?type=1">Pairwise Alignment</a>
						</li>

					<!-- /Events -->

					<!-- Media -->
<!-- 					<li><a class="fa  fa-info-circle" id="resultNav">Result</a></li>
 -->					<!-- /Media -->



					<!-- Features -->
					<li><a class="fa fa-list-alt"
						href="networksimilaritystatistical">Resource</a> <c:choose>
							<c:when test="${sessionScope.username != null}">
								<ul>
									<li><a id="resource1" href="networksimilaritystatistical">Statistics
											of current release</a></li>
									<li><a id="resource2" href="networksimilarityprofiles">My
											Profiles</a></li>
								</ul>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose></li>
					<!-- /Features -->
					
					

					<!-- Get Involved -->
					<li><a class="fa fa-info-circle" href="networksimilarityHelp">Help</a>
					</li>
					<!-- /Get Involved -->

					
					
					<!-- CONTACT -->
					<li><a class="fa  fa-comments"
						href="networksimilarityContact">Contact</a></li>
					<!-- /CONTACT -->

				</ul>

			</div>

		</div>
		<!-- /Lower Header --> </header>
		<!-- /Header -->
				<section id="content" style="height:100%;">
			
			<!-- Section -->
			<section class="section full-width-bg" style="padding-top:20px">
		<div class="">
			<ol class="breadcrumb" id="breadcrumb" style="margin: 10px 0 0 0;">
				<li><!-- <i class="fa fa-edit"></i> --><a href="networksimilarityHome" style="font-size: 15px;">Home</a></li>
				<li><!-- <i class="fa fa-th"></i> --><span id="analysisName" style="font-size: 15px;">Release</span></li>
			</ol>

			<div class="legacyTitle" style="margin-left: 15px;margin-top: 10px;">NFP2015_10(current)</div>
			<div class="legacyContent">
				<div class="legacyDate" style="margin-left: 15px;">October  10th, 2015</div>
				<div class="legacyDes">
					<p>
<!-- 						<span
							style="color: #333333; font-size: 13.63636302947998px; font-family: 'Lucida Grande', 'Lucida Sans Unicode', 'Lucida Sans', Helvetica, Verdana, Tahoma, sans-serif;">This
							release of EHFPI contains 4634 genes from 25 species of Bacteria,
							Fungi and Virus.</span> -->
					</p>

				</div>
			</div>


			<div class="legacyRegister">
				<!-- <a href="/ehfpi/download/register/">Register</a> to download all
				EHFPI data. -->
			</div>
		</div>
				</section>
	</section>
		<!-- Footer -->
			<footer id="footer1" >	
				<!-- Lower Footer -->
				<div id="lower-footer">
					
					<div class="row">
						
						<div class="col-lg-4 col-md-4 col-sm-4" style="opacity: 1;width: 100%;">
						
<!-- 							<p class="copyright">© 2014 Candidate. All Rights Reserved.More Templates <a href="http://www.baidu.com/" target="_blank" title="模板">testtt</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">template</a></p>
 -->							<div align="center">
 								 <p class="copyright">NFP is supported by a grant from National Nature Science Foundation of China.
								 </p>
								 <p class="copyright">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Copyright © 2015-2016 Beijing Institute of Radiation Medicine</p>
 								</div>

						</div>
						
						
					</div>
					
				</div>
				<!-- /Lower Footer -->
				
			
			</footer>
			<!-- /Footer -->
	</div>

	<jsp:include page="login.jsp"></jsp:include>
	
	<script src="rweb/assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="rweb/assets/js/bootstrap.min.js"></script>	
	<script src="static/js/networksimilarityContact.js"></script>	
		<script src="rweb/js/bootstrap-validator/jqBootstrapValidation.js"></script>
	<script type="text/javascript">
	function startIntro(){
		document.getElementById('pariwiseIframe').contentWindow.startIntro();
	}
	</script>
	

</body>
</html>