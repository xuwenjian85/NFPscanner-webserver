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
		<script src="rweb/assets/js/jquery-2.1.1.min.js"></script>
	    <link href="rweb/assets/css/bootstrap.min.css" rel="stylesheet">
		<link href="rweb/assets/css/font-awesome.min.css" rel="stylesheet">
		<link href="rweb/assets/css/style.css" rel="stylesheet" type="text/css">
		<link href="rweb/css/header.css"  type="text/css" rel="stylesheet">
		<link href="rweb/css/comment.css" rel="stylesheet">
	    <link href="rweb/assets/js/bootstrap-table.css" rel="stylesheet">
	    <link href="rweb/assets/css/bootstrap.min.css" rel="stylesheet">
		<link href="rweb/assets/css/jquery.mmenu.css" rel="stylesheet">
		<link href="rweb/assets/css/font-awesome.min.css" rel="stylesheet">
		<link href="rweb/assets/css/climacons-font.css" rel="stylesheet">
	    <link href="rweb/assets/css/style.min.css" rel="stylesheet">
		<link href="rweb/css/header.css" rel="stylesheet">
		<link href="static/css/pagination.css" rel="stylesheet">
		<link href="static/css/progressbar.css" rel="stylesheet">
		<link href="static/css/jquery-ui.min.css" rel="stylesheet">
		<script>
			if (navigator.userAgent.split(";")[1].toLowerCase().indexOf("msie") > 0 ){
				window.location.href = "supportInfo";
			}
		</script>
		<script src="rweb/js/network/js/kinetic-v5.1.0.min.js"></script>
		<script src="rweb/js/network/js/inchlib-1.1.0.js"></script>
		<script src="rweb/js/network/js/cytoscape.min.js"></script>
		<script src="rweb/js/jquery.qtip.min.js" type="text/javascript"></script>
		<script src="rweb/js/cyto-qtip.js" type="text/javascript"></script>
		<link href="rweb/js/jquery.qtip.min.css" rel="stylesheet">
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
			}	.action-item {
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
			.node {
			  stroke: #fff;
			  stroke-width: 1.5px;
			}

			.link {
			  stroke: #999;
			  stroke-opacity: .6;
			}

			.tooltip1{
				z-index: 9990;
				position:absolute  ; height:200px;
				width:300px;
				padding:10px;
			}
			.tooltip_main1{
				 background-image:url(static/image/main.png);
				 background-position:center;
				background-repeat:repeat-y;
				padding-left:30px;
				padding-right:30px;
				color:#C00;
				font-weight:bold;
				height: 210px;
			}

			.tooltip_top1{
				height:40px;
				background-image:url(static/image/top.png);
				background-repeat:no-repeat;
				background-position:bottom;
			}

			.tooltip_bottom1{
				height:20px;
				background-image:url(static/image/foot.png);
				background-repeat:no-repeat;
				background-position:top;
			}
			.row.box-error{
				margin-top:0px;
			}
			#overlay {
			    background: transparent;
			    filter: alpha(opacity=50); /* IE的透明度 */
			    opacity: 0.5;  /* 透明度 */
			    display: none;
			    position: absolute;
			    top: 0px;
			    left: 0px;
			    width: 100%;
			    height: 100%;
			    z-index: 888888888; /* 此处的图层要大于页面 */
			}
			.bootstrap-table .pull-right{
				width:100%;
			}
			.bootstrap-table .pagination-info, .pagination-detail{
				display:none;
			}
		</style>
	</head>
</head>

<body class="sticky-header-on tablet-sticky-header" style="padding-bottom:0;">
<noscript>
	<div class="modal-backdrop fade in" style="z-index: 20000;"></div>
	<div class="modal fade" style="top:30%;display:block;opacity:1;z-index: 200000;" tabindex="-1" role="dialog" aria-labelledby="selectFileModalLabel">
	  <div class="modal-dialog" style="border:none;width: 500px;height: 150px;" role="document" >
		<div class="box border">
			<div class="box-title">
				<h4><i class="fa fa-check-square-o"></i>JavaScript needs to be enabled</h4>
				<div class="tools">
				</div>
			</div>
			<div class="box-body">
				<p>NFPscanner requires JavaScript to run properly. Please enable JavaScript, and then reload this page.</p>
		
				<p>You can find instructions on how to enable JavaScript for your browser below:</p>
				<div style="height:100px;">
					<a href="http://www.google.com/support/chrome/bin/answer.py?answer=114662" target="_blank">
						<div class="ui-browserupdate-icon chrome"><span class="ui-browserupdate-name">Chrome</span></div>
					</a>
					
					<a href="http://docs.info.apple.com/article.html?path=Safari/5.0/en/9279.html" target="_blank">
						<div class="ui-browserupdate-icon safari"><span class="ui-browserupdate-name">Safari</span></div>
					</a>
					
					<a href="http://support.mozilla.com/en-US/kb/JavaScript" target="_blank">
						<div class="ui-browserupdate-icon firefox"><span class="ui-browserupdate-name">Firefox</span></div>
					</a>
					
					<a href="http://support.microsoft.com/gp/howtoscript" target="_blank">
						<div class="ui-browserupdate-icon msie"><span class="ui-browserupdate-name">Internet Explorer</span></div>
					</a>
				</div>
			</div>
		</div>
	  </div>
	</div>
