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
	    <title>Proton - Admin Template</title>		
		
		<!-- Import google fonts - Heading first/ text second -->
        <link rel='stylesheet' type='text/css' href='http://fonts.useso.com/css?family=Open+Sans:400,700|Droid+Sans:400,700' />
		<!-- Fav and touch icons -->
		<link rel="shortcut icon" href="rweb/assets/ico/favicon.ico" type="image/x-icon" />    
		<script src="rweb/assets/js/jquery-2.1.1.min.js"></script>
	    <!-- Css files -->		<link rel="stylesheet" type="text/css" href="rweb/assets/js/bootstrap-fileupload/bootstrap-fileupload.min.css" />
		<link href="rweb/css/header.css"  type="text/css" rel="stylesheet">	
		<script type="text/javascript" src="rweb/assets/js/bootstrap-fileupload/bootstrap-fileupload.min.js"></script>
	    <link href="rweb/assets/css/bootstrap.min.css" rel="stylesheet">		
		<link href="rweb/assets/css/font-awesome.min.css" rel="stylesheet">
		<link href="rweb/assets/css/climacons-font.css" rel="stylesheet">
	    <link href="rweb/assets/css/style.min.css" rel="stylesheet">
		<link href="rweb/assets/css/style.css" rel="stylesheet" type="text/css">	
		<link href="rweb/css/header.css"  type="text/css" rel="stylesheet">	
		<link href="rweb/css/comment.css" rel="stylesheet">	
		<link href="rweb/js/jquery-datatables/jquery.dataTables.css" type="text/css" rel="stylesheet">
		<style>
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
		</style>
	</head>
</head>

<body style="padding-top: 142px;background: #fff;">
	<div class="container">
		<!-- Header -->
			<header id="header" class="sticky-header" style="opacity: 1;padding:0;">
				
				<!-- Main Header -->
				<div id="main-header" style="height: 80px;">
					<div id="logo" class="col-lg-12 col-md-12 col-sm-12">
							
							<a href="networksimilarityHome"><img src="rweb/assets/img/logo.png" alt="Logo"></a>
							<span style="color:white;font-size:15px;position:absolute;top:30px;">Biomedical network similarity combining interaction
networks and functional annotations</span>
							<span style="position:absolute;right:10;top:6;">
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
						<li>
						
							<a class="fa fa-home" href="networksimilarityHome">Home</a>
							
							
						</li>
						<!-- /home -->
						
						<!-- Events -->
						<li>
						
							<a class="fa fa-puzzle-piece" id="topAnalysis" href="networksimilarityAnalysis">Analysis</a>
							
							<ul>
							
								<li><a href="networksimilarityAnalysis?type=1">Pairwase Alignment</a></li>
								<li><a href="networksimilarityAnalysis?type=2">NetworkFingerPrint</a></li>
								
							</ul>
							
						<div class="dropdown-button"></div></li>
						<!-- /Events -->
						
						<!-- Media -->
						<li>
						
							<a class="fa fa-sort-amount-desc" id="resultNav">Result</a>
							
						</li>
						<!-- /Media -->
						
						
						
						<!-- Get Involved -->
						<li>
							<a class="fa fa-info-circle" href="get-involved.html">Help</a>
						</li>
						<!-- /Get Involved -->
						
						
						
						<!-- Features -->
						<li class="current-menu-item">
						
							<a class="fa fa-list-alt" href="networksimilaritystatistical">Resource</a>
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
						
						
					</ul>
					
					</div>
					
				</div>
				<!-- /Lower Header -->
				
				
			</header>
			<!-- /Header -->
		<section id="content">
				<ol class="breadcrumb" id="breadcrumb" style="margin:10px 0 0 0;">
					<li><i class="fa fa-edit"></i><a>Resource</a></li>
					<li><i class="fa fa-th"></i><span id="analysisName">Statistics of current release</span></li>
				</ol>
				
				<div class="row" style="margin-top: 15px;">
					<div class="col-md-12">
						<div class="panel panel-info">
							<div class="panel-heading">
								<i class="fa fa-random red"></i><strong>System Ref Net:</strong>
							</div>	
							<div class="panel-body" style="padding:0;">
								<table class="table table-bordered table-striped table-condensed table-hover" id="sysTable">
									  <thead>
										  <tr>
											 <th>Avaliable RefNet</th>
											 <th>Type</th>
											 <th>Number</th>
											 <th>Porpularity</th>                                          
										  </tr>
									  </thead>   
									  <tbody>
										
									  </tbody>
								 </table>
							</div>
						</div>
					</div>
					
					<!--<c:choose>
						<c:when test="${sessionScope.username != null}">
							<div class="col-md-12">
								<div class="panel panel-info">
									<div class="panel-heading">
										<i class="fa fa-random red"></i><strong>User Ref Net:</strong>
									</div>	
									<div class="panel-body" style="padding:0;">
										<table class="table table-bordered table-striped table-condensed table-hover" id="userTable">
											  <thead>
												  <tr>
													 <th>Avaliable RefNet</th>
													 <th>Type</th>
													 <th>Number</th>
													 <th>Porpularity</th>                                          
												  </tr>
											  </thead>   
											  <tbody>
												
											  </tbody>
										 </table>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
					-->
					<div class="col-md-12">
						<div class="panel panel-info">
							<div class="panel-heading">
								<h2><i class="fa fa-random red"></i><span class="break"></span><strong>Chart with points</strong></h2>
							</div>
							<div class="panel-body">
								
							</div>
						</div><!--/col-->
					</div>
				</div>
		</section>
	</div>
	
	
	<jsp:include page="login.jsp"></jsp:include>
	<%--<div id="usage" style="padding:0;text-align:center;">
		<div class="title" style="display:inline-block;line-height: 40px;">长沙瀚云信息技术有限公司</div>
		<div class="desc" style="display:inline-block;line-height: 40px;margin-left: 45px;">网络访问量统计</div>
	</div>		
	--%><!-- start: JavaScript-->
	<script src="rweb/assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="rweb/assets/js/bootstrap.min.js"></script>	
	<script type="text/javascript" charset="utf8" src="rweb/js/jquery-datatables/jquery.dataTables.js"></script>
	<!-- end: JavaScript-->
	<script>
		$(document).ready(function(){
			$.ajax({
		 	   type: "POST",
		 	   async: true,
		 	   url: "networkconfusion/showLibraryTable.form",
		 	   success: function(msg){
		 		   console.log(msg);
		 	   }
			});
		});
	</script>
</body>
</html>