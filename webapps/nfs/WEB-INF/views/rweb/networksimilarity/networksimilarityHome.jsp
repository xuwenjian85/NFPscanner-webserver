﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Network Fingerprint Scanning</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- Favicon -->
		<link rel="shortcut icon" href="static/image/w1.png" />
		<link href="rweb/assets/css/font-awesome.min.css" rel="stylesheet">
		<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<link href="rweb/assets/css/style.css" rel="stylesheet" type="text/css">
		<!-- ydj -->
		<link href="rweb/css/header.css"  type="text/css" rel="stylesheet">
		<script>
			if (navigator.userAgent.split(";")[1].toLowerCase().indexOf("msie") > 0 ){
				window.location.href = "supportInfo";
			}
		</script>
		<!-- jQuery -->
		
  </head>

 <body class="sticky-header-on tablet-sticky-header" style="padding-bottom:0;	font-size:medium
; line-height: 1.5em">

	<div id="fb-root"></div>

		<!-- Container -->
		<div class="container">


			<!-- Header -->
			<header id="" class="sticky-header" style="opacity: 1;padding:0;">

				<!-- Main Header -->
				<div id="main-header" style="height: 80px;">
					<div id="logo" class="col-lg-12 col-md-12 col-sm-12">
							<img src="static/image/b2.png" style="width: 110px;margin-top: -20px;margin-right: -20px;"/>
							<span style="color:white;font-size:33px;margin-top: 1px;">Network Fingerprint Scanner</span>
							<span style="color: white; font-size: 15px; top: 28px; margin-left: 5px;">NFPscanner:a server for knowledge-based characterization of biomedical networks
</span> <%-- <span style="position:absolute;right:10;top:6;display: none;" >
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
							</span> --%>
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

							<a class="fa " href="networksimilarityHome">Home</a>


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




		<section id="content">

			<!-- Section -->
			<section class="section full-width-bg" style="padding-top:20px">
				<div class="row">

					<div class="col-lg-9 col-md-9 col-sm-8">
						<h3 style="text-align:center">Welcome to NFPscanner</h3>
						<div class="intro">
					 	<p style="line-height:1.5em">
Network Fingerprint Scanner (NFPscanner) is a web server to decipher biomedical networks by making systematic comparisons to well-studied basic networks. A given biomedical network is characterized as a spectrum-like vector called “network fingerprint”, which contains similarities to basic networks. The similarity is measured by conservations of protein-protein interactions (PPI), sequence and functional annotations. This knowledge-based multidimensional characterization provides an intuitive way to decipher molecular networks, especially for large-scale network comparison and clustering analyses. <br/>
The NFPscanner has three highlighted features:<br/>
<ol>
	<li>
Incorporation of 4 network alignment algorithms (
<a href="networksimilarityHelp#APcluster">APcluster</a>,  
<a href="networksimilarityHelp#IsoRankN">IsoRankN</a>, 
<a href="networksimilarityHelp#SPINAL">SPINAL</a>, 
<a href="networksimilarityHelp#GHOST">GHOST</a>);
	</li>
	<li>
Manually curated 49 sets of basic networks, retrieved from 6 network databases (
<a href="http://www.genome.jp/kegg/">KEGG</a>,  
<a href="http://www.reactome.org/">Reactome</a>,  
<a href="http://pid.nci.nih.gov/">NCI/PID</a>,  
<a href="http://www.cs.tau.ac.il/~spike/">SPIKE</a>,  
<a href="http://humancyc.org/">HumanCyc</a>,  
<a href="http://pantherdb.org/">PANTHER</a>,
<a href="http://cgap.nci.nih.gov/Pathways/BioCarta_Pathways/">BioCarta</a>
);
	</li>
	<li>
Visualization of 
<a href="networksimilarityHelp#UnderstandbodyA">network fingerprint </a>
and 
<a href="networksimilarityHelp#ExplorebodyA">pairwise alignment </a>.<br/>
	</li>