</noscript>
<div name="ipt" id="ipt" style="position:absolute;"> </div>
<div class="container" style="width: 100%" >
			<!-- Header -->
			<header id="" class="sticky-header" style="opacity: 1;padding:0;">

				<!-- Main Header -->
				<div id="main-header" style="height: 80px;" align="center">
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
						<li >

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

					<section id="content" style="">

			<!-- Section -->
			<section class="section full-width-bg" style="padding-top:20px;">

	<div class="container-fluid content">
		<div class="main" style="padding:0;margin-top:10px;background:#fff;">
			<div class="panel panel-default"  id= "paramDiv">
				<div class="panel-heading" style="background: #337ab7;">
				<!-- 	<h2><strong><font color="white">Summary
					<span class="glyphicon glyphicon-question-sign" aria-hidden="true" title="Learn more" onclick="moveLink('networksimilarityHelp#librarybodyA');">TODO</span>
					 -->
					<h2 onclick="moveLink('networksimilarityHelp#DownloadbodyA');"><strong><font color="white">Summary
					<span class="glyphicon glyphicon-question-sign" aria-hidden="true" title="Learn more" ></span>
					 </font></strong></h2>

					<div class="panel-actions">
						<a class="btn-minimize"></a>
					</div>
				</div>
				<div class="panel-body">
					<div class="row" style="margin-top:15px;margin-left:16px;">
						<div class="row col-md-7">
							<label class="control-label" >Job ID : </label>
							<div style="margin-left: 10px;display: inline-block;">
								<p id="requestId" class="form-control-static"></p>
							</div>
						</div>
						<div class="row col-md-3">
						  <a href="javascript:void(0);" onclick="downloadPDF();" class="btn btn-success"><i class="fa fa-file-text"></i>&nbsp;Download Report ( PDF Version )</a>
						  <a href="data/networksimilarity/saveData/<%=request.getParameter("id")%>.zip" class="btn btn-info"  style="display:none;" onclick="javascript:void(0)"><i class="fa fa-print"></i> Download</a>
						</div>
						<!-- <div class="row col-md-3" style="margin-top:15px;margin-left:16px;" id="emailRow"> -->
						<div class="row col-md-3" style="margin-top:15px;margin-left:16px;display:none;" id="emailRow">
							<label class="control-label">Email have sent to <span id="inputedEmail"></span></label>
						</div>
					</div>
					<div class="row" style="display:none;">
						<div class="control-label" style="width: 100px;float: left;margin-top: 35px;"><label class="control-label" >Status : </label></div>
						<div style="margin-left: 10px;display: inline-block;width: 500px;float: left;">
							<div style="width:500px;margin-top:20px;">
								<ol class="ui-step ui-step-4">
									<li class="ui-step-start ui-step-done " id="li1">
											<div class="ui-step-line">-</div>
											<div class="ui-step-icon">
													<i class="iconfont">&#xf02f;</i>
													<i class="iconfont ui-step-number" id='i1' style="background:transparent;font-size:12px;font-style:normal;left:17px;line-height:12px;padding:0;text-shadow:none;top:9px;color:white;">&#xF029;</i>
													<span class="ui-step-text">Waiting</span>
											</div>
									</li>
									<li class="ui-step-done" id="li2">
											<div class="ui-step-line">-</div>
											<div class="ui-step-icon">
													<i class="iconfont">&#xf02f;</i>
													<i class="iconfont ui-step-number" id='i2' style="background:transparent;font-size:12px;font-style:normal;left:17px;line-height:12px;padding:0;text-shadow:none;top:9px;color:white;">&#xF029;</i>
													<span class="ui-step-text">Queued</span>
											</div>
									</li>
									<li class="ui-step-done" id="li3">
											<div class="ui-step-line">-</div>
											<div class="ui-step-icon">
													<i class="iconfont">&#xf02f;</i>
													<i class="iconfont ui-step-number" id='i3' style="background:transparent;font-size:12px;font-style:normal;left:17px;line-height:12px;padding:0;text-shadow:none;top:9px;color:white;">&#xF029;</i>
													<span class="ui-step-text">Running</span>
											</div>
									</li>
									<li class="ui-step-end ui-step-active " id="li4">
											<div class="ui-step-line">-</div>
											<div class="ui-step-icon">
													<i class="iconfont">&#xf02f;</i>
													<i class="iconfont ui-step-number" id='i4' style="background:transparent;font-size:12px;font-style:normal;left:17px;line-height:12px;padding:0;text-shadow:none;top:9px;color:white;">&#xF029;</i>
													<span class="ui-step-text">Done</span>
											</div>
									</li>
							</ol>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="row col-md-3" style="margin-top:15px;margin-left:16px;">
							<label class="control-label">Submitted at : </label>
							<div style="margin-left: 10px;display: inline-block;">
								<p class="form-control-static"  id="start_time"></p>
							</div>
						</div>
						<div class="row col-md-3" style="margin-top:15px;margin-left:16px;">
							<label class="control-label"> Total run time : </label>
							<div style="margin-left: 10px;display: inline-block;">
								<p class="form-control-static"  id="timing"></p>
							</div>
						</div>
						<div class="row col-md-3" style="margin-top:15px;margin-left:16px;">
							<label class="control-label">Completed at : </label>
							<div style="margin-left: 10px;display: inline-block;">
								<p id="completedtime" class="form-control-static"></p>
							</div>
						</div>
					</div>
					<hr/>
					<div>
						<div class="row" style="margin-top:15px;margin-left:6px;display: none" id="queryNetRow">
							<label class="control-label col-md-2" style="line-height: 34px;">Input network : </label>
							<p class="form-control-static col-md-10"  id="queryNet"></p>
						</div>
						<div class="row" style="margin-top:15px;margin-left:6px;display: none;" id="queryNet1Row">
							<label class="control-label col-md-2" style="line-height: 34px;">Input network #1 : </label>
							<p class="form-control-static col-md-4"  id="queryNet1"></p>
						</div>
						<div class="row" style="margin-top:15px;margin-left:6px;display: none;" id="queryNet2Row">
							<label class="control-label col-md-2" style="line-height: 34px;">Input network #2 : </label>
							<p class="form-control-static col-md-4"  id="queryNet2"></p>
						</div>
					</div>
					<div class="row" style="margin-top:15px;margin-left:6px;display: none;" id="libraryNetRow">
						<label class="control-label col-md-2" style="line-height: 34px;">Reference set : </label>
						<p class="form-control-static col-md-4"  id="libraryNet"></p>
					</div>
					<hr/>
					<div>
						<div class="row" style="margin-top:15px;margin-left:6px;">
							<label class="control-label col-md-2" style="line-height: 34px;">Similarity measures : </label>
							<p class="form-control-static col-md-4"  id="similarityMeasures"></p>
						</div>
						<div class="row" style="margin-top:15px;margin-left:6px;">
							<label class="control-label col-md-2" style="line-height: 34px;">Alignment algorithm : </label>
							<p class="form-control-static col-md-4"  id="alignmentAlgorithm"></p>
						</div>
						<div class="row" style="margin-top:15px;margin-left:6px;display: none;"id="permutationCyclesRow" >
							<label class="control-label col-md-2" style="line-height: 34px;">Permutation cycles : </label>
							<p class="form-control-static col-md-4"  id="permutationCycles"></p>
						</div>
					</div>
					<div class="row" style="margin-top:15px;margin-left:6px;display:none;">
						<label class="control-label">Submitted at : </label>
						<p class="form-control-static" id="startTime"></p>
					</div>
					</div>
			</div>

			<div  id="drawchartLine" class="panel panel-default" style="margin-top:20px">
				<div class="panel-heading" style="background: #337ab7;">
				<!-- 	<h2><strong><font color="white">Fingerprint View
						<span class="glyphicon glyphicon-question-sign" aria-hidden="true" title="Learn more" onclick="moveLink('networksimilarityHelp#librarybodyA');">TODO</span> -->
					<h2 onclick="moveLink('networksimilarityHelp#UnderstandbodyA');"><strong><font color="white">Fingerprint View
					<span class="glyphicon glyphicon-question-sign" aria-hidden="true" title="Learn more" ></span>
					</font></strong></h2>
					<div class="panel-actions">
						<a class="btn-minimize"></a>
					</div>
				</div>
				<div class="panel-body">

					<div class="row" style="margin-top:10px;margin-left:7px;">
						<div class="col-md-12">
							<div>
								<div style="width: 70%;float: left;" id="autoheight" >
									<div class="panel panel-default ">
											<div class="panel-heading" style="height:34px;">
												<h2 style="width: 100%;"><i class="fa fa-table red"></i><strong>Fingerprint Graph</strong>
													<span class="glyphicon glyphicon-download-alt" aria-hidden="true" style="cursor: pointer;float:right;margin-top:9px;" title="Save as image" onclick="downloadImage(3);"></span>
												</h2>
											</div>

											<!-- <div style="height: 610px;" class="righttableY" id="tttttt">
												<div style="width: 100%;height: 30px;" id="">
													<p style="margin-left:10px;font-size: 14px;">(TODO) Click on fingerprint curves to expand network alignment details:</p> -->
													<div style="height: 700px;" class="righttableY" id="tttttt">
												<div style="width: 100%;height: 100px;" id="">
													<p style="margin-left:10px;font-size: 14px;">1. Click on the data points will expand the pairwise alignment details right below the fingerprint graph on the same page. <br>2. Click curve legend above fingerprint curves to turn on and turn off view.<br>3. Mouseover the data points to see the corresponding similarity scores between one input network and one basic network. <br>4. Mouseover a row in the right table will highlight data point on fingerprint graph.<hr></p>
 												
												</div>
												<div id="downloadALLTP">
													<div id="downloadTP" style="height:600px;">
														<div style="width: 100%;float: left;" id="sssssss">
															<div id="netfingerprint" onmouseout="clearFilter()" style="width:100%;height:600px;">
															</div>
															<div style="height: 100px;width: 100%;" id="tl">
															</div>
														</div>

														<!--<div style="width: 15%;float: left;height: 300px;" id="downloadTLDiv" class="righttableY">
				 										<span id="legendZ" class="glyphicon glyphicon-plus" title="Open  the legend" style="display: none;cursor: pointer;" aria-hidden="true" onclick="showLegend(2)"></span>
																<div class="panel panel-default " id="legendJIDV">
																	<div class="panel-heading" style="height: 34px;">
																		<h2 style="width: 100%">
																			<strong>legend</strong>
																			<span id="legendJ" class="glyphicon glyphicon-minus" title="Close the legend" style="cursor: pointer;float:right;margin-top: 9px;" aria-hidden="true" onclick="showLegend(1)"></span>
																		</h2>
																	</div>

																	<div id="downloadTL"></div>
																</div>
															</div>-->
												</div>
											</div>
									</div>
								</div><!-- end of fingerprint graph-->
							</div>
						</div>
					<div style="width: 30%;float: left;height:610px;" >
						<div class="panel panel-default ">
								<div class="panel-heading" style="height:34px;">
									<h2><i class="fa fa-table red"></i><strong>Fingerprint Data</strong></h2>
								</div>
									<!-- <div id="linefingerprint" style="width:100%;overflow-y: auto;height: 610px;"class="righttableY" >
										<div style="height: 510px;"> -->
									<div id="linefingerprint" style="width:100%;overflow-y: auto;height: 700px;"class="righttableY" >
										<div style="height: 550px;">
										<table class="table table-bordered" style="font-size: 10px;" id="lineTableInfo">

										</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div><!-- end of fingerprint panel-->
			</div><!-- end of drawchartLine-->

			<div class="panel panel-default" style="margin-top:20px;" id="drawchart">
				<div class="panel-heading" style="background: #337ab7;">
					<!-- <h2><strong><font color="white">Alignment View
						<span class="glyphicon glyphicon-question-sign" aria-hidden="true" title="Learn more" onclick="moveLink('networksimilarityHelp#librarybodyA');">TODO</span> -->
						<h2 onclick="moveLink('networksimilarityHelp#ExplorebodyA');"><strong><font color="white">Alignment View
						<span class="glyphicon glyphicon-question-sign" title="Learn more"></span>
					</font></strong></h2>
					<div class="panel-actions">
						<a class="btn-minimize"></a>
					</div>
				</div>
				<div class="panel-body">

			<div >
					<div style="width: 70%;float: left" id="allDiv">
					<div style="width: 49%;float: left;" id="drawchartLeft" >
						<div class="panel panel-default">
							<div class="panel-heading" style="height:34px;">
								<h2 style="width:100%;"><i class="fa fa-table red neticon"></i><strong id="net1Strong">Input Network</strong>
									<span class="glyphicon glyphicon-floppy-save" aria-hidden="true" style="cursor: pointer;margin-top: 9px;float: right;" title="Save as image" onclick="downloadImage(1);"></span>
								</h2>
							</div>
							<div id="networkChart1" style="width:100%;height:100%;z-index: 99999"class="lefttableY">
							</div>
							<div id="drawchartSkip"></div>
						</div>
					</div>
					<!-- <div style="width:3px;float:left;cursor:move;min-height: 600px;" id="moveDiv"></div> -->
					<div style="width:3px;float:left;cursor:move;min-height: 700px;" id="moveDiv"></div>
					<div style="width: 50%;float: left;height: 100%;" id="drawchartRight">
						<div class="panel panel-default" >
							<div class="panel-heading" style="height:34px;">
								<h2 style="width:100%;"><i class="fa fa-table red neticon"></i><strong id="net2Strong">Basic Network</strong>
									<span class="glyphicon glyphicon-floppy-save" aria-hidden="true" style="cursor: pointer;margin-top: 9px;float: right;" title="Save as image"  onclick="downloadImage(2);"></span>
								</h2>
							</div>
								<div id="networkChart2" style="width:100%;height:100%;z-index: 99999" class="righttableY">
								</div>
						</div>
					</div>
					</div>
					<div style="width: 30%;float: left;" >
						<div class="panel panel-default" >
							<div class="panel-heading" style="height:34px;">
								<h2><i class="fa fa-table red "></i><strong>Alignment & Enrichment Data</strong></h2>
							</div>
							<div id="networkChart3" style="width:100%;height:100%;overflow-y: auto" class="righttableY">
								<ul id="myTab" class="nav nav-tabs">
								   <li class="active">
								      <a href="#home" data-toggle="tab">
								         Network Alignment
								      </a>
								   </li>
								   <li><a href="#ios" data-toggle="tab">Pathways</a></li>
								   <li><a href="#ego" data-toggle="tab">GeneOntology</a></li>
								</ul>
								<div id="myTabContent" class="tab-content" style="padding:0;">
								   <div class="tab-pane fade in active" id="home">

										<div style="height: 439px;">
											<table class="table table-bordered" style="font-size: 10px;" id="clusterTableInfo"></table>
 										</div>
 									</div>
								   <div class="tab-pane fade" id="ios">

								   		<div style="height: 439px;">
								          <table class="table table-bordered" style="font-size: 10px;" id="ekgTableInfo"></table>
								          </div>
								   </div>
								   <div class="tab-pane fade" id="ego">

								   <div style="height: 439px;">
								       <table class="table table-bordered" style="font-size: 10px;" id="egoTableInfo"></table>
								       </div>
								   </div>
								</div>
							</div>
						</div>
					</div>

				</div>
				</div>


			<!-- tb -->
			</div>


			<div class="modal fade" id="tipModal" style="top:15%;" tabindex="-1" role="dialog" aria-labelledby="selectFileModalLabel">
	  <div class="modal-dialog" style="border:none;width: 400px;" role="document" >
		<div class="box border">
			<div class="box-title">
				<h4><i class="fa fa-check-square-o"></i>Error Tip</h4>
				<div class="tools">
					<a href="javascript:;" data-dismiss="modal" aria-label="Close" class="remove">
						<i class="fa fa-times"></i>
					</a>
				</div>
			</div>
			<div class="box-body">
				<form class="form-horizontal" role="form">
                    <div class="form-group"  align="center">
                        <label class="" id="tipInfo" style="width: 100%;"></label>
                        <div class="col-md-9">
                            <div class="fileupload fileupload-new" style="margin-bottom:0;" data-provides="fileupload">

							</div>
                        </div>
                    </div>
                </form>
				<div class="modal-footer" style="padding: 10px 0 0 0;margin-top:0px;">
					<button type="button" class="btn btn-primary" data-dismiss="modal" aria-label="Close" >OK</button>
				</div>
			</div>
		</div>
	  </div>

	</div>
		<!-- end: Content -->
	</div><!--/container-->
		<input type="hidden" id="bdscore"/>

	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">Warning Title</h4>
				</div>
				<div class="modal-body">
					<p>Here settings can be configured...</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->

	</div><!-- /.modal -->

	<div class="modal fade" id="warningModal">
		<div class="modal-dialog" style="width:650px;border:none;">
			<div class="box border" style="margin-bottom: 0;">
				<div class="box-title">
					<h4><i class="fa fa-check-square-o"></i>Warning</h4>
					<div class="tools">
						<a href="javascript:;" data-dismiss="modal" aria-label="Close" class="remove">
							<i class="fa fa-times"></i>
						</a>
					</div>
				</div>
				<div class="box-body" id="warn-content"></div>
			</div>

		</div><!-- /.modal-dialog -->

	</div><!-- /.modal -->

	<div class="clearfix"></div>
	<jsp:include page="login.jsp"></jsp:include>
			<!-- Footer -->

			</section>
			<!-- /Section -->





		</section>
			<footer id="footer1" >
				<!-- Lower Footer -->
				<div id="lower-footer">
	
					<div class="row">

						<div class="col-lg-4 col-md-4 col-sm-4" style="opacity: 1;width: 100%;">

