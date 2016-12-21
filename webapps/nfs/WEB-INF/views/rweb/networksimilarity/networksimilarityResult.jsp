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
        <link rel='stylesheet' type='text/css' href='http://fonts.useso.com/css?family=Open+Sans:400,700|Droid+Sans:400,700' />

	    <link href="rweb/assets/css/bootstrap.min.css" rel="stylesheet">
		<link href="rweb/assets/css/jquery.mmenu.css" rel="stylesheet">
		<link href="rweb/assets/css/font-awesome.min.css" rel="stylesheet">
		<link href="rweb/assets/css/climacons-font.css" rel="stylesheet">
	    <link href="rweb/assets/css/style.min.css" rel="stylesheet">
		<link href="rweb/css/header.css" rel="stylesheet">
		<link href="static/css/progressbar.css" rel="stylesheet">
		<script>
			if (navigator.userAgent.split(";")[1].toLowerCase().indexOf("msie") > 0 ){
				window.location.href = "supportInfo";
			}
		</script>
		<script type="text/javascript">
		    $(function() {
		        $('#bookmarkme').click(function() {
		            if (window.sidebar && window.sidebar.addPanel) { // Mozilla Firefox Bookmark
		                window.sidebar.addPanel(document.title,window.location.href,'');
		            } else if(window.external && ('AddFavorite' in window.external)) { // IE Favorite
		                window.external.AddFavorite(location.href,document.title); 
		            } else if(window.opera && window.print) { // Opera Hotlist
		                this.title=document.title;
		                return true;
		            } else { // webkit - safari/chrome
		                alert('Press ' + (navigator.userAgent.toLowerCase().indexOf('mac') != - 1 ? 'Command/Cmd' : 'CTRL') + ' + D to bookmark this page.');
		            }
		        });
		    });
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

			.test{
			    background: transparent;
			    font-size: 12px;
			    font-style: normal;
			    left: 17px;
			    line-height: 12px;
			    padding: 0;
			    text-shadow: none;
			    top: 9px;
			}
		</style>
	</head>
</head>

<body style="font-size:medium; line-height: 1.5em">
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

	<div class="container">
		<!-- Header -->
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
						<li>

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
			<section class="section full-width-bg" style="padding-top:20px;">
			<div class="container-fluid content">
		<!-- start: Content -->
		<div class="main" style="padding:0;margin-top:10px;background:#fff;">
			<div class="panel panel-default">
				<div class="panel-heading" style="background: #337ab7;">
					<h2><strong><font color="white">Running</font></strong></h2>
					<div class="panel-actions">
						<a class="btn-minimize"></a>
					</div>
				</div>
				<div class="panel-body">
									<div class="row" style="margin-top:15px;margin-left:16px;">
						<div class="row col-md-8">
							<label class="control-label">Job ID : </label>
							<div style="margin-left: 10px;display: inline-block;">
								<p id="requestId" class="form-control-static"></p>
							</div>
						</div>
						<div class="row col-md-3" style="margin-left:16px;display:none;" id="emailRow">
							<label class="control-label">Email have sent to <span id="inputedEmail"></span></label>
						</div>
						<div class="row col-md-3" style="float:right;">
						  <a id="bookmarkme" href="javascript:void(0);" class="btn btn-success"><i class="fa fa-file-text"></i>&nbsp;Bookmark This Page</a>
						</div>
					</div>


					<hr>
					<div class="row">
						<div class="row col-md-4" style="margin-top:15px;margin-left:16px;">
							<label class="control-label">Submitted at : </label>
							<div style="margin-left: 10px;display: inline-block;">
								<p class="form-control-static"  id="nowTime"></p>
							</div>
						</div>
						<div class="row col-md-4" style="margin-top:15px;margin-left:16px;">
							<label class="control-label"> Total run time : </label>
							<div style="margin-left: 10px;display: inline-block;">
								<p class="form-control-static"  id="timing"></p>
							</div>
						</div>
					
					</div>
				 	<div class="row" style="margin-left:16px;">
						<div class="control-label" style="width: 100px;float:left;margin-top:35px;"><label class='control-label'>Status :</label> </div>
						<div style="margin-left: 10px;display: inline-block;width: 500px;float:left">
							<div style="width:500px;margin-top:20px;">
								<ol class="ui-step ui-step-4">
							    <li class="ui-step-start ui-step-active " id="li1">
							        <div class="ui-step-line">-</div>
							        <div class="ui-step-icon">
							            <i class="iconfont">&#xf02f;</i>
							            <i class="ui-step-number" id='i1'>1</i>
							            <span class="ui-step-text">Waiting</span>
							        </div>
							    </li>
							    <li class="" id="li2">
							        <div class="ui-step-line">-</div>
							        <div class="ui-step-icon">
							            <i class="iconfont">&#xf02f;</i>
							            <i class="ui-step-number"  id='i2'>2</i>
							            <span class="ui-step-text">Queued</span>
							        </div>
							    </li>
							    <li class="" id="li3">
							        <div class="ui-step-line">-</div>
							        <div class="ui-step-icon">
							            <i class="iconfont">&#xf02f;</i>
							            <i class="ui-step-number" id='i3' >3</i>
							            <span class="ui-step-text">Running</span>
							        </div>
							    </li>
							    <li class="ui-step-end " id="li4">
							        <div class="ui-step-line">-</div>
							        <div class="ui-step-icon">
							            <i class="iconfont">&#xf02f;</i>
							            <i class=" ui-step-number" style="left: 20px;font-size:14px;"  id='i4'>4</i>
							            <span class="ui-step-text">Done</span>
							        </div>
							    </li>
							</ol>
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
					<!--
