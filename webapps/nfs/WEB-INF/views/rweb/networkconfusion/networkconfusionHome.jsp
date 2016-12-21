<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>Cloud Admin | Dashboard</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" type="text/css" href="rweb/css/cloud-admin.css">
<link rel="stylesheet" type="text/css" href="rweb/css/themes/default.css"
	id="skin-switcher">
<link rel="stylesheet" type="text/css" href="rweb/css/responsive.css">
<!-- STYLESHEETS -->
<!--[if lt IE 9]><script src="js/flot/excanvas.min.js"></script><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script><![endif]-->
<link href="rweb/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<!-- ANIMATE -->
<link rel="stylesheet" type="text/css"
	href="rweb/css/animatecss/animate.min.css" />
<!-- DATE RANGE PICKER -->
<link rel="stylesheet" type="text/css"
	href="rweb/js/bootstrap-daterangepicker/daterangepicker-bs3.css" />
<!-- TODO -->
<link rel="stylesheet" type="text/css"
	href="rweb/js/jquery-todo/css/styles.css" />
<!-- FULL CALENDAR -->
<link rel="stylesheet" type="text/css"
	href="rweb/js/fullcalendar/fullcalendar.min.css" />
<!-- GRITTER -->
<link rel="stylesheet" type="text/css"
	href="rweb/js/gritter/css/jquery.gritter.css" />
<!-- FONTS -->
<link href='http://fonts.useso.com/css?family=Open+Sans:300,400,600,700'
	rel='stylesheet' type='text/css'>
