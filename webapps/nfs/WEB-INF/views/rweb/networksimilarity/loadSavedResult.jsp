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
					<div id="logo" class="col-lg-3 col-md-3 col-sm-3">
							
							<a href="networksimilarityHome"><img src="rweb/assets/img/logo.png" alt="Logo"></a>
							
					</div>
					<div class="col-md-9" style="text-align: right;padding-top:5px;">
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
						
							<a href="networksimilarityHome">Home</a>
							
							
						</li>
						<!-- /home -->
						
						<!-- Events -->
						<li>
						
							<a id="topAnalysis" href="networksimilarityAnalysis">Analysis</a>
							
							<ul>
							
								<li><a href="networksimilarityAnalysis?type=1">Pairwase Alignment</a></li>
								<li><a href="networksimilarityAnalysis?type=2">NetworkFingerPrint</a></li>
								
							</ul>
							
						<div class="dropdown-button"></div></li>
						<!-- /Events -->
						
						<!-- Media -->
						<li class="current-menu-item">
						
							<a id="resultNav">Result</a>
							
						</li>
						<!-- /Media -->
						
						
						
						<!-- Get Involved -->
						<li>
							<a href="get-involved.html">Help</a>
						</li>
						<!-- /Get Involved -->
						
						
						
						<!-- Features -->
						<li>
						
							<a href="networksimilaritystatistical">Resource</a>
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
			<!-- /Header networksimilarityResult -->
		<section id="content">
				<iframe width="100%" onload="iFrameHeight('resultIframe')" scrolling="no" frameborder="no" border="0" id="resultIframe"></iframe>
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
	<!-- end: JavaScript-->
	
	<script type="text/javascript">
		var ID = '<%=request.getParameter("id")%>';
		$(document).ready(function(){
			$.ajax({
			 	   type: "POST",
			 	   async: true,
			 	   url: "networkconfusion/getProjectInfoById.form",
			 	   data: {id:ID},
			 	   success: function(msg){
			 		    var data = msg.data;
			 		  	$('#resultNav', window.parent.document).attr("jobtitle",data[0]);
						$('#resultNav', window.parent.document).attr("type",data[2]);
						$('#resultNav', window.parent.document).attr("email",data[4]);
						$('#resultNav', window.parent.document).attr("num",data[3]);
						$("#resultIframe").attr("src","networksimilarityResult");
			 	   }
			});
		});
		function iFrameHeight(id) {
			$("body").scrollTop(0);
		    var ifm = document.getElementById(id);
		    var subWeb = document.frames ? document.frames["iframe"].document : ifm.contentDocument;
		    if (ifm != null && subWeb != null) {
		         ifm.height = subWeb.body.scrollHeight;
		    }
		}
	</script>
</body>
</html>