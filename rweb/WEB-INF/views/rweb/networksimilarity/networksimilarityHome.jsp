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
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<!-- Favicon -->
		<link rel="shortcut icon" type="image/x-icon" href="rweb/assets/img/favicon.ico">
		<link href="rweb/assets/css/font-awesome.min.css" rel="stylesheet">
		<link href="rweb/assets/css/climacons-font.css" rel="stylesheet">
		<!-- Stylesheets -->
		<link href="rweb/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<link href="rweb/assets/css/fontello.css" rel="stylesheet" type="text/css">
		<link href="rweb/assets/css/flexslider.css" rel="stylesheet" type="text/css">
		
		<link href="rweb/assets/css/owl.carousel.css" rel="stylesheet" type="text/css">
		<link href="rweb/assets/css/style.css" rel="stylesheet" type="text/css">
		<link href="rweb/css/comment.css" rel="stylesheet">	
		<style>
			.btn
			{
				display:inline-block;
				text-transform: none;
				margin-bottom:0;
				font-family:"Helvetica Neue",Helvetica,Tahoma,Arial,sans-serif;
				font-size:14px;
				font-weight:400;
				line-height:1.42857143;
				text-align:center;
				white-space:nowrap;
				vertical-align:middle;
				cursor:pointer;
				-webkit-user-select:none;
				-moz-user-select:none;
				-ms-user-select:none;
				user-select:none;
				background-image:none;
				border:1px solid transparent;
				border-radius:2px;
				-webkit-transition:all .8s cubic-bezier(.175,.885,.32,1);
				-o-transition:all .8s cubic-bezier(.175,.885,.32,1);
				transition:all .8s cubic-bezier(.175,.885,.32,1);
				color:#141414;
				text-shadow:0 1px 0 #fff;
				background-color:#f0f0f0;
				border-color:#ccc;
				padding:6px 12px;
			}
			
			.btn:hover,.btn:focus
			{
				color:#141414;
				text-decoration:none;
			}
			
			.btn:active,.btn.active
			{
				background-image:none;
				outline:0;
				-webkit-box-shadow:inset 0 3px 5px rgba(0,0,0,.125);
				box-shadow:inset 0 3px 5px rgba(0,0,0,.125);
			}
			
			.btn.disabled,.btn[disabled],fieldset[disabled] .btn
			{
				pointer-events:none;
				cursor:not-allowed;
				filter:alpha(opacity=65);
				-webkit-box-shadow:none;
				box-shadow:none;
				opacity:.65;
			}
			
			.btn:hover,.btn:focus,.btn:active,.btn.active,.open .dropdown-toggle.btn
			{
				color:#141414;
				background-color:#dbdbdb;
				-webkit-box-shadow:0 2px 1px rgba(0,0,0,.1);
				box-shadow:0 2px 1px rgba(0,0,0,.1);
				border-color:#9e9e9e;
			}
			
			.btn.disabled,.btn[disabled],fieldset[disabled] .btn,.btn.disabled:hover,.btn[disabled]:hover,fieldset[disabled] .btn:hover,.btn.disabled:focus,.btn[disabled]:focus,fieldset[disabled] .btn:focus,.btn.disabled:active,.btn[disabled]:active,fieldset[disabled] .btn:active,.btn.disabled.active,.btn[disabled].active,fieldset[disabled] .btn.active
			{
				background-color:#f0f0f0;
				border-color:#bdbdbd;
			}
			
			.btn-primary
			{
				color:#fff;
				text-shadow:0 -1px 0 rgba(0,0,0,.2);
				background-color:#1a4f85;
				border-color:#103152;
			}
			
			.btn-primary:hover,.btn-primary:focus,.btn-primary:active,.btn-primary.active,.open .dropdown-toggle.btn-primary
			{
				color:#fff;
				background-color:#133b63;
				-webkit-box-shadow:0 2px 1px rgba(0,0,0,.1);
				box-shadow:0 2px 1px rgba(0,0,0,.1);
				border-color:#0c243c;
			}
			
			.btn-primary.disabled,.btn-primary[disabled],fieldset[disabled] .btn-primary,.btn-primary.disabled:hover,.btn-primary[disabled]:hover,fieldset[disabled] .btn-primary:hover,.btn-primary.disabled:focus,.btn-primary[disabled]:focus,fieldset[disabled] .btn-primary:focus,.btn-primary.disabled:active,.btn-primary[disabled]:active,fieldset[disabled] .btn-primary:active,.btn-primary.disabled.active,.btn-primary[disabled].active,fieldset[disabled] .btn-primary.active
			{
				background-color:#1a4f85;
				border-color:#164270;
			}
			
			.btn-warning
			{
				color:#fff;
				text-shadow:0 -1px 0 rgba(0,0,0,.2);
				background-color:#e48600;
				border-color:#a76200;
			}
			
			.btn-warning:hover,.btn-warning:focus,.btn-warning:active,.btn-warning.active,.open .dropdown-toggle.btn-warning
			{
				color:#fff;
				background-color:#bb6e00;
				-webkit-box-shadow:0 2px 1px rgba(0,0,0,.1);
				box-shadow:0 2px 1px rgba(0,0,0,.1);
				border-color:#8d5300;
			}
			
			.btn-warning.disabled,.btn-warning[disabled],fieldset[disabled] .btn-warning,.btn-warning.disabled:hover,.btn-warning[disabled]:hover,fieldset[disabled] .btn-warning:hover,.btn-warning.disabled:focus,.btn-warning[disabled]:focus,fieldset[disabled] .btn-warning:focus,.btn-warning.disabled:active,.btn-warning[disabled]:active,fieldset[disabled] .btn-warning:active,.btn-warning.disabled.active,.btn-warning[disabled].active,fieldset[disabled] .btn-warning.active
			{
				background-color:#e48600;
				border-color:#cb7700;
			}
			
			.btn-danger
			{
				color:#fff;
				text-shadow:0 -1px 0 rgba(0,0,0,.2);
				background-color:#d2322d;
				border-color:#a02622;
			}
			
			.btn-danger:hover,.btn-danger:focus,.btn-danger:active,.btn-danger.active,.open .dropdown-toggle.btn-danger
			{
				color:#fff;
				background-color:#b02a26;
				-webkit-box-shadow:0 2px 1px rgba(0,0,0,.1);
				box-shadow:0 2px 1px rgba(0,0,0,.1);
				border-color:#8b211e;
			}
			
			.btn-danger.disabled,.btn-danger[disabled],fieldset[disabled] .btn-danger,.btn-danger.disabled:hover,.btn-danger[disabled]:hover,fieldset[disabled] .btn-danger:hover,.btn-danger.disabled:focus,.btn-danger[disabled]:focus,fieldset[disabled] .btn-danger:focus,.btn-danger.disabled:active,.btn-danger[disabled]:active,fieldset[disabled] .btn-danger:active,.btn-danger.disabled.active,.btn-danger[disabled].active,fieldset[disabled] .btn-danger.active
			{
				background-color:#d2322d;
				border-color:#bd2d29;
			}
			
			.btn-success
			{
				color:#fff;
				text-shadow:0 -1px 0 rgba(0,0,0,.2);
				background-color:#229f24;
				border-color:#176d19;
			}
			
			.btn-success:hover,.btn-success:focus,.btn-success:active,.btn-success.active,.open .dropdown-toggle.btn-success
			{
				color:#fff;
				background-color:#1b7d1c;
				-webkit-box-shadow:0 2px 1px rgba(0,0,0,.1);
				box-shadow:0 2px 1px rgba(0,0,0,.1);
				border-color:#135814;
			}
			
			.btn-success.disabled,.btn-success[disabled],fieldset[disabled] .btn-success,.btn-success.disabled:hover,.btn-success[disabled]:hover,fieldset[disabled] .btn-success:hover,.btn-success.disabled:focus,.btn-success[disabled]:focus,fieldset[disabled] .btn-success:focus,.btn-success.disabled:active,.btn-success[disabled]:active,fieldset[disabled] .btn-success:active,.btn-success.disabled.active,.btn-success[disabled].active,fieldset[disabled] .btn-success.active
			{
				background-color:#229f24;
				border-color:#1e8a1f;
			}
			
			.btn-info
			{
				color:#fff;
				text-shadow:0 -1px 0 rgba(0,0,0,.2);
				background-color:#39b3d7;
				border-color:#238faf;
			}
			
			.btn-info:hover,.btn-info:focus,.btn-info:active,.btn-info.active,.open .dropdown-toggle.btn-info
			{
				color:#fff;
				background-color:#279dc0;
				-webkit-box-shadow:0 2px 1px rgba(0,0,0,.1);
				box-shadow:0 2px 1px rgba(0,0,0,.1);
				border-color:#1f7e9a;
			}
			
			.btn-info.disabled,.btn-info[disabled],fieldset[disabled] .btn-info,.btn-info.disabled:hover,.btn-info[disabled]:hover,fieldset[disabled] .btn-info:hover,.btn-info.disabled:focus,.btn-info[disabled]:focus,fieldset[disabled] .btn-info:focus,.btn-info.disabled:active,.btn-info[disabled]:active,fieldset[disabled] .btn-info:active,.btn-info.disabled.active,.btn-info[disabled].active,fieldset[disabled] .btn-info.active
			{
				background-color:#39b3d7;
				border-color:#29a8cd;
			}
			
			.btn-link
			{
				font-weight:400;
				color:#03c;
				text-shadow:none;
				cursor:pointer;
				background:0;
				-webkit-box-shadow:none;
				box-shadow:none;
			}
			
			.btn-link,.btn-link:active,.btn-link[disabled],fieldset[disabled] .btn-link,.btn-link:hover,.btn-link:focus
			{
				-webkit-box-shadow:none;
				box-shadow:none;
				border-color:transparent;
			}
			
			.btn-link[disabled]:hover,fieldset[disabled] .btn-link:hover,.btn-link[disabled]:focus,fieldset[disabled] .btn-link:focus
			{
				color:#ddd;
				text-decoration:none;
			}
			
			.btn-xs,.btn-mini
			{
				padding:1px 5px;
			}
			
			.btn-block
			{
				display:block;
				width:100%;
				padding-right:0;
				padding-left:0;
			}
			
			.btn-lg .caret
			{
				border-width:5px 5px 0;
			}
			
			.dropup .btn-lg .caret
			{
				border-width:0 5px 5px;
			}
			
			.btn-default .caret
			{
				border-top-color:#141414;
			}
			
			.dropup .btn-default .caret
			{
				border-bottom-color:#141414;
			}
			
			.dropup .btn-primary .caret,.dropup .btn-success .caret,.dropup .btn-warning .caret,.dropup .btn-danger .caret,.dropup .btn-info .caret
			{
				border-bottom-color:#fff;
			}
			
			.btn-group,.btn-group-vertical
			{
				position:relative;
				display:inline-block;
				vertical-align:middle;
			}
			
			.btn-group>.btn,.btn-group-vertical>.btn
			{
				position:relative;
				float:left;
			}
			
			.btn-toolbar>.btn+.btn,.btn-toolbar>.btn-group+.btn,.btn-toolbar>.btn+.btn-group,.btn-toolbar>.btn-group+.btn-group
			{
				margin-left:5px;
			}
			
			.btn-group-xs>.btn
			{
				font-size:12px;
				line-height:1.5;
				border-radius:2px;
				padding:1px 5px;
			}
			
			.btn-group>.btn+.dropdown-toggle
			{
				padding-right:8px;
				padding-left:8px;
			}
			
			.btn-group>.btn-lg+.dropdown-toggle
			{
				padding-right:12px;
				padding-left:12px;
			}
			
			.btn-group.open .dropdown-toggle
			{
				-webkit-box-shadow:inset 0 3px 5px rgba(0,0,0,.125);
				box-shadow:inset 0 3px 5px rgba(0,0,0,.125);
			}
			
			.btn-group-vertical>.btn,.btn-group-vertical>.btn-group
			{
				display:block;
				float:none;
				width:100%;
				max-width:100%;
			}
			
			.btn-group-vertical>.btn+.btn,.btn-group-vertical>.btn+.btn-group,.btn-group-vertical>.btn-group+.btn,.btn-group-vertical>.btn-group+.btn-group
			{
				margin-top:-1px;
				margin-left:0;
			}
			
			.btn-group-vertical>.btn:first-child:not(:last-child)
			{
				border-top-right-radius:2px;
				border-bottom-right-radius:0;
				border-bottom-left-radius:0;
			}
			
			.btn-group-vertical>.btn:last-child:not(:first-child)
			{
				border-top-left-radius:0;
				border-top-right-radius:0;
				border-bottom-left-radius:2px;
			}
			
			.btn-group-vertical>.btn-group:first-child>.btn:last-child,.btn-group-vertical>.btn-group:first-child>.dropdown-toggle
			{
				border-bottom-right-radius:0;
				border-bottom-left-radius:0;
			}
			
			.btn-group-vertical>.btn-group:last-child>.btn:first-child
			{
				border-top-left-radius:0;
				border-top-right-radius:0;
			}
			@media (min-width: 768px){
				#header {
					width: 750px;
				}
			}
			@media (min-width: 992px){
				#header {
					width: 970px;
				}
			}
			@media (min-width: 1200px){
				#header {
					width: 1170px;
				}
			}
			#logo{
				padding-left: 0;
			}
			#header {
				margin:0 auto;
			}
			#header.sticky-header .container{
				padding:0 10px;
			}
		</style>
		
		<!-- jQuery -->
		<script src="rweb/assets/js/jquery-2.1.1.min.js"></script>
  </head>
  
 <body class="sticky-header-on tablet-sticky-header" style="padding-bottom:0;">
	
	<div id="fb-root"></div>

		<!-- Container -->
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
						<li class="current-menu-item">
						
							<a class="fa fa-home" href="networksimilarityHome">Home</a>
							
							
						</li>
						<!-- /home -->
						
						<!-- Events -->
						<li>
						
							<a class="fa fa-puzzle-piece" href="networksimilarityAnalysis">Analysis</a>
							
							<ul>
							
								<li><a href="networksimilarityAnalysis?type=1">Pairwase Alignment</a></li>
								<li><a href="networksimilarityAnalysis?type=2">NetworkFingerPrint</a></li>
								
							</ul>
							
						<div class="dropdown-button"></div></li>
						<!-- /Events -->
						
						<!-- Media -->
						<li>
						
							<span class="fa fa-sort-amount-desc">Result</span>
							
							
						</li>
						<!-- /Media -->
						
						
						
						<!-- Get Involved -->
						<li>
							<a class="fa  fa-info-circle" href="get-involved.html">Help</a>
						</li>
						<!-- /Get Involved -->
						
						
						
						<!-- Features -->
						<li>
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
			
			<!-- Section -->
			<section class="section full-width-bg" style="padding-top:20px">
				<div class="row">
				
					<div class="col-lg-9 col-md-9 col-sm-8">
						<h4 class="post-title"><a href="blog-single-sidebar.html">Welcome to EHFPI!</a></h4>
						<div class="intro">
			                <p><b>EHFPI</b>, a database of Essential Host Factors (EHFs) for Pathogenic Infections. This database
			                    focuses on the collection and functional analysis of a specialized class of host cellular genes
			                    identified from (genome-wide) RNA interface (RNAi) screens. Notably, the knockdown effect of these
			                    genes greatly influences the infection of a pathogen (e.g., inhibit or increase infection) but not
			                    the viability of the host cells, thus designated as essential host factors (EHFs) for pathogenic
			                    infections.</p>
			
			                <p>
			                    Currently, EHFPI contains detailed article, screen, and annotation information for a total of 4634
			                    manually curated EHF genes, with phenotypes validated in Drosophila and Homo sapiens for 25
			                    clinically important pathogen types. Besides the widest coverage, EHFPI also provides as many as six
			                    powerful analysis tools with graphic demonstrations, i.e.,
			                    <a href="/ehfpi/analysis/overlap/overlapNetwork" target="_blank">EHF-pathogen network analysis</a>,
			                    <a href="/ehfpi/analysis/overlap/" target="_blank">EHF overlap analysis</a>,
			                    <a href="/ehfpi/analysis/gea/" target="_blank">gene enrichment analysis</a>,
			                    <a href="/ehfpi/analysis/pip/" target="_blank">pathogen interacting protein (PIP) analysis</a>,
			                    <a href="/ehfpi/analysis/drug/" target="_blank">drug target analysis</a>,
			                    and <a href="/ehfpi/analysis/gwas/" target="_blank">genome-wide association study (GWAS)
			                    candidate gene analysis</a>.</p>
			
			                <p>You can also <a href="/ehfpi/about/submit/" target="_blank">submit</a> EHF data to our website.
			                    Feel free to <a href="/ehfpi/about/contact/" target="_blank">contact us</a>
			                    if you have any question!</p>
			
			            </div>
						<!-- Main Slider -->
						<div class="flexslider main-flexslider" style="opacity: 1;padding:5px;">
							
							
							
						<div class="flex-viewport" style="overflow: hidden; position: relative;"><ul class="slides" style="width: 1000%; transition-duration: 0s; transform: translate3d(-698px, 0px, 0px);"><li id="main_flex_3" class="clone" aria-hidden="true" style="float: left; display: block; width: 698px;">
								
									<div class="slide align-right">
										<h2>10 YEARS OF EXPERIENCE</h2>
										<p>Mauris fermentum dictum magna. Sed laoreet aliquam leo. Ut tellus dolor,<br> dapibus eget, elementum vel, cursus eleifend, elit. </p>
										<a href="#" class="button big button-arrow">More Info</a>
									</div>
									
								</li>
								
								<li id="main_flex_1" class="flex-active-slide" style="float: left; display: block; width: 698px;">
									
									<div class="slide align-left">
										<h2>Unity<br>
										Liberty<br>
										Solidarity</h2>
										<a href="#" class="button big button-arrow">Find out more</a>
									</div>
									
								</li>
								
								<li id="main_flex_2" class="" style="float: left; display: block; width: 698px;">
								
									<div class="slide align-center">
										<h4 class="great-vibes">it’s time for changes</h4>
										<h2>Building Our Future Together!</h2>
										<a href="#" class="button big button-arrow">Get Involved</a>
									</div>
									
								</li>
								
								<li id="main_flex_3" class="" style="float: left; display: block; width: 698px;">
								
									<div class="slide align-right">
										<h2>10 YEARS OF EXPERIENCE</h2>
										<p>Mauris fermentum dictum magna. Sed laoreet aliquam leo. Ut tellus dolor,<br> dapibus eget, elementum vel, cursus eleifend, elit. </p>
										<a href="#" class="button big button-arrow">More Info</a>
									</div>
									
								</li>
								
							<li id="main_flex_1" class="clone" aria-hidden="true" style="float: left; display: block; width: 698px;">
									
									<div class="slide align-left">
										<h2>Unity<br>
										Liberty<br>
										Solidarity</h2>
										<a href="#" class="button big button-arrow">Find out more</a>
									</div>
									
								</li></ul></div><ul class="flex-direction-nav"><li><a class="flex-prev" href="#"></a></li><li><a class="flex-next" href="#"></a></li></ul></div>	
						<!-- /Main Slider -->
						
					</div>
					
					
					<div class="col-lg-3 col-md-3 col-sm-4 sidebar" style="padding-right:15px;">
						<!-- Upcoming Events -->
						<div class="sidebar-box white" style="opacity: 1;">
							<h3>News</h3>
							<ul class="upcoming-events">
							
								<!-- Event -->
								<li>
									<div class="date">
										<span>
											<span class="day">25</span>
											<span class="month">DEC</span>
										</span>
									</div>
									
									<div class="event-content">
										<h6><a href="event-post-v2.html">Sed in lacus ut enim</a></h6>
										<ul class="event-meta">
											<li><i class="icons icon-clock"></i> 4:00 pm - 6:00 pm</li>
											<li><i class="icons icon-location"></i> 340 W 50th St.New York</li>
										</ul>
									</div>
								</li>
								<!-- /Event -->
								
								<!-- Event -->
								<li>
									<div class="date">
										<span>
											<span class="day">5</span>
											<span class="month">JAN</span>
										</span>
									</div>
									
									<div class="event-content">
										<h6><a href="event-post-v2.html">Sed in lacus ut enim</a></h6>
										<ul class="event-meta">
											<li><i class="icons icon-clock"></i> 4:00 pm - 6:00 pm</li>
											<li><i class="icons icon-location"></i> 340 W 50th St.New York</li>
										</ul>
									</div>
								</li>
								<!-- /Event -->
								
								<!-- Event -->
								<li>
									<div class="date">
										<span>
											<span class="day">8</span>
											<span class="month">JAN</span>
										</span>
									</div>
									
									<div class="event-content">
										<h6><a href="event-post-v2.html">Sed in lacus ut enim</a></h6>
										<ul class="event-meta">
											<li><i class="icons icon-clock"></i> 4:00 pm - 6:00 pm</li>
											<li><i class="icons icon-location"></i> 340 W 50th St.New York</li>
										</ul>
									</div>
								</li>
								<!-- /Event -->
								
							</ul>
							<a href="#" class="button transparent button-arrow">More events</a>
						</div>
						<!-- Featured Video -->
						<div class="sidebar-box white featured-video" style="opacity: 1;">
							<h3>Current Release</h3>
							<p style="padding-left: 20px;color: red;">EHFPI2014_09, released September 30th, 2014.</p>
							
						</div>
						<!-- /Featured Video -->
						<!-- Featured Video -->
						<div class="sidebar-box white featured-video" style="opacity: 1;">
							<h3>Contact</h3>
							<p style="padding-left: 20px;">If you have any questions, please <a href="/ehfpi/about/contact/" target="_blank">contact</a> us!</p>
							
						</div>
						<!-- /Featured Video -->
						<!-- Featured Video -->
						<div class="sidebar-box white featured-video" style="opacity: 1;">
							<h3>Statistics</h3>
							
							
						</div>
						<!-- /Featured Video -->			
					</div>
				
				</div>
				
			</section>
			<!-- /Section -->
			
			
			
			
			
		</section>



			
			<!-- Footer -->
			<footer id="footer">	
				<!-- Lower Footer -->
				<div id="lower-footer">
					
					<div class="row">
						
						<div class="col-lg-4 col-md-4 col-sm-4" style="opacity: 1;">
						
							<p class="copyright">© 2014 Candidate. All Rights Reserved.More Templates <a href="http://www.baidu.com/" target="_blank" title="模板">testtt</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">template</a></p>
							
						</div>
						
						<div class="col-lg-8 col-md-8 col-sm-8" style="opacity: 1;">
							
							<div class="social-media">
								<ul class="social-icons" style="margin-top:10px;">
									<li class="facebook"><a href="#" class="tooltip-ontop" title="" data-original-title="Facebook"><i class="icons icon-facebook"></i></a></li>
									<li class="twitter"><a href="#" class="tooltip-ontop" title="" data-original-title="Twitter"><i class="icons icon-twitter"></i></a></li>
									<li class="google"><a href="#" class="tooltip-ontop" title="" data-original-title="Google Plus"><i class="icons icon-gplus"></i></a></li>
									<li class="youtube"><a href="#" class="tooltip-ontop" title="" data-original-title="Youtube"><i class="icons icon-youtube-1"></i></a></li>
									<li class="flickr"><a href="#" class="tooltip-ontop" title="" data-original-title="Flickr"><i class="icons icon-flickr-4"></i></a></li>
									<li class="email"><a href="#" class="tooltip-ontop" title="" data-original-title="Email"><i class="icons icon-mail"></i></a></li>
								</ul>
								<ul class="social-buttons">
									<li>
										
									</li>
									<li>
										<div class="fb-share-button fb_iframe_widget" data-href="https://developers.facebook.com/docs/plugins/" data-type="button_count" fb-xfbml-state="rendered" fb-iframe-plugin-query="app_id=&amp;container_width=0&amp;href=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&amp;locale=en_US&amp;sdk=joey&amp;type=button_count"><span style="vertical-align: top; width: 0px; height: 0px; overflow: hidden;"><iframe name="f22cb15388" width="1000px" height="1000px" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" title="fb:share_button Facebook Social Plugin" src="http://www.facebook.com/plugins/share_button.php?app_id=&amp;channel=http%3A%2F%2Fstatic.ak.facebook.com%2Fconnect%2Fxd_arbiter%2F44OwK74u0Ie.js%3Fversion%3D41%23cb%3Df33b497b24%26domain%3Ddemo.cssmoban.com%26origin%3Dhttp%253A%252F%252Fdemo.cssmoban.com%252Ff24389cf2c%26relation%3Dparent.parent&amp;container_width=0&amp;href=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&amp;locale=en_US&amp;sdk=joey&amp;type=button_count" style="border: none; visibility: visible; width: 0px; height: 0px;"></iframe></span></div>
									</li>
									
								</ul>
							</div>
							
						</div>
						
					</div>
					
				</div>
				<!-- /Lower Footer -->
				
			
			</footer>
			<!-- /Footer -->
			
			
			
			<!-- Back To Top -->
			<a href="#" id="button-to-top" style="display: none;"><i class="icons icon-up-dir"></i></a>
		
		</div>
		<jsp:include page="login.jsp"></jsp:include>
		<!-- /Container -->	
	
		<!-- JavaScript -->
		
		<!-- Bootstrap -->
		<script type="text/javascript" src="rweb/assets/js/bootstrap.min.js"></script>
		
		<!-- Modernizr -->
		<script type="text/javascript" src="rweb/assets/js/modernizr.js"></script>
		
		<!-- Sliders/Carousels -->
		<script type="text/javascript" src="rweb/assets/js/jquery.flexslider-min.js"></script>
		<script type="text/javascript" src="rweb/assets/js/owl.carousel.min.js"></script>
		

		
		<!-- Main Script -->
		<script type="text/javascript" src="rweb/assets/js/script.js"></script>
		
		
		<!--[if lt IE 9]>
			<script type="text/javascript" src="rweb/assets/js/jquery.placeholder.js"></script>
			<script type="text/javascript" src="rweb/assets/js/script_ie.js"></script>
		<![endif]-->
		
		
	</body>
</html>