<!-- 							<p class="copyright">© 2014 Candidate. All Rights Reserved.More Templates <a href="http://www.baidu.com/" target="_blank" title="模板">testtt</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">template</a></p>
 -->							<div align="center">
 								<!--  <p class="copyright">NFP is supported by a grant from National Nature Science Foundation of China. -->
 								<p class="copyright">NFPscanner is supported by a grant from National Nature Science Foundation of China.
								 </p>
								 <p class="copyright">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Copyright © 2015-2016 Beijing Institute of Radiation Medicine</p>
 								</div>

						</div>


					</div>

				</div> <div class="div1"></div>

				<!-- /Lower Footer -->
				<!-- <img id="testimg" /> -->
			<!-- <input type="hidden" id="testimg1" /> -->
			<textarea id="testimg1" style="display: none;"></textarea>
			</footer>
			<input type="hidden" id="typeIDs"/>
			<!-- /Footer -->
	<script src="static/js/jspdf.min.js"></script>
	<script src="rweb/assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="rweb/assets/js/bootstrap.min.js"></script>
<!-- 	<script src="rweb/assets/js/bootstrap-table1.js"></script>
 --><script src="rweb/assets/js/bootstrap-table.js"></script>	
 	<script src="rweb/assets/plugins/d3/d3.min.js"></script>
	<script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
		<script type="text/javascript" src="static/js/json2.js"></script>

        <!-- Flash embedding utility (needed to embed Cytoscape Web) -->
        <script type="text/javascript" src="static/js/AC_OETags.js"></script>
        <!-- Cytoscape Web JS API (needed to reference org.cytoscapeweb.Visualization) -->
        <script type="text/javascript" src="static/js/cytoscapeweb.js"></script>
		<script src="static/js/resultInfo.js"></script>
		<script src="static/js/jquery.pagination.js"></script>
		<script src="static/js/html2canvas.js"></script>
		<script src="static/js/jquery.plugin.html2canvas.js"></script>
		<script src="static/js/jquery-ui.js"></script>
		<link rel="stylesheet" type="text/css" href="rweb/js/bootbox/bootstrap-tour.min.css" />
		<script src="rweb/js/bootbox/bootstrap-tour.min.js"></script>
