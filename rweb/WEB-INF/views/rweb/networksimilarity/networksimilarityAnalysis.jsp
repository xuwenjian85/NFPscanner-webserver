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
						<li class="current-menu-item">
						
							<a class="fa fa-puzzle-piece" id="topAnalysis" onclick="changeTab(1,this)">Analysis</a>
							
							<ul>
							
								
								<li><a id="analysis2" onclick="changeSubTab('networksimilarityAnalysis_1',this)">NetworkFingerPrint</a></li>
								<li><a id="analysis1" onclick="changeSubTab('networksimilarityAnalysis_3',this)">Pairwase Alignment</a></li>
							</ul>
							
						<div class="dropdown-button"></div></li>
						<!-- /Events -->
						
						<!-- Media -->
						<li>
						
							<a class="fa fa-sort-amount-desc" id="resultNav" onclick="changeTab(2,this);">Result</a>
							
						</li>
						<!-- /Media -->
						
						
						
						<!-- Get Involved -->
						<li>
							<a class="fa fa-info-circle" href="get-involved.html">Help</a>
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
				<ol class="breadcrumb" id="breadcrumb" style="margin:10px 0 0 0;">
					<li><i class="fa fa-edit"></i><a href="networksimilarityAnalysis">Analysis</a></li>
					<li><i class="fa fa-th"></i><span id="analysisName">NetworkFingerPrint</span></li>
					<span style="float:right;padding:0 10px;" class="btn btn-default" onclick="startIntro()">Tutorials</span>
				</ol>
				
				<iframe width="100%" onload="iFrameHeight('pariwiseIframe')" frameborder="no" scrolling="no" border="0" id="pariwiseIframe" src="networksimilarityAnalysis_1"></iframe>
				<iframe width="100%" style="display: none;" onload="iFrameHeight('resultIframe')" scrolling="no" frameborder="no" border="0" id="resultIframe" src="networksimilarityResult"></iframe>
		</section>
	</div>
	<div class="modal fade" id="selectFileModal" style="top:25%;margin:0 auto;width:520px;" tabindex="-1" role="dialog" aria-labelledby="selectFileModalLabel">
	  <div class="modal-dialog" style="border:none;" role="document">
		<div class="box border">
			<div class="box-title">
				<h4><i class="fa fa-check-square-o"></i>Upload File</h4>
				<div class="tools">
					<a href="javascript:;" data-dismiss="modal" aria-label="Close" class="remove">
						<i class="fa fa-times"></i>
					</a>
				</div>
			</div>
			<div class="box-body">
				<form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label class="col-md-3 control-label">Input File</label>
                        <div class="col-md-9">
                            <div class="fileupload fileupload-new" style="margin-bottom:0;" data-provides="fileupload">
                            	<span class="form-control fileupload-preview" style="float: left;width:150px;padding: 0 5px;" ></span>
								<div class="input-group">
									<div class="input-group-btn">
										<a class="btn btn-default btn-file">
											<span class="fileupload-new">Add file</span>
											<span class="fileupload-exists">Change</span>
											<input type="file" name="file" id="file" flag="0" class="file-input">
										</a>
										<a href="#" id="removeFileBtn" class="btn btn-danger fileupload-exists" data-dismiss="fileupload">Remove</a>
									</div>
									<%--<span class="fileupload-preview">data1.txt</span>
								--%></div>
							</div>
                        </div>
                    </div>
                </form>
				<div class="modal-footer" style="padding: 10px 0 0 0;margin-top:0px;">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="okUpload" flag="" onclick="submitUploadFile()">OK</button>
				</div>
			</div>
		</div>
	  </div>
	</div>	
	
	<!-- start: JavaScript-->
	<script src="rweb/assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="rweb/assets/js/bootstrap.min.js"></script>	
	<!-- end: JavaScript-->
	<script type="text/javascript">
	var REQUEST_TYPE = '<%=request.getParameter("type")%>';
	$(document).ready(function(){
		if(REQUEST_TYPE != null){
			$("#analysis" + REQUEST_TYPE).trigger("click");
		}
	});
	function iFrameHeight(id) {
		$("body").scrollTop(0);
	    var ifm = document.getElementById(id);
	    var subWeb = document.frames ? document.frames["iframe"].document : ifm.contentDocument;
	    if (ifm != null && subWeb != null) {
	         ifm.height = subWeb.body.scrollHeight;
	    }
	}
	function changeSubTab(type,obj){
		$("body").scrollTop(0);
		$("#topAnalysis").trigger("click");
		$("#pariwiseIframe").attr("src",type);
		$("#analysisName").html($(obj).text());
	}
	function changeTab(type,obj){
		$("body").scrollTop(0);
		if(type == 2){
			$("#pariwiseIframe,#breadcrumb").hide();
			$("#resultIframe").show();
			$("#resultIframe").attr("src","networksimilarityResult");
			$(obj).parent().prev().removeClass("current-menu-item");
			$(obj).parent().addClass("current-menu-item");
		}else{
			$("#resultIframe").hide();
			$("#pariwiseIframe,#breadcrumb").show();
			$(obj).parent().next().removeClass("current-menu-item");
			$(obj).parent().addClass("current-menu-item");
		}
	}
	function MyModal(str,type){
		$("#selectFileModal").modal(str);
		if(str == 'show'){
			$("#file").attr("flag",type);
			$("#okUpload").attr("flag",type);
		}
	}
	function submitUploadFile(){
		var type = $("#okUpload").attr("flag");
		$("#pariwiseIframe")[0].contentWindow.submitUploadFile(type);
	}
	function startIntro(){
		document.getElementById('pariwiseIframe').contentWindow.startIntro();
	}
	</script>
</body>
</html>