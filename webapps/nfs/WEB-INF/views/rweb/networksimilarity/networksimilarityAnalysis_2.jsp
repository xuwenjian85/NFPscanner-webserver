<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<h2>2</h2>
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
<!-- 		<link rel="shortcut icon" href="rweb/assets/ico/favicon.ico" type="image/x-icon" />
 -->
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
		<link rel="stylesheet" type="text/css" href="rweb/css/header.css" />
		<script type="text/javascript" src="assetsjs/bootstrap-fileupload/bootstrap-fileupload.min.js"></script>
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
		<div class="" style="padding:0;margin-top:10px;background:#fff;">
			<div class="row">
				<div class="col-lg-12 col-md-12">
					<fieldset>
						<legend>
							<h2 style="margin-top:5px;"><strong>Query Net</strong>
								<i style="margin-left:10px;" class="fa fa-question-circle blue"></i>
							</h2>
						</legend>
						<div style="display:inline-block;float: right;margin-top:-20px;">
							<span class="action-item">
							   <a>Load Sample</a>
							</span>
							<span class="action-item" style="border:0;">
								<a>Clear</a>
							</span>
						</div>
						<div class="row">
							<div class="col-lg-6 col-md-6">
								<textarea rows="3" cols="5" name="textarea" placeholder="Enter edge list,adjustim,igraph etc." class="countable form-control" data-limit="100" style="margin: 0px -0.5px 0px 0px; height: 250px; "></textarea>
								<form class="form-horizontal " action="#" style="margin-top:10px;">
								  <div class="form-group" style="margin-bottom:0;">
									 <label class="col-md-3 control-label">or Upload</label>
									 <div class="col-md-4">
										<div class="fileupload fileupload-new" style="margin-bottom:0;" data-provides="fileupload">
											<div class="input-group">
												<div class="input-group-btn">
													<a class="btn btn-default btn-file">
														<span class="fileupload-new">Select file</span>
														<span class="fileupload-exists">Change</span>
														<input type="file" class="file-input"></a>
													<a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload">Remove</a>
												</div>
											</div>
										</div>
									 </div>
									 <div class="col-md-5">
										<form action="" method="post" class="form-horizontal ">
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
										</form>
									 </div>
								  </div>
								</form>
							</div>
							<div class="col-lg-6 col-md-6" style="height:250px; border:1px dotted #ccc;">
								<span style="margin-top:5px;display:inline-block;font-size:14px;">Preview network Area</span>
							</div>
						</div>
					</fieldset>
				</div><!--/col-->
			</div><!--/row-->

			<div class="row">
				<label class="control-label" style="margin-left: 26px;font-size:16px;">
					<i class="fa fa-plus-circle blue"></i>
					<a>Add more Net</a>
				</label>
			</div>
			<div class="row">
				<label class="control-label" style="margin-left:26px;">Job title : </label>
				<input id="jobTitle" type="text" style="width:200px;display:inline-block;" name="text-input" class="form-control">
			</div>
			<div class="row" style="margin-top:15px;margin-left:16px;">
				<label class="control-label">Program selection : </label>
				<div style="margin-left: 10px;display: inline-block;">
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
			<div style="margin-top:15px;">
				<fieldset>
					<legend>
						<h5>Program parameters</h5>
					</legend>
					<form action="" method="post" class="form-horizontal " style="margin-left:10px;">
						<div class="form-group">
							<label class="control-label" for="input-small">Parameter cycle : </label>
							<div style="display:inline-block;">
								<select class="form-control select2">
										<option value="AL">100</option>
										<option value="AL">200</option>
										<option value="AR">500</option>
										<option value="IL">1000</option>
								</select>
							</div>
						</div>
						<div class="form-group">
		                    <label class="control-label">Plot output</label>
		                    <div style="display:inline-block;margin-left:40px;">
		                        <div class="checkbox" style="line-height:22px;">
		                            <label for="checkbox1">
		                            	<input type="checkbox" id="checkbox1" name="checkbox1" value="option1"> Automatically output NFP plot
		                            </label>
		                        </div>
		                    </div>
		                </div>
		                <div class="form-group">
		                    <label class="control-label">Email result notification</label>
		                    <div style="display:inline-block;margin-left:40px;">
		                        <div class="checkbox" style="line-height:22px;">
		                            <label for="checkbox1">
		                            	<input type="checkbox" id="checkbox1" name="checkbox1" value="option1"> Automatically notification
		                            </label>
		                        </div>
		                    </div>
		                </div>
		                <div class="form-group">
		                    <label class="control-label">Filters</label>
		                    <div style="display:inline-block;margin-left:40px;">
		                        <div class="checkbox" style="line-height:22px;">
		                            <label for="checkbox1">
		                            	<input type="checkbox" id="checkbox1" name="checkbox1" value="option1"> Skip unmatched 2PS
		                            </label>
		                        </div>
		                    </div>
		                </div>
					</form>
				</fieldset>
			</div>
			<div style="margin-top:15px;">
				<fieldset>
					<legend>
						<h5>Refrence database</h5>
					</legend>
					<form action="" method="post" class="form-horizontal " style="margin-left:10px;">
						<div class="form-group" style="margin-bottom:0;">
							 <label class="control-label">upload file</label>
							 <div style="display:inline-block;">
								<div class="fileupload fileupload-new" style="margin-bottom:0;display:inline-block;" data-provides="fileupload">
									<div class="input-group"  style="display:inline-block;">
										<div class="input-group-btn"  style="display:inline-block;">
											<a class="btn btn-default btn-file">
												<span class="fileupload-new">Select file</span>
												<span class="fileupload-exists">Change</span>
												<input type="file" class="file-input"></a>
											<a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload">Remove</a>
										</div>
									</div>
								</div>
							 </div>
						</div>
						<div class="form-group" style="margin-top:16px;">
							<label class="control-label" for="input-small">Select database : </label>
							<div style="display:inline-block;">
								<select class="form-control select2">
										<option value="AL">KEGG</option>
										<option value="AL">200</option>
										<option value="AR">500</option>
										<option value="IL">1000</option>
								</select>
							</div>
						</div>
					</form>
				</fieldset>
			</div>
			<div class="row" style="margin-top:15px;margin-left:16px;">
				<button type="button" class="btn btn-success"><i class="fa fa-magic"></i> Run NFP</button> compare 2 net to ...
				<div  style="margin-left:100px;">
                    <div style="display:inline-block;">
                        <div class="checkbox" style="line-height:22px;">
                            <label for="checkbox1">
                            	<input type="checkbox" id="" name="checkbox1" value="option1"> Show result in new window
                            </label>
                        </div>
                    </div>
                </div>
				<div class="form-group" style="margin-left:100px;">
                    <div style="display:inline-block;">
                        <div class="checkbox" style="line-height:22px;">
                            <label for="checkbox1">
                            	<input type="checkbox" id="" name="checkbox1" value="option1"> Notify me when job is done @qq.com
                            </label>
                        </div>
                    </div>
                </div>
			</div>
		</div>
		<!-- end: Content -->
		<br><br><br>


		<div id="usage" style="padding:0;text-align:center;">
			<div class="title" style="display:inline-block;line-height: 40px;">长沙瀚云信息技术有限公司</div>
			<div class="desc" style="display:inline-block;line-height: 40px;margin-left: 45px;">网络访问量统计</div>
		</div>

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
	<script src="rweb/assets/plugins/touchpunch/jquery.ui.touch-punch.min.js"></script>
	<script src="rweb/assets/plugins/moment/moment.min.js"></script>
	<script src="rweb/assets/plugins/fullcalendar/js/fullcalendar.min.js"></script>
	<!--[if lte IE 8]>
		<script language="javascript" type="text/javascript" src="rweb/assets/plugins/excanvas/excanvas.min.js"></script>
	<![endif]-->
	<script src="rweb/assets/plugins/flot/jquery.flot.min.js"></script>
	<script src="rweb/assets/plugins/flot/jquery.flot.pie.min.js"></script>
	<script src="rweb/assets/plugins/flot/jquery.flot.stack.min.js"></script>
	<script src="rweb/assets/plugins/flot/jquery.flot.resize.min.js"></script>
	<script src="rweb/assets/plugins/flot/jquery.flot.time.min.js"></script>
	<script src="rweb/assets/plugins/flot/jquery.flot.spline.min.js"></script>
	<script src="rweb/assets/plugins/xcharts/js/xcharts.min.js"></script>
	<script src="rweb/assets/plugins/autosize/jquery.autosize.min.js"></script>
	<script src="rweb/assets/plugins/placeholder/jquery.placeholder.min.js"></script>
	<script src="rweb/assets/plugins/datatables/js/jquery.dataTables.min.js"></script>
	<script src="rweb/assets/plugins/datatables/js/dataTables.bootstrap.min.js"></script>
	<script src="rweb/assets/plugins/raphael/raphael.min.js"></script>
	<script src="rweb/assets/plugins/morris/js/morris.min.js"></script>
	<script src="rweb/assets/plugins/jvectormap/js/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="rweb/assets/plugins/jvectormap/js/jquery-jvectormap-world-mill-en.js"></script>
	<script src="rweb/assets/plugins/jvectormap/js/gdp-data.js"></script>
	<script src="rweb/assets/plugins/gauge/gauge.min.js"></script>


	<!-- theme scripts -->
	<script src="rweb/assets/js/SmoothScroll.js"></script>
	<script src="rweb/assets/js/jquery.mmenu.min.js"></script>
	<script src="rweb/assets/js/core.min.js"></script>
	<script src="rweb/assets/plugins/d3/d3.min.js"></script>

	<!-- inline scripts related to this page -->
	<script src="rweb/assets/js/pages/index.js"></script>

	<!-- end: JavaScript-->

</body>
</html>