<!-- JQUERY -->
<script src="rweb/js/jquery/jquery-2.0.3.min.js"></script>
</head>
<body>
	<!-- HEADER -->
	<header class="navbar clearfix" id="header">
		<div class="container">
			<!-- Logo Begin -->
			<div class="navbar-brand">
				<!-- COMPANY LOGO -->
				<a href="networkconfusion" style="color:white;"> 
					<!-- <img src="img/logo/logo.png" alt="Cloud Admin Logo" class="img-responsive" height="30" width="120" />  -->
					<strong>NFA &nbsp;&nbsp;&nbsp;Network Fusion Analysis</strong>
				</a>
				<!-- /COMPANY LOGO -->

			</div>
			<!-- Logo End -->

			<!-- NAVBAR LEFT -->
			<ul class="nav navbar-nav pull-left hidden-xs" id="navbar-left">
				<li class="dropdown"><a href="networkconfusion" class="dropdown-toggle"
					data-toggle="dropdown"> <span class="name">Home</span>
				</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> <i class="fa fa-cog"></i> <span
						class="name">Analysis</span> <i class="fa fa-angle-down"></i>
				</a>
					<ul class="dropdown-menu skins">
						<li><a href="networkconfusionSNF">SNF</a></li>
						<li><a href="">iCluster</a></li>
						<li><a href="">concatenation</a></li>
						<li><a href="">PSDF</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> <i class="fa fa-cog"></i> <span
						class="name">Manual</span> <i class="fa fa-angle-down"></i>
				</a>
					<ul class="dropdown-menu skins">
						<li><a href="">pdf</a></li>
						<li><a href="">html</a></li>
						<li><a href="">vedio</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> <i class="fa fa-cog"></i> <span
						class="name">About</span> <i class="fa fa-angle-down"></i>
				</a>
					<ul class="dropdown-menu skins">
						<li><a href="">Extended Link</a></li>
						<li><a href="">Copyright</a></li>
						<li><a href="">Last Update</a></li>
					</ul></li>
			</ul>
			<!-- /NAVBAR LEFT -->

			<!-- BEGIN TOP NAVIGATION MENU -->
			<ul class="nav navbar-nav pull-right">
				<!-- BEGIN TODO DROPDOWN -->
				<li class="dropdown" id="header-tasks"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <i>Start
							you tour</i>
				</a></li>
				<!-- END TODO DROPDOWN -->
				
			</ul>
			<!-- END TOP NAVIGATION MENU -->

		</div>
	</header>
	<!--/HEADER -->

	<!-- PAGE -->
	<section id="page">
		<!-- SIDEBAR -->
		<div id="sidebar" class="sidebar mini-menu">
			<div class="sidebar-menu nav-collapse">
				<div class="divide-20"></div>

				<!-- SIDEBAR MENU -->
			<!--  	<ul>
					<li class="active"><a href="index.html"> <i
							class="fa fa-tachometer fa-fw"></i> <span class="menu-text">Dashboard</span>
							<span class="selected"></span>
					</a></li>

					<li><a class="" href="widgets_box.html"> <i
							class="fa fa-th-large fa-fw"></i> <span class="menu-text">Widgets
								& Box</span>
					</a></li>

					<li><a class="" href="#"> <i class="fa fa-th-large fa-fw"></i>
							<span class="menu-text">Widgets & Box</span>
					</a></li>

					<li><a class="" href="#"> <i class="fa fa-th-large fa-fw"></i>
							<span class="menu-text">Widgets & Box</span>
					</a></li>

					<li><a class="" href="#"> <i class="fa fa-th-large fa-fw"></i>
							<span class="menu-text">Widgets & Box</span>
					</a></li>

				</ul>
				-->
				
				<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-55d2e2c5ed7c36ef" async="async"></script>
				
				<!-- /SIDEBAR MENU -->

			</div>
		</div>
		<!-- /SIDEBAR -->

		<div id="main-content" style="margin-left:50px !important">
			<div class="container">
				<div class="row">
					<div id="content" class="col-lg-12">
						
						<!-- PAGE CONTENT -->
						<div class="row" style="min-height:800px;">
							<div class="col-sm-12">
								<ul id="myTab" class="nav nav-tabs" style="margin: 15px 0px;">
									<li class="active">
										<a href="#overview" data-toggle="tab">OverView</a>
									</li>
									<li><a href="#news" data-toggle="tab">News</a></li>
									<li><a href="#contact" data-toggle="tab">Contact</a></li>
								</ul>
								<div id="myTabContent" class="tab-content" style="margin-top:15px;">
									<div class="tab-pane fade in active" id="overview">
										<p>
											Tutorials Point is a place for beginners in all technical
											areas. This website covers most of the latest technoligies
											and explains each of the technology with simple examples. You
											also have a <b>tryit</b> editor, wherein you can edit your
											code and try out different possibilities of the examples.
											Tutorials Point is a place for beginners in all technical
											areas. This website covers most of the latest technoligies
											and explains each of the technology with simple examples. You
											also have a <b>tryit</b> editor, wherein you can edit your
											code and try out different possibilities of the examples.
											Tutorials Point is a place for beginners in all technical
											areas. This website covers most of the latest technoligies
											and explains each of the technology with simple examples. You
											also have a <b>tryit</b> editor, wherein you can edit your
											code and try out different possibilities of the examples.
											Tutorials Point is a place for beginners in all technical
											areas. This website covers most of the latest technoligies
											and explains each of the technology with simple examples. You
											also have a <b>tryit</b> editor, wherein you can edit your
											code and try out different possibilities of the examples.
										</p>
									</div>
									<div class="tab-pane fade" id="news">
										<p>iOS is a mobile operating system developed and
											distributed by Apple Inc. Originally released in 2007 for the
											iPhone, iPod Touch, and Apple TV. iOS is derived from OS X,
											with which it shares the Darwin foundation. iOS is Apple's
											mobile version of the OS X operating system used on Apple
											computers.</p>
											<p>iOS is a mobile operating system developed and
											distributed by Apple Inc. Originally released in 2007 for the
											iPhone, iPod Touch, and Apple TV. iOS is derived from OS X,
											with which it shares the Darwin foundation. iOS is Apple's
											mobile version of the OS X operating system used on Apple
											computers.</p>
											<p>iOS is a mobile operating system developed and
											distributed by Apple Inc. Originally released in 2007 for the
											iPhone, iPod Touch, and Apple TV. iOS is derived from OS X,
											with which it shares the Darwin foundation. iOS is Apple's
											mobile version of the OS X operating system used on Apple
											computers.</p>
											<p>iOS is a mobile operating system developed and
											distributed by Apple Inc. Originally released in 2007 for the
											iPhone, iPod Touch, and Apple TV. iOS is derived from OS X,
											with which it shares the Darwin foundation. iOS is Apple's
											mobile version of the OS X operating system used on Apple
											computers.</p>
									</div>
									<div class="tab-pane fade" id="contact">
										<p>jMeter is an Open Source testing software. It is 100%
											pure Java application for load and performance testing.</p>
											<p>iOS is a mobile operating system developed and
											distributed by Apple Inc. Originally released in 2007 for the
											iPhone, iPod Touch, and Apple TV. iOS is derived from OS X,
											with which it shares the Darwin foundation. iOS is Apple's
											mobile version of the OS X operating system used on Apple
											computers.</p>
											<p>iOS is a mobile operating system developed and
											distributed by Apple Inc. Originally released in 2007 for the
											iPhone, iPod Touch, and Apple TV. iOS is derived from OS X,
											with which it shares the Darwin foundation. iOS is Apple's
											mobile version of the OS X operating system used on Apple
											computers.</p>
											<p>iOS is a mobile operating system developed and
											distributed by Apple Inc. Originally released in 2007 for the
											iPhone, iPod Touch, and Apple TV. iOS is derived from OS X,
											with which it shares the Darwin foundation. iOS is Apple's
											mobile version of the OS X operating system used on Apple
											computers.</p>
											<p>iOS is a mobile operating system developed and
											distributed by Apple Inc. Originally released in 2007 for the
											iPhone, iPod Touch, and Apple TV. iOS is derived from OS X,
											with which it shares the Darwin foundation. iOS is Apple's
											mobile version of the OS X operating system used on Apple
											computers.</p>
									</div>
								</div>
								<script>
									$(function() {
										$('#myTab li:eq(1) a').tab('show');
									});
								</script>

							</div>
						</div>
						<!-- /PAGE CONTENT -->

						<!-- PAGE FOOTER -->
						<div class="footer-tools">
							<span class="go-top"> Copyright @ 长沙瀚云科技有限公司 <i
								style="margin-left:30px; float:right;">当前访问人数：————人</i> <i
								class="fa fa-chevron-up"></i> Top
							</span>
						</div>
						<!-- /PAGE FOOTER -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/PAGE -->
	<!-- JAVASCRIPTS -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- JQUERY UI-->
	<script
		src="rweb/js/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
	<!-- BOOTSTRAP -->
	<script src="rweb/bootstrap-dist/js/bootstrap.min.js"></script>


	<!-- DATE RANGE PICKER -->
	<script src="rweb/js/bootstrap-daterangepicker/moment.min.js"></script>

	<script src="rweb/js/bootstrap-daterangepicker/daterangepicker.min.js"></script>
	<!-- SLIMSCROLL -->
	<script type="text/javascript"
		src="rweb/js/jQuery-slimScroll-1.3.0/jquery.slimscroll.min.js"></script>
	<!-- SLIMSCROLL -->
	<script type="text/javascript"
		src="rweb/js/jQuery-slimScroll-1.3.0/jquery.slimscroll.min.js"></script>
	<script type="text/javascript"
		src="rweb/js/jQuery-slimScroll-1.3.0/slimScrollHorizontal.min.js"></script>
	<!-- BLOCK UI -->
	<script type="text/javascript"
		src="rweb/js/jQuery-BlockUI/jquery.blockUI.min.js"></script>
	<!-- SPARKLINES -->
	<script type="text/javascript"
		src="rweb/js/sparklines/jquery.sparkline.min.js"></script>
	<!-- COOKIE -->
	<script type="text/javascript"
		src="rweb/js/jQuery-Cookie/jquery.cookie.min.js"></script>
	<!-- GRITTER -->
	<script type="text/javascript"
		src="rweb/js/gritter/js/jquery.gritter.min.js"></script>
	<!-- CUSTOM SCRIPT -->
		
</body>
</html>