+					<hr>
					<div class="row" style="margin-top:15px;margin-left:16px;">
						<label class="control-label">Job ID : </label>
						<div style="margin-left: 10px;display: inline-block;">
							<p id="requestId" class="form-control-static"></p>
						</div>
					</div>
					<div class="row" style="margin-top:15px;margin-left:16px;">
						<label class="control-label">Submittedtime : </label>
						<div style="margin-left: 10px;display: inline-block;width:350px;">
							<p class="form-control-static"  id="nowTime"></p>
						</div>
					</div>
										-->
		<!-- 			<div class="row" style="margin-top:15px;margin-left:16px;">
						<label class="control-label">Run time : </label>
						<div style="margin-left: 10px;display: inline-block;width:350px;">
							<p class="form-control-static"  id="timing"></p>
						</div>
					</div>
					<div class="row" style="margin-top:15px;margin-left:16px;display: none" id="queryNetRow">
						<label class="control-label">Query Net : </label>
						<div style="margin-left: 10px;display: inline-block;width:350px;">
							<p class="form-control-static"  id="queryNet"></p>
						</div>
					</div>
					<div class="row" style="margin-top:15px;margin-left:16px;display: none;" id="queryNet1Row">
						<label class="control-label">Query Net1 : </label>
						<div style="margin-left: 10px;display: inline-block;width:350px;">
							<p class="form-control-static"  id="queryNet1"></p>
						</div>
					</div>
					<div class="row" style="margin-top:15px;margin-left:16px;display: none;" id="queryNet2Row">
						<label class="control-label">Query Net2 : </label>
						<div style="margin-left: 10px;display: inline-block;width:350px;">
							<p class="form-control-static"  id="queryNet2"></p>
						</div>
					</div>
					<div class="row" style="margin-top:15px;margin-left:16px;display: none;" id="libraryNetRow">
						<label class="control-label">Library Net : </label>
						<div style="margin-left: 10px;display: inline-block;width:350px;">
							<p class="form-control-static"  id="libraryNet"></p>
						</div>
					</div>
					<div class="row" style="margin-top:15px;margin-left:16px;">
						<label class="control-label">Similarity measures : </label>
						<div style="margin-left: 10px;display: inline-block;width:350px;">
							<p class="form-control-static"  id="similarityMeasures"></p>
						</div>
					</div>
					<div class="row" style="margin-top:15px;margin-left:16px;">
						<label class="control-label">Alignment algorithm : </label>
						<div style="margin-left: 10px;display: inline-block;width:350px;">
							<p class="form-control-static"  id="alignmentAlgorithm"></p>
						</div>
					</div>
					<div class="row" style="margin-top:15px;margin-left:16px;display: none;"id="permutationCyclesRow" >
						<label class="control-label">Permutation cycles : </label>
						<div style="margin-left: 10px;display: inline-block;width:350px;">
							<p class="form-control-static"  id="permutationCycles"></p>
						</div>
					</div>
					<div class="row" style="margin-top:15px;margin-left:16px;display:none;">
						<label class="control-label">Submitted at : </label>
						<div style="margin-left: 10px;display: inline-block;">
							<p class="form-control-static" id="startTime"></p>
						</div>
					</div> -->
				</div>
			</div>

		</div>
		<!-- end: Content -->
		<br><br><br>


	</div><!--/container-->


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

	<div class="clearfix"></div>
	<jsp:include page="login.jsp"></jsp:include>
			<!-- Footer -->
			</section>
			<!-- /Section -->

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



			<footer id="footer1" >
				<!-- Lower Footer -->
				<div id="lower-footer">

					<div class="row">

						<div class="col-lg-4 col-md-4 col-sm-4" style="opacity: 1;width: 100%;">

							<div align="center">
