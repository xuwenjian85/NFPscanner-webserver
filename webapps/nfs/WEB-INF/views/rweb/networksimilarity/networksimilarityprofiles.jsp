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
		<link rel="shortcut icon" href="static/image/w1.png" />
<!-- 		<link rel="shortcut icon" type="image/x-icon" href="rweb/assets/img/favicon.ico">   
 -->		<script src="rweb/assets/js/jquery-2.1.1.min.js"></script>
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
		<link href="rweb/js/bootstrap-fileinput/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
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

<body style="padding-top: 142px;background: #fff;padding-bottom:0px;">
	
		<!-- Header -->
			<header id="header" class="sticky-header" style="opacity: 1;padding:0;">
				
				<!-- Main Header -->
				<div id="main-header" style="height: 80px;">
					<div id="logo" class="col-lg-12 col-md-12 col-sm-12">
							
							<a href="networksimilarityHome"><img src="rweb/assets/img/logo.png" alt="Logo"></a>
							<span style="color:white;font-size:15px;position:absolute;top:30px;">
							NFPscanner:a server for knowledge-based characterization of biomedical networks
							</span>
							 <span style="position:absolute;right:10;top:6;display: none;">
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
						
							<a class="fa " href="networksimilarityHome">Home</a>
							
							
						</li>
						<!-- /home -->
						
						<!-- Events -->

						<li  style="width: 300px;">
							<a class="fa  " href="networksimilarityAnalysis?type=2">Network Fingerprint Scan</a>
						</li>
						<li style="width: 250px;">
							<a class="fa  " href="networksimilarityAnalysis?type=1">Pairwise Alignment</a>
						</li>

						<!-- /Events -->
						
			
						
						
						
						<!-- Features -->
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
						<!-- /Features -->
						
						<!-- Get Involved -->
						<li>
							<a class="fa " href="networksimilarityHelp">Help</a>
						</li>
						<!-- /Get Involved -->
						
						<!-- CONTACT -->
						<li >
							<a class="fa  " href="networksimilarityContact">Contact</a>
						</li>
						<!-- /CONTACT -->
						
					</ul>
					
					</div>
					
				</div>
				<!-- /Lower Header -->
				
				
			</header>
			<!-- /Header -->
		<section id="content"  >
		<div class="container" style="height: 100%">
				<ol class="breadcrumb" id="breadcrumb" style="margin:10px 0 0 0;">
					<li><!-- <i class="fa fa-edit"></i> --><a  style="font-size: 15px;">Resource</a></li>
					<li><!-- <i class="fa fa-th"></i> --><span id="analysisName"  style="font-size: 15px;">My Profiles</span></li>
				</ol>
				<div class="row" style="margin-top:15px;">
					<div class="col-md-12">
						<div class="panel panel-info">
							<div class="panel-heading" style="background: #337ab7;">
								<font color="white">
								Ref Net</font>
							</div>	
							<div class="panel-body">
								<div class="col-md-6">
									<label class="control-label">Add New Ref Net</label>
									<input id="inputfile" type="file" class="file" accept=".graphml" data-show-preview="false" multiple="true" data-show-upload="true" data-show-caption="true">
								</div>
								<div class="col-md-6">
									<select style="height:200px;" class="form-control" multiple="">
										<optgroup label="System Library" id="systemLibOpt">
                                            <!--<option value="AK">Alaska</option>
                                            <option value="HI">Hawaii</option> -->
                                        </optgroup>
                                        <optgroup label="User Library" id="userLibOpt">
                                            <!--<option value="CA">California</option>
                                            <option value="NV">Nevada</option>
                                            <option value="OR">Oregon</option>
                                            <option value="WA">Washington</option> -->
										</optgroup>
			                         </select>
								</div>
							</div>	
						</div>
					</div>
				</div>
			
					</div>
	<div class="modal fade" id="myModal" style="top:25%;    width: 500px;margin: 0 auto;" tabindex="-1" role="dialog">
	  <div class="modal-dialog" style="border:none;" role="document">
		<div class="box border">
			<div class="box-title">
				<h4><i class="fa fa-check-square-o"></i>Input Data Name</h4>
				<div class="tools">
					<a href="javascript:;" data-dismiss="modal" aria-label="Close" class="remove">
						<i class="fa fa-times"></i>
					</a>
				</div>
			</div>
			<div class="box-body">
				<form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label class="col-md-3 control-label">Data Name</label>
                        <div class="col-md-9">
                            <input type="text" id="dataname" value="" style="width:320px;" class="form-control">
                        </div>
                    </div>
                </form>
				<div class="modal-footer" style="padding: 10px 0 0 0;margin-top:0px;">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" onclick="uploadRdata()">OK</button>
				</div>
			</div>
		</div>
	  </div>
	</div>	
	<div class="modal fade" id="tipModal" style="top:15%;" tabindex="-1" role="dialog" aria-labelledby="selectFileModalLabel">
	  <div class="modal-dialog" style="border:none;width: 400px;" role="document" >
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
	<jsp:include page="login.jsp"></jsp:include>

		</section>
		
		<!-- Footer -->
			<footer id="footer2"  >	
				<!-- Lower Footer -->
				<div id="lower-footer">
								<div style="margin-left: 98%">											<script type="text/javascript" src="//ra.revolvermaps.com/0/0/3.js?i=0eu6839u0la&amp;b=0&amp;s=26&amp;m=2&amp;cl=ffffff&amp;co=010020&amp;cd=aa0000&amp;v0=60&amp;v1=60&amp;r=1" async="async"></script>
				</div>
					<div class="row">
						
						<div class="col-lg-4 col-md-4 col-sm-4" style="opacity: 1;width: 100%;">
						