<!-- 				<script src="static/js/canvg.js"></script>
 -->

    <script type="text/javascript">downloadImage
        require.config({
            paths: {
                echarts: 'http://echarts.baidu.com/build/dist'
            }
        });
    </script>
	<script src="rweb/js/e-charts/echarts-temp.js" type="text/javascript"></script>
	<script src="rweb/assets/plugins/jquery-ui/js/jquery-ui-1.10.4.min.js"></script>

	<script>

	function iFrameHeight(id) {
	    var ifm = document.getElementById(id);
	    var subWeb = document.frames ? document.frames["iframe"].document : ifm.contentDocument;
	    if (ifm != null && subWeb != null) {
	         ifm.height = subWeb.body.scrollHeight;
	    }
	}

	var ID = '<%=request.getParameter("id")%>';
	var ID1 = '<%=request.getParameter("id")%>';
	ID = decrypt(ID,"nfs");
	var clusters = 200;
	var colors = ['#CC6699','#FF6633','#CC33CC','#FFCC00','#33CCCC','#CC0033','#FFCCFF','#9900FF','#666699','#FFFFCC','#669999','#00CCFF','#CCCC00','#FF3366','#FF6666','#669900','#333333','#660066'];
	var NUM = '';
	var TYPE = 1;
	$(document).ready(function(){
		$("body", window.parent.document).scrollTop(0);
		for(var i=0;i<clusters;i++){
			if(i >= colors.length){
				var color = randomColor();
				colors.push(color);
			}
		}
		showEchart();
	});
	function stringToJsTime_(timeString) {
		if(timeString != null && timeString != '' && typeof(timeString) != 'undefined'){
			var y = timeString.substring(0,4);
			var m = timeString.substring(5,7)-1;
			var d = timeString.substring(8,10);
			var h = timeString.substring(11,13);
			var mm = timeString.substring(14,16);
			var ss = timeString.substring(17,19);
			var time = new Date(y,m,d,h,mm,ss,0);
			return time;
		}else{
			return new Date()
		}
	}
	function dateminus(date1,date2){
		var date3=date2.getTime()-date1.getTime();  //时间差的毫秒数

	      //计算出相差天数
	        var days=Math.floor(date3/(24*3600*1000));

	        //计算出小时数

	        var leave1=date3%(24*3600*1000) ;   //计算天数后剩余的毫秒数
	        var hours=Math.floor(leave1/(3600*1000));
	        //计算相差分钟数
	        var leave2=leave1%(3600*1000)   ;     //计算小时数后剩余的毫秒数
	        var minutes=Math.floor(leave2/(60*1000));


	        //计算相差秒数
	        var leave3=leave2%(60*1000)    ;  //计算分钟数后剩余的毫秒数
	        var seconds=Math.round(leave3/1000);
	        if(hours.length<2){
	        	hours = "0"+""+hours;
	        }
	        if(minutes.length<2){
	        	minutes = "0"+""+minutes;
	        }
	        if(seconds.length<2){
	        	seconds = "0"+""+seconds;
	        }
	        showTiming2(hours,minutes,seconds);
	        //$("#timing").html(hours+":"+minutes+":"+seconds);
	}
	  function showTiming2(h,m,s){
    	  var HH = h;
    	  var mm = m;
    	  var ss = s;
    	  var str = '';

    	  str = "";

    	  if(++ss==60)
    	  {
    	  if(++mm==60)
    	  {
    	  HH++;
    	  mm=0;
    	  }
    	  ss=0;
    	  }

    	  str+=HH<10?"0"+HH:HH;
    	  str+=":";
    	  str+=mm<10?"0"+mm:mm;
    	  str+=":";
    	  str+=ss<10?"0"+ss:ss;
    	  document.getElementById("timing").innerHTML = str;

      }
	function fullParameters(data){
		var similarityMeasures =(data.similarityMeasures=='geneontology'?'Gene Ontology':'Sequence');
		if(data.type==2){
			var cycleMode='';
			if(data.permutationCycles=='10') cycleMode='Fast mode';
			if(data.permutationCycles=='100') cycleMode='Normal mode';
			if(data.permutationCycles=='1000') cycleMode='Accurate mode';
			var permutationCycles  =cycleMode +' ( '+data.permutationCycles+' cycles ) ';

			var queryNet = data.queryNet;
			var nets = queryNet.split(",");
			var net = "";
			for(var i=0;i<nets.length;i++){

				net += "<a href='data/networksimilarity/saveData/"+ID+"/"+nets[i]+"' onclick='javascript:void(0)'>"+nets[i];
				if(i<nets.length-1) net+="</a>&nbsp;&nbsp;<span class='glyphicon glyphicon-resize-horizontal'></span>&nbsp;&nbsp;";
			}
			$("#similarityMeasures").html(similarityMeasures);
			$("#alignmentAlgorithm").html(data.alignmentAlgorithm);
			$("#permutationCycles").html(permutationCycles);
			$("#queryNet").html(net);
			$("#libraryNet").html("<a href='networksimilaritystatistical?libraryNet="+data.libraryNet+"' >"+data.libraryNet+"</a>");
			$("#queryNetRow").show();
			$("#libraryNetRow").show();
			$("#permutationCyclesRow").show();

		}else if(data.type==1){

			$("#similarityMeasures").html(similarityMeasures);
			$("#alignmentAlgorithm").html(data.alignmentAlgorithm);
		/* 	$("#queryNet1").html(data.queryNet1);
			$("#queryNet2").html(data.queryNet2); */
			$("#queryNet1").html( "<a href='data/networksimilarity/saveData/"+ID+"/"+data.queryNet1+"' onclick='javascript:void(0)'>"+data.queryNet1+"</a>&nbsp;");
			$("#queryNet2").html("<a href='data/networksimilarity/saveData/"+ID+"/"+data.queryNet2+"' onclick='javascript:void(0)'>"+data.queryNet2+"</a>&nbsp;");
			$("#queryNet1Row").show();
			$("#queryNet2Row").show();

		}
	}
	function  showEchart(){
		$.ajax({
			   type: "POST",
			   async: false,
			   url: "networkconfusion/getProjectInfoById.form",
			   data: {id:ID},
			   success: function(msg){
					var data = msg.data;
					console.log("==========");
					console.log(msg);
					fullParameters(msg.parameters);
					$("#requestId").html(ID1);
					$("#inputedEmail").html(data[4]);

					var start_time = data[5];
					var completedtime = data[6];
					$("#start_time").html(start_time);
					$("#completedtime").html(completedtime);
					//var bngDate = new Date(start_time.substr(0,4),start_time.substr(4,2)-1,start_time.substr(6,2));
			        //var endDate = new Date(completedtime.substr(0,4),completedtime.substr(4,2)-1,completedtime.substr(6,2));

			        var start = stringToJsTime_(start_time);
			        var end =stringToJsTime_(completedtime);
			        dateminus(start,end);

					if(data[4]==null||data[4]==undefined||data[4]==""){
						$("#emailRow").hide();
					}else{
						$("#emailRow").hide();
					}
					var saveId = ID;
					NUM = parseInt(data[3]);
					var type = data[2];
					TYPE = type;
					$("#typeIDs").val(type);
					if(type == 1){
						showType1Chart(saveId);
						if(getCookie("tour2") != 'null' && getCookie("tour2") != '' && getCookie("tour2") != null){
							openintrojs(2);
						}
						//net1Strong
						//net2Strong
					}else if(type == 2){
						showType2Chart(saveId);
						$.ajax({
						 	   type: "POST",
						 	   async: false,
						 	   url: "networkconfusion/getNetFingerPrint.form",
						 	   data: {saveId: saveId},
						 	   success: function(msg){
						 		  console.log("====");
						 		   console.log(msg);
						 		  $("#bdscore").val(msg.data);
						 		  var netP = msg.net[0];
						 		 console.log(msg.net);
						 		  for(var i =1;i<msg.net.length;i++){
						 			  if(msg.net[i]!=null&&msg.net[i]!=undefined){
						 				 netP += ","+msg.net[i];
						 			  }else{
						 				  break;
						 			  }
						 		  }


						 		 $("#netNameP").html(netP);
						 		//$("#net1Strong").html("Input:"+msg.net[0]);
						 		//$("#net2Strong").html("Basic NetWork:"+msg.net[1]);
					 	   },error:function(data){
					 		/* 	if(XMLHttpRequest.status!=500){
					 				showTip("An error occurs, please contact nfs_admin@163.com");
					 		  } */
						 	}
						});
						bindResize(document.getElementById('moveDiv'));
						if(getCookie("tour1") != 'null' && getCookie("tour1") != '' && getCookie("tour1") != null){
							openintrojs(1);
						}
					}
			  }
		});
	}

	function showType1Chart(saveId){
		$("#pariwiseResultIframe,#drawChart").show();
		$("#drawchartLine").hide();

		initResultInfo("data/networksimilarity/saveData/"+saveId+"/metadata.json");
		$.ajax({
		 	   type: "POST",
		 	   async: false,
		 	   url: "networkconfusion/getNetFingerPrint.form",
		 	   data: {saveId: saveId},
		 	   success: function(msg){
		 		  console.log("====");
		 		   console.log(msg);
		 		  $("#bdscore").val(msg.data);
		 		  var netP = msg.net[0];

		 			console.log(msg.net);
		 		  for(var i =1;i<msg.net.length;i++){
		 			  if(msg.net[i]!=null&&msg.net[i]!=undefined){
		 				 netP += ","+msg.net[i];
		 			  }else{
		 				  break;
		 			  }
		 		  }

		 		 $("#netNameP").html(netP);
				$("#net1Strong").attr("title",msg.net[1])
				$("#net2Strong").attr("title",msg.net[0])
		 		$("#net1Strong").html("NET1:"+msg.net[1]);
		 		$("#net2Strong").html("NET2:"+msg.net[0]);
	 	   },error:function(data){
	 		/* 	if(XMLHttpRequest.status!=500){
	 				showTip("An error occurs, please contact nfs_admin@163.com");
	 		  } */
		 	}
		});
		$.ajax({
		 	   type: "POST",
		 	   async: false,
		 	   url: "networkconfusion/getPairwiseNetChart.form",
		 	   data: {saveId: saveId},
		 	   success: function(msg){
		 		   console.log(msg);
		 		  showBaseInfoTable(msg);
		 		   showOtherInfo("ekg");
		 		   showOtherInfo("ego");

					if(!flashChecker()){
						$("#warningModal").modal('show');
							$("#warn-content").html('<div class="container-fluid content"><div class="row"><div id="content" class="col-sm-12 full"><div class="row box-error"><div class="col-lg-12 col-md-12 col-xs-12"><div class="text-center"><p>The network plugin requires the Adobe Flash Player to use all of its features. <a href="http://www.adobe.com/go/getflash/">Get Adobe Flash Player</a></p></div></div></div></div></div></div>');
							return;
					}
		 		  for(var i=0;i<msg.data.length;i++){
		 			 var data = msg.data[i];

					 var netData = JSON.parse(data);
					 var div_id = "networkChart" + (i+1);

		                // you could also use other formats (e.g. GraphML) or grab the network data via AJAX
		                var networ_json = {
						dataSchema: {
		                    		nodes: [
		                    		         { name: "group", type: "int" },
		                    		        // { name: "score", type: "string" }
		           		         	],
		           		         	edges: [
		                    		        { name: "value", type: "int" }
		           		         	]
		                    	},
		                    data: netData
		                };

		                // initialization options
		                var options = {
		                    // where you have the Cytoscape Web SWF
		                    swfPath: "swf/CytoscapeWeb",
		                    // where you have the Flash installer SWF
		                    flashInstallerPath: "swf/playerProductInstall"
		                };
		                var visual_style = {
		                    nodes: {
		                        label: { passthroughMapper: { attrName: "id" } } ,
		                        labelFontSize : 12,
								//borderWidth: 2,
								borderColor: '#808080',
								labelFontColor : "#fff",
								labelGlowColor : "#808080",
								color:'#808080',
								labelGlowOpacity : 1,
								labelGlowBlur : 2,
								labelGlowStrength :10,
			                    size: {
		                            defaultValue: 30,
		                            continuousMapper: { attrName: "group", minValue: 15, maxValue: 45 }
		                        },
								//color: "#808080",
								tooltipText : { passthroughMapper: { attrName: "id" } },
								tooltipFontSize  : 14,
								tooltipFontColor : "#fff",
								tooltipBackgroundColor : "#0b94b1",
								tooltipBorderColor : "#0b94b1",
		                    },
							edges : {

							}
		                };
		                // init and draw
		                var vis= new org.cytoscapeweb.Visualization(div_id, options);

		                vis.ready(function() {
		                	//vis.nodeTooltipsEnabled(true);
		                } );
		                vis.draw({ network: networ_json,visualStyle: visual_style });


		               if(i==0){
		            	   vis1 = vis;
		            	     vis1.addListener("click", "nodes", function(event) {
				    				var node = event.target;
				    				queryNodeIdTypeInfo(event,node,1);

									setTimeout(function(){
										filterTableInfo(node.data.id,node.data.group);
									},300);
				    			}).addListener("deselect", "nodes", function(event) {
										    				var node = event.target;
															clearFilterTableInfo();

										    			});
		               }else{
		            	   vis2 = vis;
		            	     vis2.addListener("click", "nodes", function(event) {
				    				var node = event.target;
				    				queryNodeIdTypeInfo(event,node,2);

									setTimeout(function(){
										filterTableInfo(node.data.id,node.data.group);
									},300);

				    			}).addListener("deselect", "nodes", function(event) {
										    				var node = event.target;
															clearFilterTableInfo();

										    			});
		               }
		 		  }
		 	   },error:function(data){
		 			/* if(XMLHttpRequest.status!=500){
		 				showTip("An error occurs, please contact nfs_admin@163.com");
		 		  } */
			 	}
		});
	}

	function queryNodeIdTypeInfo(event,node,i){
		$.ajax({
		 	   type: "POST",
		 	   async: false,
		 	   url: "networkconfusion/queryNodeIdTypeInfo",
		 	   data: {nodeId: node.data.id},
		 	   success: function(msg){
		 		  var nodeIdTypeInfo = "";
		 		  if(msg.ENSEMBL!=null&&msg.ENSEMBL!=undefined){
		 			 nodeIdTypeInfo += "<p>ENSEMBL:<a href='http://www.ensembl.org/Homo_sapiens/Gene/Summary?g="+msg.ENSEMBL+"' target=\"_blank\">"+msg.ENSEMBL+"</a></p>";
		 		  }
				  if(msg.EntrezID!=null&&msg.EntrezID!=undefined){
			 		 nodeIdTypeInfo += "<p>EntrezID:<a href='http://www.ncbi.nlm.nih.gov/gene/?term="+msg.EntrezID+"' target=\"_blank\">"+msg.EntrezID+"</a></p>";

		 		  }
 				  if(msg.GeneSymbol!=null&&msg.GeneSymbol!=undefined){
 		 			 nodeIdTypeInfo += "<p>GeneSymbol:<a href='http://www.genecards.org/cgi-bin/carddisp.pl?gene="+msg.GeneSymbol+"' target=\"_blank\">"+msg.GeneSymbol+"</a></p>";

				  }
				  if(msg.HGNC!=null&&msg.HGNC!=undefined){
			 			 nodeIdTypeInfo += "<p>HGNC:<a href='http://www.genenames.org/cgi-bin/gene_symbol_report?hgnc_id="+msg.HGNC+"' target=\"_blank\">"+msg.HGNC+"</a></p>";

				  }
				  if(msg.REFSEQ_PROTEIN!=null&&msg.REFSEQ_PROTEIN!=undefined){
			 			 nodeIdTypeInfo += "<p>REFSEQ_PROTEIN:<a href='http://www.ncbi.nlm.nih.gov/protein/"+msg.REFSEQ_PROTEIN+"' target=\"_blank\">"+msg.REFSEQ_PROTEIN+"</a></p>";

				  }
 				 if(msg.REFSEQ_RNA!=null&&msg.REFSEQ_RNA!=undefined){
		 			 nodeIdTypeInfo += "<p>REFSEQ_RNA:<a href='http://www.ncbi.nlm.nih.gov/nuccore/"+msg.REFSEQ_RNA+"' target=\"_blank\">"+msg.REFSEQ_RNA+"</a></p>";

				  }
 				 if(msg.UNIPROT!=null&&msg.UNIPROT!=undefined){
		 			 nodeIdTypeInfo += "<p>UNIPROT:<a href='http://www.uniprot.org/uniprot/"+msg.UNIPROT+"' target=\"_blank\">"+msg.UNIPROT+"</a></p>";

				  }
		 		  Tooltip.show(nodeIdTypeInfo,'networkChart',i,event);
		 	   }
		})
	}

	var Tooltip = {};

	Tooltip.show = function(msg,obj,i,event){
		var a = 0;
		var b = 0;
		if(i==3){
			a = 3;
			i = 1;
		}
		if(i==4){
			b = 4;
			i = 2;
		}
		$('div [name = tooltip_'+obj+"]").remove();
		showOverlay();
		$('#'+obj+i).append('<div class="tooltip1" id="tooltip_'+obj+i+'" name="tooltip_'+obj+'">'
		+'<div class="tooltip_top1"></div>'
		+'<div class="tooltip_main1">'+msg+'</div>'
		+'<div class="tooltip_bottom1"></div>'
		+'</div>');
		var x;
		var y;
		if(i==2){
			x = event.target.x;
			x = x+ $('#'+obj+1).width();

			y = event.target.y +$("#paramDiv").height()+270;
			if(b==4){
				y += ($("#autoheight").height()+90);
			}
		}else{
			x = event.target.x;
			y = event.target.y+$("#paramDiv").height()+270;
			if(a==3){
				y += ($("#autoheight").height()+90);
			}
		}
		$('#tooltip_'+obj+i).css("top",(y+10)+"px");
		$('#tooltip_'+obj+i).css("left",(x-10)+"px");
		$('#tooltip_'+obj+i).css("position","absolute");
		$('#tooltip_'+obj+i).css("z-index","888888889");
		//调整位置
		var objOffset = $('#tooltip_'+obj+i).offset();


		$('#tooltip_'+obj+i).offset(objOffset);
		//点击消失
 		$('#tooltip_'+obj+i).click(function(){
		$(this).remove();
		$("#overlay").hide();
		$('#tooltip_'+obj+i).focus();
		});
	}
	var vis1 = null;
	var vis2 = null;
	function drawChart(num,data){
			if($("#networkChart" + num).length == 0){
				$("#drawChart").append("<div class='panel-heading' style='height:34px;'><h2><i class='fa fa-table red'></i><strong>NET" + num + "</strong></h2></div><div id='networkChart" + num + "'></div>");
			}
		    var cyto = generateCy(getCytoElement(data,num),"networkChart" + num);

			for(var i=0;i<clusters;i++){
				if(i >= colors.length){
					var color = randomColor();
					colors.push(color);
				}
			}


			cyto.nodes().each(function(){
				for(var i=1;i<=clusters;i++){
					if(this.data().cluster == i){
						this.style("background-color",colors[i-1]);
					}
				}
			});

			cyto.on("click","node",function(evt){
				var nodeName = this.id();
				 this.qtip({
				  content: [
					{
					  name: nodeName,
					}
				  ].map(function( link ){
					return '<a>' + link.name + '</a>';
				  }).join('<br />\n'),
				  position: {
					my: 'top center',
					at: 'bottom center'
				  },
				  style: {
					classes: 'qtip-bootstrap',
					tip: {
					  width: 16,
					  height: 8
					}
				  }
				});
			});
			return;


			var width = $("body").width()*0.45,

 		    height = 600;

 			var color = d3.scale.category20();

 			var force = d3.layout.force()
 			    .charge(-30)
 			    .linkDistance(10)
 			    .size([width, height]);

 			var svg = d3.select("#networkChart" + num).append("svg")
 			    .attr("width", width)
 			    .attr("height", height)
				.attr("align", "center");

 			d3.json(data, function(error, graph) {
 			  if (error) throw error;

 			  force
 			      .nodes(graph.nodes)
 			      .links(graph.links)
 			      .start();

 			  var link = svg.selectAll(".link")
 			      .data(graph.links)
 			    .enter().append("line")
 			      .attr("class", "link")
 			      .style("stroke-width", function(d) { return Math.sqrt(d.value); });

 			  var node = svg.selectAll(".node")
 			      .data(graph.nodes)
 			    .enter().append("circle")
 			      .attr("class", "node")
 			      .attr("r", 5)
 			      .style("fill", function(d) { return color(d.group); })
 			      .call(force.drag);

 			  node.append("title")
 			      .text(function(d) { return d.name; });

 			  force.on("tick", function() {
 			    link.attr("x1", function(d) { return d.source.x; })
 			        .attr("y1", function(d) { return d.source.y; })
 			        .attr("x2", function(d) { return d.target.x; })
 			        .attr("y2", function(d) { return d.target.y; });

 			    node.attr("cx", function(d) { return d.x; })
 			        .attr("cy", function(d) { return d.y; });
 			  });
 			});
	}
	function bd1paging(){
//		var allNum = data.themes.length + data.perspectives.length;
		var allNum = JSON.parse(sessionStorage.getItem("Type2Data")).data.length;
		var currentpage = $("#bd1Page").val();
		 	function pageselectCallback(page_id, jq) {
		        //alert(page_id); 回调函数，进一步使用请参阅说明文档
		 		$("#bd1Page").val(page_id);
		 		showBd1NetInfo();

		    }
		    $("#bd1Pagination").pagination(allNum, {
		        callback: pageselectCallback,//PageCallback() 为翻页调用次函数。
		        prev_text: "Prev",
		        next_text: "Next ",
		        items_per_page: 10, //每页的数据个数
		        num_display_entries: 2, //两侧首尾分页条目数
		        current_page: currentpage,   //当前页码
		        num_edge_entries: 3 //连续分页主体部分分页条目数

		    });
	}

	function showBd1NetInfo(){
		var msg = JSON.parse(sessionStorage.getItem("Type2Data"));
		console.log(msg);
		 showLineInfoTable(msg);

		var netname = "";
		for(var i = 0 ; i < msg.net.length;i++){
			netname += msg.net[i];
			if(i!=(msg.net.length-1)){
				netname += ",";
			}
		}
		$("#netNameP").html(netname);
	}
	var CRITICALS = [];
	function showType2Chart(saveId){
		$("#pariwiseResultIframe,#drawChart").hide();
		$("#netfingerprint").css({width: '100%',height:'600'});
		var num = NUM;
		$.ajax({
		 	   type: "POST",
		 	   async: false,
		 	   url: "networkconfusion/getPathwayLineChart.form",
		 	   data: {saveId: saveId,num: num},
		 	   success: function(msg){
		 		    CRITICALS = msg.crilist;

		 		   sessionStorage.setItem("Type2Data",JSON.stringify(msg));
		 		  sortData();
		 		  showBd1NetInfo();


		 		    var option = ECharts.ChartOptionTemplates.Lines(msg.data,"score",false);
		 		    var container = $("#netfingerprint")[0];
		 		    option.func = function(param){
		 		    	console.log(param);
		 		    	var libIndex= param.dataIndex +1;
		 		    	var dataIndex  = param.seriesIndex +1;
		 		    	REFNUM = libIndex;
		 		    	NETNUM = dataIndex;
		 		    	showNetworkCharts(saveId,dataIndex,libIndex);
						$("#net1Strong").attr("title",REF_NETNAME)
						$("#net2Strong").attr("title",param.seriesName)
						$("#net2Strong").html("Basic Network : " + REF_NETNAME);
						$("#net1Strong").html("Input Network : " + param.seriesName);
		 		    };
					opt = ECharts.ChartConfig(container, option);
					ECharts.Charts.RenderChart(opt);
		 	   }
		});
	}
	var REF_NETNAME = "";
	function showNetworkCharts(saveId,dataIndex,libIndex){
						showOtherInfo('ekg');
		 		    	showOtherInfo('ego');
		 		    	$.ajax({
			 			 	   type: "POST",
			 			 	   async: false,
			 			 	   url: "networkconfusion/getPathwayChart.form",
			 			 	   data: {saveId: saveId,dataIndex:dataIndex,libIndex: libIndex},
			 			 	   success: function(msg){
			 			 		   console.log(msg);
			 			 		 //  $("#drawChart").show();
			 			 		 $("#pariwiseResultIframe,#drawChart").show();
			 			 		var url =document.location.href;
			 			 		if(url.indexOf("#drawchartSkip")==-1 ){
			 			 			url += "#drawchartSkip";
			 			 		}
			 			 		document.location.href = url ;

			 						  var clusterData = JSON.parse(msg.clusterData);
							 		   var html = "<tr style='font-size:2px;font-weight:bold;'><td>cluster</td><td>score</td><td>operate</td></tr>";
							 		   for(var i=0 ; i <clusterData.length ;i++){
							 			  html += "<tr style='font-size:1px;'><td>cluster"+(i+1)+"</td><td>"+clusterData[i]+"</td>" +
													"<td><input class='checkboxColor' type='checkbox' onclick='changeColorCheck(this)' style='display:inline-block;top:0;' /><a onclick='$(this).prev().trigger(\"click\");' style='cursor:pointer;width:16px;height:16px;display:inline-block;background:" + colors[i] + "'></a></td></tr>";
							 		   }
							 		  // $("#clusterTableInfo").html(html);
							 		  showBaseInfoTable(msg);

										if(!flashChecker()){
											$("#warningModal").modal('show');
												$("#warn-content").html('<div class="container-fluid content"><div class="row"><div id="content" class="col-sm-12 full"><div class="row box-error"><div class="col-lg-12 col-md-12 col-xs-12"><div class="text-center"><p>The network plugin requires the Adobe Flash Player to use all of its features. <a href="http://www.adobe.com/go/getflash/">Get Adobe Flash Player</a></p></div></div></div></div></div></div>');
												return;
										}

							 		  for(var i=0;i<msg.data.length;i++){
							 			 var data = msg.data[i];

										 var netData = data;
										 var div_id = "networkChart" + (i+1);

							                // you could also use other formats (e.g. GraphML) or grab the network data via AJAX
							                var networ_json = {
											dataSchema: {
							                    		nodes: [
							                    		         { name: "group", type: "int" },
							                    		        // { name: "score", type: "string" }
							           		         	],
							           		         	edges: [
							                    		        { name: "value", type: "int" }
							           		         	]
							                    	},
							                    data: netData
							                };

							                // initialization options
							                var options = {
							                    // where you have the Cytoscape Web SWF
							                    swfPath: "swf/CytoscapeWeb",
							                    // where you have the Flash installer SWF
							                    flashInstallerPath: "swf/playerProductInstall"
							                };
							                var visual_style = {
							                    nodes: {
							                        label: { passthroughMapper: { attrName: "id" } } ,
							                        labelFontSize : 12,
													//borderWidth: 2,
													borderColor: '#808080',
													labelFontColor : "#fff",
													labelGlowColor : "#808080",
													color:'#808080',
													labelGlowOpacity : 1,
													labelGlowBlur : 2,
													labelGlowStrength :10,
								                    size: {
							                            defaultValue: 30,
							                            continuousMapper: { attrName: "group", minValue: 15, maxValue: 45 }
							                        },
													//color: "#808080",
													tooltipText : { passthroughMapper: { attrName: "id" } },
													tooltipFontSize  : 14,
													tooltipFontColor : "#fff",
													tooltipBackgroundColor : "#0b94b1",
													tooltipBorderColor : "#0b94b1",
							                    },
												edges : {

												}
							                };
							                // init and draw
							                var vis= new org.cytoscapeweb.Visualization(div_id, options);
							                vis.draw({ network: networ_json,visualStyle: visual_style });
							                if(i==0){
								            	   vis1 = vis;
								            	     vis1.addListener("click", "nodes", function(event) {
										    				var node = event.target;
										    				console.log(node);
										    				queryNodeIdTypeInfo(event,node,3);

															setTimeout(function(){
																filterTableInfo(node.data.id,node.data.group);
															},300);
										    			}).addListener("deselect", "nodes", function(event) {
										    				var node = event.target;
															clearFilterTableInfo();

										    			});
								               }else{
								            	   vis2 = vis;
								            	     vis2.addListener("click", "nodes", function(event) {
										    				var node = event.target;
										    				console.log(node);
										    				queryNodeIdTypeInfo(event,node,4);

															setTimeout(function(){
																filterTableInfo(node.data.id,node.data.group);
															},300);
										    			}).addListener("deselect", "nodes", function(event) {
										    				var node = event.target;
															clearFilterTableInfo();

										    			});
								               }
							 		  }
			 			 	   },error:function(data){
							 		/* showTip("An error occurs, please contact nfs_admin@163.com"); */
							 	}
			 			});
	}

	function getCytoElement(data,num){
		//var dataLine = data.split("#");
		//var dataLineNum = dataLine.length;
		var nodes = [];
		var edges = [];
		var nodeTempObj={};
		var edgeTempObj={};

		var nodelist = data.nodes;
		for(var i=0;i<nodelist.length;i++){
			var sourceNode = nodelist[i].name;
			var sourcecluster = nodelist[i].group;
			if(!check(sourceNode,nodeTempObj)){
				nodes.push({"data":{"id":sourceNode+"_" + num,"width":80,"cluster":sourcecluster},"classes":"nodeItem"});
				nodeTempObj[sourceNode] = "nodeId";
			}
		}
		var edgelist = data.links;
		for(var i=0;i<edgelist.length;i++){
			var sourceNode = edgelist[i].source;
			var targetNode = edgelist[i].target;
			var weight = edgelist[i].value;
			if(!isNaN(sourceNode)){
				sourceNode = nodelist[parseInt(sourceNode)].name;
				targetNode = nodelist[parseInt(targetNode)].name;
			}



			if(!check(targetNode+"_"+sourceNode,edgeTempObj)){
				if(sourceNode!=targetNode){
					edges.push({"data":{"id":sourceNode+"_"+targetNode+"_" + num,"source":sourceNode+"_" + num,"target":targetNode+"_" + num,"weight":weight},"classes":"edgeItem noLabel"});
					edgeTempObj[sourceNode+"_"+targetNode] = "edgeItem";
				}
			}
		}
		return {"nodes":nodes,"edges":edges};
	}