<!--  								 <p class="copyright">NFP is supported by a grant from National Nature Science Foundation of China.
 --> 								 <p class="copyright">NFPscanner is supported by a grant from National Nature Science Foundation of China.
								 </p>
								 <p class="copyright">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Copyright © 2015-2016 Beijing Institute of Radiation Medicine</p>
 								</div>

						</div>


					</div>

				</div>
				<!-- /Lower Footer -->


			</footer>
			<!-- /Footer -->
	<script src="rweb/assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="rweb/assets/js/bootstrap.min.js"></script>
	<script src="static/js/networksimilarityContact.js"></script>
		<script src="rweb/js/bootstrap-validator/jqBootstrapValidation.js"></script>
<script>
			var ID = '<%=request.getParameter("id")%>';
			var ID1 = '<%=request.getParameter("id")%>';
			ID = decrypt(ID,"nfs");
			//alert(ID);
		   function run() {
			   $.ajax({
			 	   type: "POST",
			 	   async: true,
			 	   url: "networkconfusion/getStatusById.form",
			 	  // data: {id: $("#resultNav", window.parent.document).attr("saveId")},
			 	  data: {id:ID},
			 	   success: function(msg){
			 		   if(msg.status == 2){
			 			  // p = 100;
			 			  $("#li3").removeClass("ui-step-active");
			 			  $("#li2").addClass("ui-step-done");
						  $("#li3").addClass("ui-step-done");
						  $("#li4").addClass("ui-step-active");
			 			  window.location.href = 'networksimilarityResult_2?id=' + encrypt(ID,"nfs");
			 			}else{
			 				var timer = setTimeout("run()", 500);
			 			}
				 	}
				});
		   }
		$(document).ready(function(){

            checkResult();
            //submitPairwise_result();

	      //  showStartTime();
		});



		function stringToJsTime_(timeString) {
		    var y = timeString.substring(0,4);
		    var m = timeString.substring(5,7)-1;
		    var d = timeString.substring(8,10);
		    var h = timeString.substring(11,13);
		    var mm = timeString.substring(14,16);
		    var ss = timeString.substring(17,19);
		    var time = new Date(y,m,d,h,mm,ss,0);
		    return time;
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
		   /*      if(hours.length<2){
		        	hours = '0'+hours;
		        }
		        if(minutes.length<2){
		        	minutes = '0'+minutes;
		        }
		        if(seconds.length<2){
		        	seconds = '0'+seconds;
		        } */
		        showTiming2(hours,minutes,seconds);
		     //   $("#timing").html(hours+":"+minutes+":"+seconds);
		}
		function checkResult(){
			console.log(ID);
			   $.ajax({
			 	   type: "POST",
			 	   async: true,
			 	   url: "networkconfusion/getStatusById.form",
			 	  data: {id:ID},
			 	   success: function(msg){
			 		   console.log("开始");
			 		  console.log(msg);
			 			var nowTime = msg.start_time;
			 			$("#nowTime").text(nowTime);
			 			var endTime = msg.nowTime;
			 		/* 	if(msg.start_time==null||msg.start_time==undefined||msg.start_time==""){
			 				nowTime = getNowFormatDate();
			 				 showTiming(); */
			 			//}else{
			 				var start = stringToJsTime_(nowTime);
							var end = stringToJsTime_(endTime);
							dateminus(start,end);
			 			//}

						



			 		   if(msg.status == 2){
			 			  $("#li3").removeClass("ui-step-active");
			 			  $("#li2").addClass("ui-step-done");
						  $("#li3").addClass("ui-step-done");
						  $("#li4").addClass("ui-step-active");

			 			  window.location.href = 'networksimilarityResult_2?id=' + encrypt(ID,"nfs");
			 			}else if (msg.status == 0||msg.status==null||msg.status==undefined){
			 				$("body", window.parent.document).scrollTop(0);

			 				//$("#requestId").html($('#resultNav', window.parent.document).attr("jobtitle"));
			 				//$("#inputedEmail").html($('#resultNav', window.parent.document).attr("email"));
			 				$.ajax({
			 				 	   type: "POST",
			 				 	   async: true,
			 				 	   url: "networkconfusion/getProjectInfoById.form",
			 				 	   data: {id:ID},
			 				 	   success: function(msg){
			 							console.log(msg);
			 							var data = msg.data;
			 							//$("#requestId").html(data[0]);
			 								$("#inputedEmail").html(data[4]);
			 								if(data[4]==null||data[4]==undefined||data[4]==""){
			 									$("#emailRow").hide();
			 									}
			 								else{
			 									$("#emailRow").show();
			 								}
			 								fullParameters(msg.parameters);
			 					  }
			 				});
			 	           // run();

			 				  getQueue();
							parameterDispose();
			 			}else if(msg.status == 1){
			 				$("#li1").removeClass("ui-step-active");
							$("#li1").addClass("ui-step-done");
							setCss('i1');
							$("#i1").addClass('iconfont ');
							$("#i1").html('&#xF029;');
							$("#li2").addClass("ui-step-active");
							var data = JSON.parse(sessionStorage.getItem("pairwiseinfo"));
							if(data!=null&&data!=undefined){
								$("#requestId").html(ID1);
							}else{
								$("#requestId").html(ID1);
							}
							$("#li2").removeClass("ui-step-active");
							$("#li2").addClass("ui-step-done");
							setCss('i2');
							$("#i2").addClass('iconfont ');
							$("#i2").html('&#xF029;');
							$("#li3").addClass("ui-step-active");
			 				var timer = setTimeout("checkResult()", 10000);
							fullParameters(msg.parameters);
			 			}
				 	},error:function(data){
				 		/* if(XMLHttpRequest.status!=500){
			 				showTip("An error occurs, please contact nfs_admin@163.com");
			 		  } */
				 	}
				});
		}

		//===============================
		function getQueue(){
		//	var timer = setInterval(function() {
				$("#li1").removeClass("ui-step-active");
				$("#li1").addClass("ui-step-done");
				setCss('i1');
				$("#i1").addClass('iconfont ');
				$("#i1").html('&#xF029;');
				$("#li2").addClass("ui-step-active");
				var data = JSON.parse(sessionStorage.getItem("pairwiseinfo"));
				if(data!=null&&data!=undefined){
					$("#requestId").html(ID1);
				}else{
					$("#requestId").html(ID1);
				}

				$.ajax({
				 	   type: "POST",
				 	   async: true,
				 	   url: "networkconfusion/getQueue.form",
				 	   success: function(msg){
							console.log(msg);
							//if(msg.num<6){
								if(data!=null&&data!=undefined){
									//clearInterval(timer);
									submitPairwise_result(data);
								}else{
									$("#li2").removeClass("ui-step-active");
									$("#li2").addClass("ui-step-done");
									setCss('i2');
									$("#i2").addClass('iconfont ');
									$("#i2").html('&#xF029;');
									$("#li3").addClass("ui-step-active");
								}


						/* 	}else{

								var timer = setTimeout("getQueue()", 10000);
							} */
					  },error:function(data){
						 /*  if(XMLHttpRequest.status!=500){
				 				showTip("An error occurs, please contact nfs_admin@163.com");
				 		  } */
					 	}
				});

				//
	       // }, 10000);<a href="data/networksimilarity/saveData/6c29072e900e31d7eb717ed6f50d20e4aaf84e1d46a0c40116d4f4.zip" class="btn btn-info" style="display:none;" onclick="javascript:void(0)"><i class="fa fa-print"></i> Download</a>
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
/* 					net += "<a href='data/networksimilarity/saveData/"+ID+"/"+nets[i]+"' onclick='javascript:void(0)'>"+nets[i]+"</a>&nbsp;";
 */					net += "<a href='data/networksimilarity/saveData/"+ID+"/"+nets[i]+"' onclick='javascript:void(0)'>"+nets[i];
					if(i<nets.length-1) net+="</a>&nbsp;&nbsp;<span class='glyphicon glyphicon-resize-horizontal'></span>&nbsp;&nbsp;";
				}