<!-- 							<p class="copyright">© 2014 Candidate. All Rights Reserved.More Templates <a href="http://www.baidu.com/" target="_blank" title="模板">testtt</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">template</a></p>
 -->							<div align="center">
 								 <p class="copyright">NFP is supported by a grant from National Nature Science Foundation of China.
								 </p>
								 <p class="copyright">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Copyright © 2015-2016 Beijing Institute of Radiation Medicine</p>
 								</div>

						</div>
						
						
					</div>
					
				</div>
				<!-- /Lower Footer -->
				
			
			</footer>
			<!-- /Footer -->
	<%--<div id="usage" style="padding:0;text-align:center;">
		<div class="title" style="display:inline-block;line-height: 40px;">长沙瀚云信息技术有限公司</div>
		<div class="desc" style="display:inline-block;line-height: 40px;margin-left: 45px;">网络访问量统计</div>
	</div>		
	--%><!-- start: JavaScript-->
	<script src="rweb/assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="rweb/assets/js/bootstrap.min.js"></script>	
	<script src="rweb/js/bootstrap-fileinput/js/fileinput.min.js"></script>
	<!-- end: JavaScript-->
	<script type="text/javascript">
	$(document).ready(function(){
		$(".fileinput-upload").on('click', function(event) {
			$("#dataname").val("myprofile");
			$("#myModal").modal('show');
		});
		showLibrary();
	});
	function uploadRdata(){
		$("#myModal").modal('hide');
		var rdataname = $("#dataname").val();
		var files = document.getElementById("inputfile").files;
/* 		alert(files.length);
		return; */
		var num = files.length;
		check();
		var flag = false;
		for(var i=1;i<=files.length;i++){
			if(i == files.length){
				flag = true;
			}else{
				flag = false;
			}
			ajaxFileUpload(i,flag,rdataname,num);
		}
	}
	function ajaxFileUpload(type,flag,rdataname,num) {
		var filename = "customized_net" + type + ".graphml"; 
		var fileObj = document.getElementById("inputfile").files[type-1]; // js 获取文件对象
	    var FileController = "networksimilarity/uploadLib.form";                    // 接收上传文件的后台地址 
	    // FormData 对象
	    var form = new FormData();
	    form.append("type", type); 
	    form.append("filename", filename);                        // 可以增加表单数据
	    form.append("file", fileObj); 
	    form.append("flag", flag);
	    form.append("rdataname", rdataname);
	    form.append("num",num);
	    // 文件对象
	    // XMLHttpRequest 对象
	    var xhr = new XMLHttpRequest();
	    xhr.open("post", FileController, true);
	    xhr.onload = function (msg) {
	       var data = JSON.parse(msg.currentTarget.responseText).data;
	       if(data == 'success'){
				if(flag){
					showLibrary();
				}
				showTip("succeed!");
	       }
	    };
	    //xhr.upload.addEventListener("progress", progressFunction, false);
	    xhr.send(form);
	}
	function showLibrary(){
		$.ajax({
		 	   type: "POST",
		 	   url: "networkconfusion/getAllLibrary.form",
		 	   success: function(msg){
		 		   console.log(msg)
		 		   var usrlib = msg.user;
		 		   var syslib = msg.system;
		 		   var usrstr = "";
		 		   var sysstr = "";
		 		   for(var i=0;i<usrlib.length;i++){
		 			  usrstr += "<option title='" + usrlib[i][2] + " net' value='" + usrlib[i][1] + "'>" + usrlib[i][0] + "</option>";
		 		   }
		 		   for(var i=0;i<syslib.length;i++){
		 			  sysstr += "<option title='" + syslib[i][2] + "' value='" + syslib[i][1] + "'>" + syslib[i][0] + "</option>";
		 		   }
		 		   $("#userLibOpt").html(usrstr);
		 		   $("#systemLibOpt").html(sysstr);
		 	   }
		});
	}
	
function showTip(info){
	$("#tipInfo").html(info);
	$("#tipModal").modal('show');

}

    function check() {  
        var f = document.getElementById("inputfile").files;  
        console.log(f.length);
		for(var i=0;i<f.length;i++){
			if(f[i].size>1*1024*1024){ 
				var tipInfo = f[0].name +" file is too large!Less than 1 MB file please upload again!";
				showTip(tipInfo);
				return;
			}
		}
		
        //上次修改时间  
        //alert(f[0].lastModifiedDate);  
        //名称  
        //alert(f[0].name);  
        //大小 字节  
        //alert(f[0].size);  
        //类型  
      //  alert(f[0].type);  
    } 
	</script>
</body>
</html>