function check(str,obj){
	if(obj[str]){
		return true;
	}else{
		return false;
	}
}
function randomColor( ) {
    var rand = Math.floor(Math.random( ) * 0xFFFFFF).toString(16);
    if(rand.length == 6){
        return "#" + rand;
    }else{
        return randomColor();
    }
}

function changeColorCheck(obj){
	var colorEntries = [];
	var opacities = [];
	var borderColors = [];
	$(".checkboxColorego:checked").each(function(index,dom){
		$(dom).prop("checked",false);
		$(dom).next().css("background","none");
	});
	$(".checkboxColorego:disabled").each(function(index,dom){
		$(dom).prop("disabled",false);
	});
	$(".checkboxColorekg:checked").each(function(index,dom){
		$(dom).prop("checked",false);
		$(dom).next().css("background","none");
	});
	$(".checkboxColorekg:disabled").each(function(index,dom){
		$(dom).prop("disabled",false);
	});
	if($(".checkboxColor:checked").length >= 7 && $(obj).prop("checked")){
		$(".checkboxColor").not(":checked").prop("disabled",true);
	}else{
		$(".checkboxColor").not(":checked").prop("disabled",false);
	}

	if($(obj).prop("checked")){
		var color = baseCheckbox.shift();
		$(obj).next().css("background",color);
		$(obj).attr("bg",color);
	}else{
		$(obj).next().css("background","none");
		var color = $(obj).attr("bg");
		baseCheckbox.push(color);
	}


	egoCheckbox = ['#8DCBC3','#D28BCC','#907CC7','#C26661','#639BC7','#E9AE3D','#333333'];
	ekgCheckbox = ['#8DCBC3','#D28BCC','#907CC7','#C26661','#639BC7','#E9AE3D','#333333'];

	$(".checkboxColor").each(function(index,dom){
		var cluster = parseInt($(dom).attr("cluster"));
		if($(dom).prop("checked")){
			colorEntries.push({attrValue: cluster,value: $(dom).attr("bg")});
			opacities.push({attrValue: cluster,value: 1});
			borderColors.push({attrValue: cluster,value: $(dom).attr("bg")});
		}else{
			colorEntries.push({attrValue: cluster,value: '#808080'});
			borderColors .push({attrValue: cluster,value: '#808080'});
			opacities.push({attrValue: cluster,value: 0.6});
		}
	});
	var discreteMapper =  {
				discreteMapper: {
						attrName: "group",
						entries: colorEntries
					}
				};
	var discreteMapper1 =  {
			discreteMapper: {
					attrName: "group",
					entries: borderColors
				}
			};

	var opacity = {
				discreteMapper: {
						attrName: "group",
						entries: opacities
				}
	};
	var style1 = vis1.visualStyle();
	style1.nodes.color = discreteMapper;
	style1.nodes.opacity = opacity;
	style1.nodes.borderColor = discreteMapper1;
	style1.edges.opacity = 0.8;
	style1.edges.color = "#999999";
	vis1.visualStyle(style1);
	var style2 = vis2.visualStyle();
	style2.nodes.color = discreteMapper;
	style2.nodes.opacity = opacity;
	style2.nodes.borderColor = discreteMapper1;
	style2.edges.opacity = 0.8;
	style2.edges.color = "#999999";
	vis2.visualStyle(style2);
}
var REFNUM = 0;
var NETNUM = 0;
function showOtherInfo(div){
	$("#" + div + "TableInfo").html("");
	$.ajax({
		url: 'networkconfusion/getOtherInfo.form',
		type: 'POST',
		data: {saveId: ID,type: TYPE, refnum:REFNUM,netnum:NETNUM,name:div},
		success: function(msg){
			showEkgEgoInfoTable(msg.data,div);
/* 				 		console.log(msg.data);
 			var data = msg.data;
			var html = "<tr style='font-size:2px;font-weight:bold;'><td>Description</td><td>GeneRatio</td><td>pvalue</td><td>operate</td></tr>";
 		    for(var i=0 ; i <data.length ;i++){
 		    	var obj = data[i];
 		    	var num1 = new Number(obj.pvalue).toPrecision(3)
 			  html += "<tr style='font-size:1px;'><td>"+obj.Description+"</td>" + "<td>" + obj.GeneRatio + "</td>" + "<td>" + num1+ "</td>" +
						"<td><input geneid='" + obj.geneID + "' class='checkboxColor" + div + "' type='checkbox' onclick='changeColorCheck" + div + "(this)' style='display:inline-block;top:0;' /><a onclick='$(this).prev().trigger(\"click\");' style='cursor:pointer;width:16px;height:16px;display:inline-block;background:" + colors[i] + "'></a></td></tr>";
 		    }
 		    if(data.length == 0){
 		    	$("#" + div + "TableInfo").html("The result is calculating.Please wait a few minutes.<br/><button class='btn btn-info btn-xs' onclick='showOtherInfo(\"" + div + "\")'>refrensh</button>");
 		    }else{
 		    	$("#" + div + "TableInfo").html(html);
 		    }   */

		},error:function(data){
		/* 	if(XMLHttpRequest.status!=500){
 				showTip("An error occurs, please contact nfs_admin@163.com");
 		  } */
	 	}
	});
}