/* 				$("#similarityMeasures").html(data.similarityMeasures);
 */				console.log();
				$("#similarityMeasures").html(similarityMeasures);
				$("#alignmentAlgorithm").html(data.alignmentAlgorithm);
/* 				$("#permutationCycles").html(data.permutationCycles);
 */				$("#permutationCycles").html(permutationCycles);
				$("#queryNet").html(net);
				$("#libraryNet").html("<a href='networksimilaritystatistical?libraryNet="+data.libraryNet+"' >"+data.libraryNet+"</a>");
				$("#queryNetRow").show();
				$("#libraryNetRow").show();
				$("#permutationCyclesRow").show();

			}else if(data.type==1){

/* 				$("#similarityMeasures").html(data.similarityMeasures);
 */				$("#similarityMeasures").html(similarityMeasures);
				$("#alignmentAlgorithm").html(data.alignmentAlgorithm);
			/* 	$("#queryNet1").html(data.queryNet1);
				$("#queryNet2").html(data.queryNet2); */
				$("#queryNet1").html( "<a href='data/networksimilarity/saveData/"+ID+"/"+data.queryNet1+"' onclick='javascript:void(0)'>"+data.queryNet1+"</a>&nbsp;");
				$("#queryNet2").html("<a href='data/networksimilarity/saveData/"+ID+"/"+data.queryNet2+"' onclick='javascript:void(0)'>"+data.queryNet2+"</a>&nbsp;");
				$("#queryNet1Row").show();
				$("#queryNet2Row").show();

			}
		}
		//
		function parameterDispose(){
			var data1 = JSON.parse(sessionStorage.getItem("pairwiseinfo"));
			var data2 = JSON.parse(sessionStorage.getItem("advancedInfo"));
			var arr1 = new Array();
			arr1[0] = data1[3];
			arr1[1] = data1[0];
			if(data1[0]==2){
				var queryNet = data1[10];
				var nets = queryNet.split(",");
				var net = "";
				for(var i=0;i<nets.length;i++){
					net += "<a href='data/networksimilarity/saveData/"+ID+"/"+nets[i]+"' onclick='javascript:void(0)'>"+nets[i]+"</a>&nbsp;";
				}
				$("#similarityMeasures").html(data2[2]);
				$("#alignmentAlgorithm").html(data2[0]);
				$("#permutationCycles").html(data1[6]);
				$("#queryNet").html(net);
				$("#libraryNet").html("<a href='networksimilaritystatistical?libraryNet="+data1[11]+"' >"+data1[11]+"</a>");
				$("#queryNetRow").show();
				$("#libraryNetRow").show();
				$("#permutationCyclesRow").show();
				arr1[2] = data2[2];
				arr1[3] = data2[0];
				arr1[4] = data1[10];
				arr1[5] = data1[11];
				arr1[6] = data1[6];
			}else if(data1[0]==1){
				$("#similarityMeasures").html(data2[2]);
				$("#alignmentAlgorithm").html(data2[0]);
				$("#queryNet1").html("<a href='data/networksimilarity/saveData/"+ID+"/"+data1[7]+"' onclick='javascript:void(0)'>"+data1[7]+"</a>&nbsp;");
				$("#queryNet2").html("<a href='data/networksimilarity/saveData/"+ID+"/"+data1[8]+"' onclick='javascript:void(0)'>"+data1[8]+"</a>&nbsp;");
				$("#queryNet1Row").show();
				$("#queryNet2Row").show();
				arr1[2] = data2[2];
				arr1[3] = data2[0];
				arr1[4] = data1[7];
				arr1[5] = data1[8];
			}
			var parameterArrStr = JSON.stringify(arr1);
					$.ajax({
					 	   type: "POST",
					 	   url: "networkconfusion/saveParameter.form",
					 	   data: {parameters:parameterArrStr},
					 	   success: function(msg){

					 	   },error:function(data){
					 		/*   if(XMLHttpRequest.status!=500){
					 				showTip("An error occurs, please contact nfs_admin@163.com");
					 		  } */
						 	}
					});
		}




		//===============================
		function submitPairwise_result(data1){
			var data = data1;

			//var timer = setInterval(function() {
					$("#li2").removeClass("ui-step-active");
					$("#li2").addClass("ui-step-done");
					setCss('i2');
					$("#i2").addClass('iconfont ');
					$("#i2").html('&#xF029;');
					$("#li3").addClass("ui-step-active");
				//console.log(data[0]);
				var type = data[0];
				var advancedInfo = sessionStorage.getItem("advancedInfo");
			 	if(type == 1){
				//	sessionStorage.setItem("pairwiseinfo",JSON.stringify(arr1));


					$.ajax({
					 	   type: "POST",
					 	   async: true,
					 	   url: "networkconfusion/submitPairwise.form",
					 	   data: {email:data[1],otherinfo:encrypt(ID,"nfs"),title:data[2],id:data[3],idType:data[4],inline:data[5],cycle:data[6],advancedInfo:advancedInfo},
					 	   success: function(msg){
					 		   if(msg.state=='succeed'){
					 			  //clearInterval(timer);
					 			  $("#li3").addClass("ui-step-active");
					 			  $("#li2").addClass("ui-step-done");
								 //$("#li3").addClass("ui-step-done");
									//setCss('i3');
									//$("#i3").addClass('iconfont ');
								//	$("#i3").html('&#xF029;');
								  //$("#li4").addClass("ui-step-active");
					 			//  window.location.href = 'networksimilarityResult_2?runtime='+$("#timing").text()+'&id=' + encrypt(ID,"nfs");
								
									//run();
					 		   }else if(msg.state=='Queued'){
									$("#li2").addClass("ui-step-active");
					 		   }
					 		  var timer = setTimeout("checkResult()", 10000);
					 	   },error:function(XMLHttpRequest, textStatus, errorThrown){
					 		  if(XMLHttpRequest.status==504){
					 			 checkResult();
					 		  }else if(XMLHttpRequest.status!=500){
					 				//showTip("An error occurs, please contact nfs_admin@163.com");
					 		  }


						 	}
					});
				}else if(type == 2){
					$.ajax({
					 	   type: "POST",
					 	   async: true,
					 	   url: "networkconfusion/submitPathway.form",
					 	   data: {num:data[7],email:data[1],title:data[2],otherinfo:encrypt(ID,"nfs"),refnet:data[8],id:data[3],idType:data[4],inline:data[5],cycle:data[6],advancedInfo:advancedInfo,example:data[9]},
					 	   success: function(msg){
							   if(msg.state=='succeed'){
								 //  clearInterval(timer);
								   $("#li3").addClass("ui-step-active");
						 			  $("#li2").addClass("ui-step-done");
							/* 		  $("#li3").addClass("ui-step-done");
										setCss('i3');
										$("#i3").addClass('iconfont ');
										$("#i3").html('&#xF029;');
									  $("#li4").addClass("ui-step-active");
						 			  window.location.href = 'networksimilarityResult_2?runtime='+$("#timing").text()+'&id=' + encrypt(ID,"nfs"); */
						 			
									//run();
					 		   }else if(msg.state=='Queued'){
									$("#li2").addClass("ui-step-active");
					 		   }
							   var timer = setTimeout("checkResult()", 10000);
					 	   },error:function(XMLHttpRequest, textStatus, errorThrown){
					 		  if(XMLHttpRequest.status==504){
						 			 checkResult();
						 		  }else if(XMLHttpRequest.status!=500){
						 				//showTip("An error occurs, please contact nfs_admin@163.com");
						 		  }
						 	}
					});
				}
		}



		function  showStartTime(){
			var time =formatDate((new Date()),"yyyy-MM-dd hh:mm:ss") ;
			$("#startTime").html(time);
		}

		  //格式化日期,
	      function formatDate(date,format){
	        var paddNum = function(num){
	          num += "";
	          return num.replace(/^(\d)$/,"0$1");
	        }
	        //指定格式字符
	        var cfg = {
	           yyyy : date.getFullYear() //年 : 4位
	          ,yy : date.getFullYear().toString().substring(2)//年 : 2位
	          ,M  : date.getMonth() + 1  //月 : 如果1位的时候不补0
	          ,MM : paddNum(date.getMonth() + 1) //月 : 如果1位的时候补0
	          ,d  : date.getDate()   //日 : 如果1位的时候不补0
	          ,dd : paddNum(date.getDate())//日 : 如果1位的时候补0
	          ,hh : date.getHours()  //时
	          ,mm : date.getMinutes() //分
	          ,ss : date.getSeconds() //秒
	        }
	        format || (format = "yyyy-MM-dd hh:mm:ss");
	        return format.replace(/([a-z])(\1)*/ig,function(m){return cfg[m];});
	      }

	      //格式化CST日期的字串
	      function formatCSTDate(strDate,format){
	        return formatDate(new Date(strDate),format);
	      }

	      function showTiming2(h,m,s){
	    	  var HH = h;
	    	  var mm = m;
	    	  var ss = s;
	    	  var str = '';
	    	  var timer = setInterval(function(){
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
	    	  },1000);
	      }

	      function showTiming(){
	    	  var HH = 0;
	    	  var mm = 0;
	    	  var ss = 0;
	    	  var str = '';
	    	  var timer = setInterval(function(){
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
	    	  },1000);
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

		function setCss(id){
			$("#"+id).css('background','transparent');
			$("#"+id).css('font-size','12px');
			$("#"+id).css('font-style','normal');
			$("#"+id).css('left','17px');
			$("#"+id).css('line-height','12px');
			$("#"+id).css('padding','0');
			$("#"+id).css('text-shadow','none');
			$("#"+id).css('top','9px');
			$("#"+id).css('color','white');

		}

		function showTip(info){
			$("#tipInfo").html(info);
			$("#tipModal").modal('show');

		}

		function getNowFormatDate() {
		    var date = new Date();
		    var seperator1 = "-";
		    var seperator2 = ":";
		    var month = date.getMonth() + 1;
		    var strDate = date.getDate();
		    if (month >= 1 && month <= 9) {
		        month = "0" + month;
		    }
		    if (strDate >= 0 && strDate <= 9) {
		        strDate = "0" + strDate;
		    }
		    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
		            + " " + date.getHours() + seperator2 + date.getMinutes()
		            + seperator2 + date.getSeconds();
		    return currentdate;
		}
	</script>

</body>
</html>
