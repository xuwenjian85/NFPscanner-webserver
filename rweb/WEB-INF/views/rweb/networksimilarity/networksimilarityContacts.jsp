<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
		<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
		
		<!-- Stylesheets -->
		<link href="rweb/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<link href="rweb/assets/css/fontello.css" rel="stylesheet" type="text/css">
		<link href="rweb/assets/css/flexslider.css" rel="stylesheet" type="text/css">
		
		<link href="rweb/assets/css/owl.carousel.css" rel="stylesheet" type="text/css">

		<link href="rweb/assets/css/style.css" rel="stylesheet" type="text/css">
		
		<link href="rweb/css/header.css" rel="stylesheet" type="text/css">
		
		<!-- jQuery -->
		<script src="rweb/assets/js/jquery-2.1.1.min.js"></script>
  </head>
  
 <body class="sticky-header-on tablet-sticky-header" style="padding-bottom:0;">
	
	<div id="fb-root"></div>
	<header id="header">
		<div id="topbar">
			<div class="pull-right" id="topnav">
				<a target="" class="about iframe" data-width="900" data-headerless="true" data-class="modal-about">登陆</a>
				<a target="" class="about iframe" data-width="900" data-headerless="true" data-class="modal-about">注册</a>
			</div>
			<h5 id="companyname" style="font-size:15px;">
			 Gene network similarity   </h5>
	  </div>
	  <nav id="mainmenu">
				<ul class="nav">
					<li  class="active"><a href="networksimilarityHome" id="menumy"><i class="fa fa-home"></i><span> Home</span></a></li>
					<li><a href="networksimilarityAnalysis"  class="active" id="menuproduct">Analysis</a></li>
					<li><a href="networksimilarityResult" id="menuproject">Results</a></li>
					<li><a href="networksimilarityHelp" id="menuqa">Help</a></li>
				</ul>
			  </nav>
			  <nav id="modulemenu">
					<ul class="nav">
						<li class=" active"><a href="networksimilarityHome" target="" id="submenuindex">Introduction</a>
						</li>
						<li class=" "><a href="networksimilarityNews" target="" id="submenutodo">News</a>
						</li>
						<li class=" "><a href="networksimilarityContacts" target="" id="submenutask">Contacts</a>
						</li>
						<li class=" "><a href="networksimilarityCopyright" target="" id="sss">Copyright</a>
						</li>
					</ul>
			  </nav>
	</header>
		<!-- Container -->
		<div class="container">

		<section id="content">			
			<!-- Section -->
			<section class="section full-width-bg gray-bg">
				
				<div class="row">
				
					<div class="col-lg-12 col-md-12 col-sm-12">
						
						<h3 class="animate-onscroll no-margin-top">Latest Introduction</h3>
						
												<!-- Blog Post -->
						<div class="blog-post big animate-onscroll">
							
							
							
							<h4 class="post-title"><a href="blog-single-sidebar.html">Nam elit agna, endrerit sit amet, tincidunt ac, viverra sed</a></h4>
							
							<div class="post-meta">
								<span>by <a href="#">admin</a></span>
								<span>October 01, 2013 11:28AM</span>
							</div>
							
							<p>Ut tellus dolor, dapibus eget, elementum vel, cursus eleifend, elit. Aenean auctor wisi et urna. Aliquam erat volutpat. Duis ac turpis. Integer rutrum ante eu lacus.</p>
							
							<a href="blog-single-sidebar.html" class="button read-more-button big button-arrow">Read More</a>
							
						</div>
						<!-- /Blog Post -->								
					</div>			
				</div>
				<div class="row">
				
					<div class="col-lg-12 col-md-12 col-sm-12">
						
						<!-- Main Slider -->
						<div class="flexslider main-flexslider animate-onscroll">
							
							<ul class="slides">
								
								<li id="main_flex_1">
									
									<div class="slide align-left">
										<h2>Unity<br>
										Liberty<br>
										Solidarity</h2>
										<a href="#" class="button big button-arrow">Find out more</a>
									</div>
									
								</li>
								
								<li id="main_flex_2">
								
									<div class="slide align-center">
										<h4 class="great-vibes">it’s time for changes</h4>
										<h2>Building Our Future Together!</h2>
										<a href="#" class="button big button-arrow">Get Involved</a>
									</div>
									
								</li>
								
								<li id="main_flex_3">
								
									<div class="slide align-right">
										<h2>10 YEARS OF EXPERIENCE</h2>
										<p>Mauris fermentum dictum magna. Sed laoreet aliquam leo. Ut tellus dolor,<br> dapibus eget, elementum vel, cursus eleifend, elit. </p>
										<a href="#" class="button big button-arrow">More Info</a>
									</div>
									
								</li>
								
							</ul>
							
						</div>	
						<!-- /Main Slider -->
						
					</div>
				
				</div>
			</section>
			<!-- /Section -->
		
		</section>



			
			<!-- Footer -->
			<footer id="">
				
				
				
				
				
				<!-- Lower Footer -->
				<div id="lower-footer">
					
					<div class="row">
						
						<div class="col-lg-4 col-md-4 col-sm-4 animate-onscroll">
						
							<p class="copyright">© 2014 Candidate. All Rights Reserved</p>
							
						</div>
						
						<div class="col-lg-8 col-md-8 col-sm-8 animate-onscroll">
							
							<div class="social-media">
								<ul class="social-icons">
									<li class="facebook"><a href="#" class="tooltip-ontop" title="Facebook"><i class="icons icon-facebook"></i></a></li>
									<li class="twitter"><a href="#" class="tooltip-ontop" title="Twitter"><i class="icons icon-twitter"></i></a></li>
									<li class="google"><a href="#" class="tooltip-ontop" title="Google Plus"><i class="icons icon-gplus"></i></a></li>
									<li class="youtube"><a href="#" class="tooltip-ontop" title="Youtube"><i class="icons icon-youtube-1"></i></a></li>
									<li class="flickr"><a href="#" class="tooltip-ontop" title="Flickr"><i class="icons icon-flickr-4"></i></a></li>
									<li class="email"><a href="#" class="tooltip-ontop" title="Email"><i class="icons icon-mail"></i></a></li>
								</ul>
								<ul class="social-buttons">
									<li>
										
									</li>
									<li>
										<div class="fb-share-button" data-href="https://developers.facebook.com/docs/plugins/" data-type="button_count"></div>
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
			<a href="#" id="button-to-top"><i class="icons icon-up-dir"></i></a>
		
		</div>
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