function showOtherInfo(div,otherInfo){
	$("#" + div + "TableInfo").html("");
	$.ajax({
		url: 'networkconfusion/getOtherInfo.form',
		type: 'POST',
		data: {saveId: ID,type: TYPE, refnum:REFNUM,netnum:NETNUM,name:div,otherInfo:otherInfo},
		success: function(msg){
			showEkgEgoInfoTable(msg.data,div);
		},error:function(data){
		/* 	if(XMLHttpRequest.status!=500){
 				showTip("An error occurs, please contact nfs_admin@163.com");
 		  } */
	 	}
	});
}

function changeColorCheckekg(obj){
	var colorEntries = [];
	var opacities = [];
	var borderColors = [];
	var globalNodes = [];
	var imgEnreies = [];
	$(".checkboxColorego:checked").each(function(index,dom){
		$(dom).prop("checked",false);
		$(dom).next().css("background","none");
	});
	$(".checkboxColorego:disabled").each(function(index,dom){
		$(dom).prop("disabled",false);
	});
	$(".checkboxColor:checked").each(function(index,dom){
		$(dom).prop("checked",false);
		$(dom).next().css("background","none");
	});
	$(".checkboxColor:disabled").each(function(index,dom){
		$(dom).prop("disabled",false);
	});
	egoCheckbox = ['#8DCBC3','#D28BCC','#907CC7','#C26661','#639BC7','#E9AE3D','#333333'];
	baseCheckbox = ['#8DCBC3','#D28BCC','#907CC7','#C26661','#639BC7','#E9AE3D','#333333'];

	if($(".checkboxColorekg:checked").length >= 7 && $(obj).prop("checked")){
		$(".checkboxColorekg").not(":checked").prop("disabled",true);
	}else{
		$(".checkboxColorekg").not(":checked").prop("disabled",false);
	}

	if($(obj).prop("checked")){
		var color = ekgCheckbox.shift();
		$(obj).next().css("background",color);
		$(obj).attr("bg",color);
	}else{
		$(obj).next().css("background","none");
		var color = $(obj).attr("bg");
		ekgCheckbox.push(color);
	}

	//console.log($(".checkboxColorekg[bg='" + ekgCheckbox[0] + "']"))

	for(var k=0;k<egoCheckbox.length;k++){
		var dom = $(".checkboxColorekg[bg='" + egoCheckbox[k] + "']:checked");
		if(dom.length == 0){
			continue;
		}
		var nodelist = dom.attr("geneid").split("/");
		console.log(nodelist)
		for(var i=0;i<nodelist.length;i++){
			colorEntries.push({attrValue: nodelist[i],value: dom.attr("bg")});
			opacities.push({attrValue: nodelist[i],value: 1});
			borderColors.push({attrValue: nodelist[i],value: dom.attr("bg")});
		}
	}


	/*$(".checkboxColorekg").each(function(index,dom){
		if($(dom).prop("checked")){
			var nodelist = $(dom).attr("geneid").split("/");
			for(var i=0;i<nodelist.length;i++){
				/*if($.inArray(nodelist[i], globalNodes) == -1){
					globalNodes.push(nodelist[i]);
				}else{
					imgEnreies.push({attrValue: nodelist[i],value: "rweb/img/node.jpg"});
				}
				colorEntries.push({attrValue: nodelist[i],value: $(dom).attr("bg")});
				opacities.push({attrValue: nodelist[i],value: 1});
				borderColors.push({attrValue: nodelist[i],value: $(dom).attr("bg")});
			}

		}else{
			//colorEntries.push({attrValue: index+1,value: '#f5f5f5'});
			//opacities.push({attrValue: index+1,value: 0.6});
		}
	});*/
	var discreteMapper =  {
				discreteMapper: {
						attrName: "id",
						entries: colorEntries
					}
				};
	var discreteMapper1 =  {
			discreteMapper: {
					attrName: "id",
					entries: borderColors
				}
			};

	var opacity = {
				discreteMapper: {
						attrName: "id",
						entries: opacities
				}
	};
	var imgs = {
		discreteMapper: {
				attrName: "id",
				entries: imgEnreies
		}
	};
	var style1 = vis1.visualStyle();
	style1.nodes.color = discreteMapper;
	style1.nodes.opacity = opacity;
	style1.nodes.borderColor = discreteMapper1;
	style1.edges.opacity = 0.8;
	style1.edges.color = "#999999";
	vis1.visualStyle(style1);
	var style2 = vis2.visualStyle();
	style2.nodes.color = discreteMapper;
	style2.nodes.opacity = opacity;
	style2.nodes.borderColor = discreteMapper1;
	style2.edges.opacity = 0.8;
	style2.edges.color = "#999999";
	vis2.visualStyle(style2);
}

