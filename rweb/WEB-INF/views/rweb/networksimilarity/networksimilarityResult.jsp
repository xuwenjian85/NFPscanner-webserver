<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
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

	    <!-- Css files -->
	    <link href="rweb/assets/css/bootstrap.min.css" rel="stylesheet">		
		<link href="rweb/assets/css/jquery.mmenu.css" rel="stylesheet">		
		<link href="rweb/assets/css/font-awesome.min.css" rel="stylesheet">
		<link href="rweb/assets/css/climacons-font.css" rel="stylesheet">
		<link href="rweb/assets/plugins/xcharts/css/xcharts.min.css" rel=" stylesheet">		
		<link href="rweb/assets/plugins/fullcalendar/css/fullcalendar.css" rel="stylesheet">
		<link href="rweb/assets/plugins/morris/css/morris.css" rel="stylesheet">
		<link href="rweb/assets/plugins/jquery-ui/css/jquery-ui-1.10.4.min.css" rel="stylesheet">
		<link href="rweb/assets/plugins/jvectormap/css/jquery-jvectormap-1.2.2.css" rel="stylesheet">	    
	    <link href="rweb/assets/css/style.min.css" rel="stylesheet">
		<link href="rweb/assets/css/add-ons.min.css" rel="stylesheet">		
		<link rel="stylesheet" type="text/css" href="rweb/assets/js/bootstrap-fileupload/bootstrap-fileupload.min.css" />
		<link href="rweb/css/header.css" rel="stylesheet">		
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

<body>

	
	<div class="container-fluid content">		
		<!-- start: Content -->
		<div class="main" style="padding:0;margin-top:10px;background:#fff;">
			<div class="alert alert-info">
				Text info: The NFP project is submitted!
				<span style="margin-left:50px;">
					<button type="reset" class="btn btn-sm btn-danger"><i class="fa fa-ban"></i> Cancel</button>
					<button type="submit" class="btn btn-sm btn-success"><i class="fa fa-dot-circle-o"></i> Edit and resubmit</button>
		        </span>     
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h2><i class="fa fa-map-marker red"></i><strong>Project Run Information</strong></h2>
					<div class="panel-actions">
						<a class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
					</div>	
				</div>
				<div class="panel-body">
					<div class="row" style="margin-top:15px;margin-left:16px;">
						<label class="control-label">Request ID : </label>
						<div style="margin-left: 10px;display: inline-block;">
							<p id="requestId" class="form-control-static"></p>
						</div>
					</div>
					<div class="row" style="margin-top:15px;margin-left:16px;">
						<label class="control-label">Status : </label>
						<div style="margin-left: 10px;display: inline-block;">
							<p class="form-control-static">calculating</p>
						</div>
					</div>
					<div class="row" style="margin-top:15px;margin-left:16px;">
						<label class="control-label">Progress : </label>
						<div style="margin-left: 10px;display: inline-block;width:350px;">
							<div class="progress progress-striped active" style="margin:0px;">
								<div class="progress-bar progress-bar-info" id="progressbar" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
									<span class="sr-only">100% Complete</span>
								</div>
							</div>
						</div>
					</div>
					<div class="row" style="margin-top:15px;margin-left:16px;">
						<label class="control-label">Submitted at : </label>
						<div style="margin-left: 10px;display: inline-block;">
							<p class="form-control-static">2015.8.13 17:16:50</p>
						</div>
					</div>
					<div class="row" style="margin-top:15px;margin-left:16px;">
						<label class="control-label">Current time : </label>
						<div style="margin-left: 10px;display: inline-block;">
							<p class="form-control-static">2015.8.13 17:25:50</p>
						</div>
					</div>
					<div class="row" style="margin-top:15px;margin-left:16px;">
						<label class="control-label">Time since submission : </label>
						<div style="margin-left: 10px;display: inline-block;">
							<p class="form-control-static">9 minutes</p>
						</div>
					</div>
					<div class="row" style="margin-top:15px;margin-left:16px;">
						<label class="control-label">Notification will be send to <span id="inputedEmail"></span></label>
						
					</div>
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
	
		
	<!-- start: JavaScript-->
	<!--[if !IE]>-->

			<script src="rweb/assets/js/jquery-2.1.1.min.js"></script>

	<!--<![endif]-->

	<!--[if IE]>
	
		<script src="rweb/assets/js/jquery-1.11.1.min.js"></script>
	
	<![endif]-->

	<!--[if !IE]>-->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='rweb/assets/js/jquery-2.1.1.min.js'>"+"<"+"/script>");
		</script>

	<!--<![endif]-->

	<!--[if IE]>
	
		<script type="text/javascript">
	 	window.jQuery || document.write("<script src='rweb/assets/js/jquery-1.11.1.min.js'>"+"<"+"/script>");
		</script>
		
	<![endif]-->
	<script src="rweb/assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="rweb/assets/js/bootstrap.min.js"></script>	
	
	
	<!-- page scripts -->
	<script src="rweb/assets/plugins/jquery-ui/js/jquery-ui-1.10.4.min.js"></script>


	
	
	<!-- theme scripts -->
	<script src="rweb/assets/plugins/d3/d3.min.js"></script>	
		
	
	<!-- end: JavaScript-->
	<script>
		   function run() {  
			   $.ajax({
			 	   type: "POST",
			 	   async: true,
			 	   url: "networkconfusion/getStatusById.form",
			 	   data: {id: $("#resultNav", window.parent.document).attr("saveId")},
			 	   success: function(msg){
			 		   if(msg.status == 2){
			 			   p = 100;
			 			   window.location.href = 'networksimilarityResult_2';
			 			}else{
			 				var timer = setTimeout("run()", 500); 
			 			}
				 	}	
				});
		   }  
		$(document).ready(function(){
			$("body", window.parent.document).scrollTop(0);
			$("#requestId").html($('#resultNav', window.parent.document).attr("jobtitle"));
			$("#inputedEmail").html($('#resultNav', window.parent.document).attr("email"));
            run();  
		});
	</script>
</body>
</html>