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
		
		<link rel="shortcut icon" href="static/image/w1.png" />
		<link href="rweb/css/header.css"  type="text/css" rel="stylesheet">	
		<link href="rweb/assets/css/font-awesome.min.css" rel="stylesheet">
	    <link href="rweb/assets/css/style.min.css" rel="stylesheet">
		<link href="rweb/assets/css/style.css" rel="stylesheet" type="text/css">	
		<link href="rweb/css/header.css"  type="text/css" rel="stylesheet">	
		<link href="rweb/css/comment.css" rel="stylesheet">	
		<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">	
		<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.9.1/bootstrap-table.min.css">
		<script>
			if (navigator.userAgent.split(";")[1].toLowerCase().indexOf("msie") > 0 ){
				window.location.href = "supportInfo";
			}
		</script>
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

<body style="font-size:medium; line-height: 1.5em">
	<div class="container" >
			<header id="" class="sticky-header" style="opacity: 1;padding:0;">
				<div id="main-header" style="height: 80px;">
					<div id="logo" class="col-lg-12 col-md-12 col-sm-12">
							<img src="static/image/b2.png" style="width: 110px;margin-top: -20px;margin-right: -20px;"/>
							<span style="color:white;font-size:33px;margin-top: 1px;">Network Fingerprint Scanner</span> 
							<span style="color: white; font-size: 15px; top: 28px; margin-left: 5px;">NFPscanner:a server for knowledge-based characterization of biomedical networks
</span> 
					</div>
					
				</div>
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
						<li >
							<a class="fa " href="networksimilarityHome.html">Home</a>
						</li>
						<li  style="width: 300px;">
							<a class="fa  " href="networksimilarityAnalysis?type=1">Network Fingerprint Scan</a>
						</li>
						<li style="width: 250px;">
							<a class="fa  " href="networksimilarityAnalysis?type=2">Pairwise Alignment</a>
						</li>
						<li class="current-menu-item">
						
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
						<li>
							<a class="fa  " href="networksimilarityHelp">Help</a>
							
						</li>
						<li>
								<a class="fa  " href="networksimilarityContact">Contact</a>
						</li>
					</ul>
					
					</div>
					
				</div>
			</header>
			<section class="section full-width-bg" style="padding-top:20px;">
				<ol class="breadcrumb" id="breadcrumb" style="margin:10px 0 0 0;display: none;">
					<li><a style="font-size: 15px;">Resource</a></li>
					<li><span id="analysisName" style="font-size: 15px;">Statistics of current release</span></li>
				</ol>
				<div class="row" style="margin-top: 15px;">
					<div class="col-md-12">
						<div class="panel panel-info">
							<div class="panel-heading" style="background: #337ab7;">
								<strong><font color="white">Library of basic networks:</font></strong>
							</div>	
							<div class="panel-body" style="padding:0;">
								<div style="height: 555px;">
									<table id="systemRefNet" class="table table-striped table-bordered table-condensed">
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
		</section>

			<!-- Footer -->
			<footer id="footer1" >	
				<!-- Lower Footer -->
				<div id="lower-footer">
			
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
				
			
			</footer>
			<!-- /Footer -->
			</div>
	<div class="modal fade" id="tipModal2222" style="top:15%;" tabindex="-1" role="dialog" aria-labelledby="selectFileModalLabel">
	  <div class="modal-dialog" style="border:none;width: 1000px;" role="document" >
		<div class="box border">
			<div class="box-title">
				<h4><i class="fa fa-check-square-o"></i>Tip</h4>
				<div class="tools">
					<a href="javascript:;" data-dismiss="modal" aria-label="Close" class="remove">
						<i class="fa fa-times"></i>
					</a>
				</div>
			</div>
			<div class="box-body">
				<form class="form-horizontal" role="form">
                    <div class="form-group"  align="center">
                       <div style='height: 450px;width: 999px;'>
                       		<table id='systemContent' class='table table-striped table-bordered table-condensed'></table>
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
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.1.min.js"></script>
	<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.9.1/bootstrap-table.min.js"></script>
	<script src="static/js/SystemRefNet.js"></script>
	<script>
	var libraryNet = '<%=request.getParameter("libraryNet")%>';
	
	</script>
</body>
</html>