function changeColorCheckego(obj){
	var colorEntries = [];
	var opacities = [];
	var borderColors = [];
	var globalNodes = [];
	var imgEnreies = [];
	$(".checkboxColorekg:checked").each(function(index,dom){
		$(dom).prop("checked",false);
		$(dom).next().css("background","none");
	});
	$(".checkboxColorekg:disabled").each(function(index,dom){
		$(dom).prop("disabled",false);
	});
	$(".checkboxColor:checked").each(function(index,dom){
		$(dom).prop("checked",false);
		$(dom).next().css("background","none");
	});
	$(".checkboxColor:disabled").each(function(index,dom){
		$(dom).prop("disabled",false);
	});
	ekgCheckbox = ['#8DCBC3','#D28BCC','#907CC7','#C26661','#639BC7','#E9AE3D','#333333'];
	baseCheckbox = ['#8DCBC3','#D28BCC','#907CC7','#C26661','#639BC7','#E9AE3D','#333333'];

	if($(".checkboxColorego:checked").length >= 7 && $(obj).prop("checked")){
		$(".checkboxColorego").not(":checked").prop("disabled",true);
	}else{
		$(".checkboxColorego").not(":checked").prop("disabled",false);
	}

	if($(obj).prop("checked")){
		var color = egoCheckbox.shift();
		$(obj).next().css("background",color);
		$(obj).attr("bg",color);
	}else{
		$(obj).next().css("background","none");
		var color = $(obj).attr("bg");
		egoCheckbox.push(color);
	}

	for(var k=0;k<ekgCheckbox.length;k++){
		var dom = $(".checkboxColorego[bg='" + ekgCheckbox[k] + "']:checked");
		if(dom.length == 0){
			continue;
		}
		var nodelist = dom.attr("geneid").split("/");
		console.log(nodelist)
		for(var i=0;i<nodelist.length;i++){
			colorEntries.push({attrValue: nodelist[i],value: dom.attr("bg")});
			opacities.push({attrValue: nodelist[i],value: 1});
			borderColors.push({attrValue: nodelist[i],value: dom.attr("bg")});
		}
	}
	var discreteMapper =  {
				discreteMapper: {
						attrName: "id",
						entries: colorEntries
					}
				};
	var discreteMapper1 =  {
			discreteMapper: {
					attrName: "id",
					entries: borderColors
				}
			};

	var opacity = {
				discreteMapper: {
						attrName: "id",
						entries: opacities
				}
	};
	var imgs = {
		discreteMapper: {
				attrName: "id",
				entries: imgEnreies
		}
	};
	var style1 = vis1.visualStyle();
	style1.nodes.color = discreteMapper;
	style1.nodes.opacity = opacity;
	style1.nodes.borderColor = discreteMapper1;
	style1.edges.opacity = 0.8;
	style1.edges.color = "#999999";
	vis1.visualStyle(style1);
	var style2 = vis2.visualStyle();
	style2.nodes.color = discreteMapper;
	style2.nodes.opacity = opacity;
	style2.nodes.borderColor = discreteMapper1;
	style2.edges.opacity = 0.8;
	style2.edges.color = "#999999";
	vis2.visualStyle(style2);
}
function encrypt(str, pwd) {
  if(pwd == null || pwd.length <= 0) {
    console.log("Please enter a password with which to encrypt the message.");
    return null;
  }
  var prand = "";
  for(var i=0; i<pwd.length; i++) {
    prand += pwd.charCodeAt(i).toString();
  }
  var sPos = Math.floor(prand.length / 5);
  var mult = parseInt(prand.charAt(sPos) + prand.charAt(sPos*2) + prand.charAt(sPos*3) + prand.charAt(sPos*4) + prand.charAt(sPos*5));
  var incr = Math.ceil(pwd.length / 2);
  var modu = Math.pow(2, 31) - 1;
  if(mult < 2) {
    console.log("Algorithm cannot find a suitable hash. Please choose a different password. \nPossible considerations are to choose a more complex or longer password.");
    return null;
  }
  var salt = Math.round(Math.random() * 1000000000) % 100000000;
  prand += salt;
  while(prand.length > 10) {
    prand = (parseInt(prand.substring(0, 10)) + parseInt(prand.substring(10, prand.length))).toString();
  }
  prand = (mult * prand + incr) % modu;
  var enc_chr = "";
  var enc_str = "";
  for(var i=0; i<str.length; i++) {
    enc_chr = parseInt(str.charCodeAt(i) ^ Math.floor((prand / modu) * 255));
    if(enc_chr < 16) {
      enc_str += "0" + enc_chr.toString(16);
    } else enc_str += enc_chr.toString(16);
    prand = (mult * prand + incr) % modu;
  }
  salt = salt.toString(16);
  while(salt.length < 8)salt = "0" + salt;
  enc_str += salt;
  return enc_str;
}

