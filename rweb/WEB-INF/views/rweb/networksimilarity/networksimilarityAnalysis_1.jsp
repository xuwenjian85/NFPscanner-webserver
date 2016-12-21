<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
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
	    <!-- Css files -->
	    <link href="rweb/assets/css/bootstrap.min.css" rel="stylesheet">			
		<link href="rweb/assets/css/font-awesome.min.css" rel="stylesheet">    
	    <link href="rweb/assets/css/style.min.css" rel="stylesheet">		
		<link rel="stylesheet" type="text/css" href="rweb/assets/js/bootstrap-fileupload/bootstrap-fileupload.min.css" />
		<link href="rweb/css/header.css"  type="text/css" rel="stylesheet">	
		<script type="text/javascript" src="rweb/assets/js/bootstrap-fileupload/bootstrap-fileupload.min.js"></script>
		<script type="text/javascript" src="rweb/js/introjs/intro.js"></script>
		<link href="rweb/css/comment.css" rel="stylesheet">	
		<link href="rweb/js/introjs/introjs.css" rel="stylesheet">
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
			.node {
			  stroke: #fff;
			  stroke-width: 1.5px;
			}
			
			.link {
			  stroke: #999;
			  stroke-opacity: .6;
			}
		</style>
	</head>
</head>

<body>
		
	
	<div class="container-fluid content">		
		<!-- start: Content -->
		<div style="padding:0;margin-top:10px;background:#fff;">
			<div id="selectFileContent">
				<div class="row">	
					<div class="col-lg-12 col-md-12">
						<div class="panel panel-info fieldset">
						
							<div class="panel-heading">
								<i class="fa fa-refresh red"></i><h2><strong>Query Net1</strong></h2>	
								<div class="panel-actions">
									<a class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
								</div>			
							</div>
							
							<div class="panel-body" style="padding-left: 5px;padding-bottom: 0;">	
								<div class="row">	
									<div class="col-lg-6 col-md-6">
										<textarea rows="3" cols="5" id="textareaNet1" name="textarea" placeholder="Enter edge list,adjustim,igraph etc." class="countable form-control" data-limit="100" style="margin: 0px -0.5px 0px 0px; height: 300px; "></textarea>
										
									</div>
									<div class="col-lg-6 col-md-6" style="height:300px; border:1px dotted #ccc;padding-right:0;" id="previewNet1">
										<span style="margin-top:5px;display:inline-block;font-size:14px;">Preview network Area</span> 
									</div>
								</div>
								<div class="row">
									<form class="form-horizontal " action="#" style="margin-top:10px;">										  
										  <div class="form-group" style="margin-bottom:0;">
											 <label class="col-sm-3 control-label"><a onclick="loadSample(1)" style="margin-right:20px;cursor:pointer;">Load Sample</a>or Upload</label> 
											 <div class="col-md-2 col-sm-2">
												<div class="fileupload fileupload-new" onclick="showSelectFileModal(1)" style="margin-bottom:0;" data-provides="fileupload">
													<div class="input-group">
														<div class="input-group-btn">
															<a class="btn btn-default btn-file">
																<span class="fileupload-new" data-step="1" data-intro="select a file!">Select file</span>
																<span class="fileupload-exists">Change</span>
															</a><a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload">Remove</a>
														</div>
													</div>
												</div>
											 </div>
											 <div class="col-md-3 col-sm-3">
												
													<div class="form-group">
														<label class="control-label" for="input-small">ID Type : </label>
														<div style="display:inline-block;">
															<select class="form-control select2"> 
																	<option value="AL">A1BG</option>
																	<option value="AL">Alabama</option>
																	<option value="AR">Arkansas</option>
																	<option value="IL">Illinois</option>
																	<option value="IA">Iowa</option>
																	<option value="KS">Kansas</option>
																	<option value="KY">Kentucky</option>
																	<option value="LA">Louisiana</option>
																	<option value="MN">Minnesota</option>
																	<option value="MS">Mississippi</option>
																	<option value="MO">Missouri</option>
																	<option value="OK">Oklahoma</option>
																	<option value="SD">South Dakota</option>
																	<option value="TX">Texas</option>
																	<option value="TN">Tennessee</option>
																	<option value="WI">Wisconsin</option>
																
															</select>
														</div>
													</div>
												
											 </div>
										  </div>
										</form>
								</div>
							</div>
						</div>
					</div><!--/col-->
				</div><!--/row-->
			</div>		
			<div class="row" onclick="addMoreNet()">
				<label class="control-label" style="margin-left: 26px;font-size:16px;cursor: pointer;">
					<i class="fa fa-plus-circle blue"></i>
					<a>Add more Net</a>
				</label>
			</div>
			<div class="panel panel-default" data-step="2" data-intro="set parameters!">
				<div class="panel-heading">
					<h2><i class="fa fa-map-marker red"></i><strong>General Parameters</strong></h2>
					<div class="panel-actions">
						<a class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
					</div>	
				</div>
				<div class="panel-body">
					<div class="row">
						<label class="control-label col-md-3" style="margin-left:7px;line-height:34px;">Job title : </label>
						<input type="text" id="jobTitle" style="width:200px;display:inline-block;margin-left:10px;" name="text-input" class="form-control col-md-6">
					</div>
					<div class="row" style="margin-top:7px;">
						<label class="control-label col-md-3" style="margin-left:7px;">Program selection : </label>
						<div class="col-md-6">
							<label class="radio-inline" for="inline-radio1">
								<input type="radio" id="inline-radio1" name="inline-radios" value="option1"> One
							</label>
							<label class="radio-inline" for="inline-radio2">
								<input type="radio" id="inline-radio2" name="inline-radios" value="option2"> Two
							</label>
							<label class="radio-inline" for="inline-radio3">
								<input type="radio" id="inline-radio3" name="inline-radios" value="option3"> Three
							</label>
							<label class="radio-inline" for="inline-radio4">
								<input type="radio" id="inline-radio4" name="inline-radios" value="option4"> Four
							</label>
						</div>
					</div>
					<div class="row" style="margin-top:7px;margin-left:7px;">
						<form action="" method="post" class="form-horizontal ">
							<div class="form-group">
								<label class="control-label col-md-3" style="text-align:left;" for="input-small">Parameter cycle : </label>
								<div style="display:inline-block;" class="col-md-9">
									<select class="form-control select2" style="width:200px;"> 
											<option value="AL">100</option>
											<option value="AL">200</option>
											<option value="AR">500</option>
											<option value="IL">1000</option>
									</select>
								</div>
							</div>
			                <div class="form-group" style="margin-top:-12px;">
			                    <label class="control-label col-md-3" style="text-align:left;">Filters</label>
			                    <div class="col-md-9">
			                        <div class="checkbox" style="line-height:22px;">
			                            <label for="checkbox111">
			                            	<input type="checkbox" id="checkbox111" name="checkbox111" value="option1"> Skip unmatched 2PS
			                            </label>
			                        </div>
			                    </div>
			                </div>
						</form>
					</div>
					
				</div>

			</div>
			<div class="panel panel-default" data-step="3" data-intro="select a ref net to compare!">
				<div class="panel-heading">
					<h2><i class="fa fa-map-marker red"></i><strong>Refrence Database</strong></h2>
					<div class="panel-actions">
						<a class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
					</div>	
				</div>
				<div class="panel-body">
					<form action="" method="post" class="form-horizontal ">
							<div class="form-group">
								<label class="col-md-3 control-label" style="text-align: left;">Select a Ref Net:</label>
								<div class="col-md-6">
			                          <select id="refnetSelect" class="form-control" multiple style="width:200px;">
			                          		<optgroup label="System Library" id="systemLibOpt">
                                         	</optgroup>
			                          		<c:choose>
												<c:when test="${sessionScope.username != null}">
													<optgroup label="User Library" id="userLibOpt">
										 			</optgroup>
												</c:when>
												<c:otherwise>sss
												</c:otherwise>
											</c:choose>
			                             
                                         
			                          </select>
								</div>
							</div>
					</form>
				</div>
			</div>
			<div class="row" style="margin-top:15px;margin-left:16px;" data-step="4" data-intro="how to show the result!">
				<div>
                    <div style="display:inline-block;">
                        <div class="checkbox" style="line-height:22px;">
                            <label for="checkbox1s">
                            	<input type="checkbox" checked id="checkbox1s" name="checkbox1s" value="option1"> Show result in new window
                            </label>
                        </div>
                    </div>
                </div>
				<div class="form-group">
                    <div style="display:inline-block;">
                        <div class="checkbox" style="line-height:22px;">
                            <label for="checkbox1">
                            	<input type="checkbox" checked id="checkEmail" name="checkEmail" value="option1"> Notify me when job is done <input id="notifyemail" placeholder="...@qq.com" type="email" size="30" />
                            </label>
                        </div>
                    </div>
                </div>
			</div>
			<button style="margin-left:15px;" data-step="5" data-intro="click to run NFP!" type="button" class="btn btn-success" onclick="submitPairwise(2)"><i class="fa fa-magic"></i> Run NFP</button> <!-- compare 2 net to ... -->
		</div>
		</div>
		<!-- end: Content -->
	</div><!--/container-->
		
	
	<div class="modal fade" id="myModal" style="">
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
	<div class="modal fade" id="selectFileModal" style="top:15%;" tabindex="-1" role="dialog" aria-labelledby="selectFileModalLabel">
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
					<button type="button" class="btn btn-primary" onclick="submitUploadFile(2)">OK</button>
				</div>
			</div>
		</div>
	  </div>
	</div>	
		
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
	<script src="rweb/assets/plugins/touchpunch/jquery.ui.touch-punch.min.js"></script>
	<script src="rweb/assets/plugins/d3/d3.min.js"></script>	
	<!-- end: JavaScript-->
	<script src="rweb/js/pairwise.js"></script>
	<script type="text/javascript">
		var EMAIL = '<%=request.getSession().getAttribute("email")%>';
		$(document).ready(function(){
			if(EMAIL != 'null'){
				$("#notifyemail").val(EMAIL);
			}
			$("#jobTitle").val("title-" + generateId());
		});
		function startIntro(){
			introJs().start();
		}
		function generateId(){
			var d = new Date(),str = '';
			str += d.getFullYear();
			str  += d.getMonth() + 1;
			str  += (d.getDate() > 9 ? d.getDate() : "0"+ d.getDate());
			str += (d.getHours() >9 ? d.getHours() : "0"+ d.getHours());
			str  += (d.getMinutes() >9 ? d.getMinutes() : "0"+ d.getMinutes());
			str += (d.getSeconds() >9 ? d.getSeconds() : "0"+ d.getSeconds());
			str += d.getMilliseconds();
			var id = str;
			return id;
		}
	</script>
</body>
</html>