</ol>
You are always welcome to improve NFPscanner service by commenting, contribute alignment algorithms and/or special basic network sets. Feel free to 
<a href="networksimilarityContact">contact us</a>
if you have any comments or questions on this web server.
					 	</p>
			            </div>
					<img src='static/image/home1.jpg'/>
					</div>


					<div class="col-lg-3 col-md-3 col-sm-4 sidebar" style="padding-right:15px;">
						<div class="sidebar-box white " style="opacity: 1;">
							<h3>Quick Start </h3>
							<h4>New to NFPscanner? Try the tutorials now.</h4>
             				 <a href="javascript:void(0);" onclick="playtour(1)" class="btn btn-primary" style="margin-bottom:0.5em"><span class="glyphicon glyphicon-play" aria-hidden="true"></span>&nbsp;Tutorial for Fingerprint Scan</a>
							<a href="javascript:void(0);" onclick="playtour(2)" class="btn btn-primary" ><span class="glyphicon glyphicon-play " aria-hidden="true"></span>&nbsp;Tutorial for Pairwise Alignment</a>
						</div>

						<!-- /Featured Video -->
						<!-- Featured Video -->
						<div class="sidebar-box white" style="opacity: 1;">
							<h3>Statistics</h3>
              <h4>NFPscanner webserver contains:</h4>
							<p>
							<h4 style="display:inline"> 2 </h4> analysis tools <br>
							<h4 style="display:inline"> 4 </h4> alignment algorithms<br>
							<h4 style="display:inline"> 49 </h4> set of basic networks from <h4 style="display:inline"> 7 </h4> databases
              </p>
						</div>
						<!-- /Featured Video -->

						<!-- Upcoming Events -->
						<div class="sidebar-box white" style="opacity: 1;">
							<h3>What’s New?</h3>
							<ul class="upcoming-events">

								<!-- Event -->

								<li>
									<div class="event-content">
                    <h4><a href="networksimilarityNews">Version 1.4 online. </a></h4>
                    <ul class="event-meta">
											<li><i class="icons icon-clock"></i>30th November 2015</li>
										</ul>
                    Server web interface and help page is updated.
									</div>
								</li>
								<li>
									<div class="event-content">
                    <h4><a href="networksimilarityNews"> Version 1.3 online.</a></h4>
                    <ul class="event-meta">
											<li><i class="icons icon-clock"></i>10th November 2015</li>
										</ul>
                     Example data are deployed. Step-by-step tutorial guides are implemented. 
									</div>
								</li>
							<!-- /Event -->

							</ul>
							<a href="networksimilarityNews" class="button transparent button-arrow">More events</a>
						</div>

					</div>

				</div>

			</section>
			<!-- /Section -->





		</section>




			<!-- Footer -->
			<footer id="footer1" >
				<!-- Lower Footer -->
				<div id="lower-footer">
				<div style="margin-left: 98%">											<script type="text/javascript" src="//ra.revolvermaps.com/0/0/3.js?i=0eu6839u0la&amp;b=0&amp;s=26&amp;m=2&amp;cl=ffffff&amp;co=010020&amp;cd=aa0000&amp;v0=60&amp;v1=60&amp;r=1" async="async"></script>
				</div>

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
			<!-- /Footer -->



			<!-- Back To Top -->
		</div>
		<!-- /Container -->

		<!-- JavaScript -->

		<!-- Bootstrap -->
		<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.1.min.js"></script>
		<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

			
		<script>
		
		
		function playtour(type){
			setCookie("play",type);
			window.location.href = "networksimilarityAnalysis?type=" + type + "&play=" + type;
		}
		function setCookie(name,value) 
		{ 
			var Days = 30; 
			var exp = new Date(); 
			exp.setTime(exp.getTime() + Days*24*60*60*1000); 
			document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString(); 
		}
		</script>


	</body>
</html>