function decrypt(str, pwd) {
  if(str == null || str.length < 8) {
    console.log("A salt value could not be extracted from the encrypted message because it's length is too short. The message cannot be decrypted.");
    return;
  }
  if(pwd == null || pwd.length <= 0) {
    console.log("Please enter a password with which to decrypt the message.");
    return;
  }
  var prand = "";
  for(var i=0; i<pwd.length; i++) {
    prand += pwd.charCodeAt(i).toString();
  }
  var sPos = Math.floor(prand.length / 5);
  var mult = parseInt(prand.charAt(sPos) + prand.charAt(sPos*2) + prand.charAt(sPos*3) + prand.charAt(sPos*4) + prand.charAt(sPos*5));
  var incr = Math.round(pwd.length / 2);
  var modu = Math.pow(2, 31) - 1;
  var salt = parseInt(str.substring(str.length - 8, str.length), 16);
  str = str.substring(0, str.length - 8);
  prand += salt;
  while(prand.length > 10) {
    prand = (parseInt(prand.substring(0, 10)) + parseInt(prand.substring(10, prand.length))).toString();
  }
  prand = (mult * prand + incr) % modu;
  var enc_chr = "";
  var enc_str = "";
  for(var i=0; i<str.length; i+=2) {
    enc_chr = parseInt(parseInt(str.substring(i, i+2), 16) ^ Math.floor((prand / modu) * 255));
    enc_str += String.fromCharCode(enc_chr);
    prand = (mult * prand + incr) % modu;
  }
  return enc_str;
}
function flashChecker() {
    var hasFlash = false;
    var flashVersion = 0;
    if(document.all) {
        var swf = new ActiveXObject('ShockwaveFlash.ShockwaveFlash');
        if(swf) {
            hasFlash = true;
            VSwf = swf.GetVariable("$version");
            flashVersion = parseInt(VSwf.split(" ")[1].split(",")[0]);
        }
    } else {
        if(navigator.plugins && navigator.plugins.length > 0) {
            var swf = navigator.plugins["Shockwave Flash"];
            if(swf) {
                hasFlash = true;
                var words = swf.description.split(" ");
                for(var i = 0; i < words.length; ++i) {
                    if(isNaN(parseInt(words[i]))) continue;
                    flashVersion = parseInt(words[i]);
                }
            }
        }
    }
    return hasFlash;
}

function showTip(info){
	$("#tipInfo").html(info);
	$("#tipModal").modal('show');

}
	function openintrojs(type){
		var steps = [];
		if(type == 1){
			steps = [
			  {
				element: "#downloadALLTP",
				title: "step7",
				placement: "top",
				/* content: "Fingerprint graph,your can click the pointer at the graph!", */
				content: "Explore fingerprint graph, click on expand a pairwise alignment view",
				onNext: function(){
					showNetworkCharts(ID,1,1);

					setTimeout(function(){
						myscroll("#networkChart1");
					},1000);

					setCookie("tour" + type,1);
					//document.location.href = "networkconfusionSNF?id=sample_data&introjs=false&num=1";
				}
			  },
			  {
				element: "#networkChart1",
				title: "step8",
				/* content: "networkChart1" , */
				content: "Visualize input network" ,
				placement: "right",
				onNext: function(){
					setTimeout(function(){
						myscroll("#networkChart1");
					},1000);
					setCookie("tour" + type,2);
				},
				onPrev: function(){
					setTimeout(function(){
						myscroll("#inputedEmail");
					},800);
				}
			  },
			  {
				element: "#networkChart2",
				title: "step9",
				/* content: "networkChart2", */
				content: "Visualize basic network",
				placement: "left",
				onNext: function(){
					setTimeout(function(){
						myscroll("#networkChart1");
					},800);
					setCookie("tour" + type,3);
				},
				onPrev: function(){
					setTimeout(function(){
						myscroll("#networkChart1");
					},800);
				}
			  },
			  {
				element: "#networkChart3",
				title: "step10",
				placement: "left",
				/* content: "control panel", */
				content: "Alignment and Enrichment analysis",
				onPrev: function(){
					setTimeout(function(){
						myscroll("#networkChart1");
					},800);
				}
			  }
			];
		}else{
			steps = [
			  {
				element: "#networkChart1",
				title: "step6",
				content: "networkChart1" ,
				placement: "top",
				onNext: function(){
					myscroll("#networkChart1");
					setCookie("tour" + type,1);
				}
			  },
			  {
				element: "#networkChart2",
				title: "step7",
				content: "networkChart2",
				placement: "top",
				onNext: function(){
					myscroll("#networkChart1");
					setCookie("tour" + type,2);
				},
				onPrev: function(){
					myscroll("#networkChart1");
				}
			  },
			  {
				element: "#networkChart3",
				title: "step8",
				placement: "top",
				//content: "control panel",
				onPrev: function(){
					myscroll("#networkChart1");
				}
			  }
			];
		}

		var tour = new Tour({
			  name: "tour" + type,
			  backdrop : true,
			  orphan : true,
			  steps: steps,
			  onEnd: function(tour){
					delCookie("tour" + type);
			  },
		});

		// Initialize the tour
		tour.init();
		tour.setCurrentStep(0);
		// Start the tour
		tour.start(true);
	}
//读取cookies
function getCookie(name)
{
    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");

    if(arr=document.cookie.match(reg))

        return unescape(arr[2]);
    else
        return null;
}
function myscroll(div){
	parent.document.body.scrollTop = $(div).offset().top;
}

//写cookies

function setCookie(name,value)
{
    var Days = 30;
    var exp = new Date();
    exp.setTime(exp.getTime() + Days*24*60*60*1000);
    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
}
//删除cookies
function delCookie(name)
{
    var exp = new Date();
    exp.setTime(exp.getTime() - 1);
    var cval=getCookie(name);
    if(cval!=null)
        document.cookie= name + "="+cval+";expires="+exp.toGMTString();
}


/* 显示遮罩层 */
function showOverlay() {
    $("#overlay").css("height",pageHeight());
    $("#overlay").css("width",pageWidth());
    $("#overlay").show();
    // fadeTo第一个参数为速度，第二个为透明度
    // 多重方式控制透明度，保证兼容性，但也带来修改麻烦的问题
    $("#overlay").fadeTo(200, 0.5);
}

/* 隐藏覆盖层 */
function hideOverlay() {
    $("#overlay").fadeOut(200);
}

/* 当前页面高度 */
function pageHeight() {
    return document.body.scrollHeight;
}

/* 当前页面宽度 */
function pageWidth() {
    return document.body.scrollWidth;
}
function closeTip(){
	$('div [name = tooltip_networkChart]').remove();
	 $("#overlay").hide();
}
	</script>

<div id="overlay" onclick="closeTip()"></div>
</body>
</html>
