<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>Cloud Admin | Dashboard</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" type="text/css" href="rweb/css/cloud-admin.css">
<link rel="stylesheet" type="text/css"
	href="rweb/css/themes/default.css" id="skin-switcher">
<link rel="stylesheet" type="text/css" href="rweb/css/responsive.css">
<!-- STYLESHEETS <link href="rweb/js/jquery-datatables/jquery.dataTables.css" type="text/css" rel="stylesheet">-->
<!--[if lt IE 9]><script src="js/flot/excanvas.min.js"></script><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script><![endif]-->
<link href="rweb/font-awesome/css/font-awesome.min.css" rel="stylesheet"> 

<link href="rweb/test/dataTables.bootstra.css" type="text/css" rel="stylesheet">
<!-- ANIMATE -->
<link rel="stylesheet" type="text/css"
	href="rweb/css/animatecss/animate.min.css" />
<link rel="stylesheet" type="text/css"
	href="rweb/css/networkconfusion/heatmap.css" />
<!-- GRITTER -->
<link rel="stylesheet" type="text/css"
	href="rweb/js/gritter/css/jquery.gritter.css" />
<!-- FONTS -->
<link href='http://fonts.useso.com/css?family=Open+Sans:300,400,600,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="rweb/js/bootstrap-multiselect/bootstrap-multiselect.css" type="text/css"/>
<link rel="stylesheet" href="rweb/js/jQueryUISlider/css/redmond/jquery-ui-1.7.1.custom.css" type="text/css" />
<link rel="Stylesheet" href="rweb/js/jQueryUISlider/css/ui.slider.extras.css" type="text/css" />
<!-- JQUERY -->
<script src="rweb/js/jquery/jquery-2.0.3.min.js"></script>
<script src="rweb/js/d3/d3.v3.min.js"></script>
<style>
.inlineBlock{display:inline-block;padding-right:5px;}
.dataTables_paginate ul li{
	    display: inline-block;
		list-style:none;
		margin-left: 10px;
}
.dataTables_paginate ul li a{
	text-decoration: none !important;
}
#redirect{
	margin-left:20px;border:1px solid #ccc !important;border-radius: 4px !important;
}
#DataFeatureTable_filter{
	display:none;
}
tfoot input {
	width: 100%;
	padding: 3px;
	box-sizing: border-box;
}
#tooltip{z-index:1000;position:}
.ui-slider{width:200px;}
.loading{  
    width:160px;  
    height:56px;  
    position: absolute;  
    top:50%;  
    left:50%;  
    line-height:56px;  
    color:#fff;  
    padding-left:60px;  
    font-size:15px;  
    background: #000 url(rweb/img/load.gif) no-repeat 10px 50%;  
    opacity: 0.7;  
    z-index:9999;  
    -moz-border-radius:20px;  
    -webkit-border-radius:20px;  
    border-radius:20px;  
    filter:progid:DXImageTransform.Microsoft.Alpha(opacity=70);  
}  
</style>
</head>
<body>
	<div id="loading" style="display:none;" class="loading">Loading...</div>
	<div id="uploading" style="display:none;" class="loading">uploading...</div>
	<div class="modal-backdrop fade in" style="display:none;" id="maskload"></div>
	<!-- HEADER -->
	<header class="navbar clearfix" id="header">
	<div class="container">
		<!-- Logo Begin -->
		<div class="navbar-brand">
			<!-- COMPANY LOGO -->
			<a href="networkconfusion" style="color:white !important;"> <!-- <img src="img/logo/logo.png" alt="Cloud Admin Logo" class="img-responsive" height="30" width="120" />  -->
				<strong>NFA &nbsp;&nbsp;&nbsp;Network Fusion Analysis</strong>
			</a>
			<!-- /COMPANY LOGO -->

		</div>
		<!-- Logo End -->

		<!-- NAVBAR LEFT -->
		<ul class="nav navbar-nav pull-left hidden-xs" id="navbar-left">
			<li class="dropdown"><a href="networkconfusion"
				class="dropdown-toggle"> <span class="name">Home</span>
			</a></li>
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown"> <i class="fa fa-cog"></i> <span
					class="name">Analysis</span> <i class="fa fa-angle-down"></i>
			</a>
				<ul class="dropdown-menu skins">
					<li><a href="networkconfusionSNF">SNF</a></li>
					<li><a href="">iCluster</a></li>
					<li><a href="">concatenation</a></li>
					<li><a href="">PSDF</a></li>
				</ul></li>
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown"> <i class="fa fa-cog"></i> <span
					class="name">Manual</span> <i class="fa fa-angle-down"></i>
			</a>
				<ul class="dropdown-menu skins">
					<li><a href="">pdf</a></li>
					<li><a href="">html</a></li>
					<li><a href="">vedio</a></li>
				</ul></li>
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown"> <i class="fa fa-cog"></i> <span
					class="name">About</span> <i class="fa fa-angle-down"></i>
			</a>
				<ul class="dropdown-menu skins">
					<li><a href="">Extended Link</a></li>
					<li><a href="">Copyright</a></li>
					<li><a href="">Last Update</a></li>
				</ul></li>
		</ul>
		<!-- /NAVBAR LEFT -->

		<!-- BEGIN TOP NAVIGATION MENU -->
		<ul class="nav navbar-nav pull-right">
			<!-- BEGIN TODO DROPDOWN -->
			<li class="dropdown" id="header-tasks"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown"> <i>Start you
						tour</i>
			</a></li>
			<!-- END TODO DROPDOWN -->
			
		</ul>
		<!-- END TOP NAVIGATION MENU -->

	</div>
	</header>
	<!--/HEADER -->

	<!-- PAGE -->
	<section id="page"> <!-- SIDEBAR -->
	<div id="sidebar" class="sidebar mini-menu">
		<div class="sidebar-menu nav-collapse">
			<div class="divide-20"></div>

			<!-- SIDEBAR MENU -->
			<%--<ul>
				<li class="active"><a href="index.html"> <i
						class="fa fa-tachometer fa-fw"></i> <span class="menu-text">Dashboard</span>
						<span class="selected"></span>
				</a></li>

				<li><a class="" href="widgets_box.html"> <i
						class="fa fa-th-large fa-fw"></i> <span class="menu-text">Widgets
							& Box</span>
				</a></li>

				<li><a class="" href="#"> <i class="fa fa-th-large fa-fw"></i>
						<span class="menu-text">Widgets & Box</span>
				</a></li>

				<li><a class="" href="#"> <i class="fa fa-th-large fa-fw"></i>
						<span class="menu-text">Widgets & Box</span>
				</a></li>

				<li><a class="" href="#"> <i class="fa fa-th-large fa-fw"></i>
						<span class="menu-text">Widgets & Box</span>
				</a></li>

			</ul>
			--%><!-- /SIDEBAR MENU -->
			<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-55d2e2c5ed7c36ef" async="async"></script>
		</div>
	</div>
	<!-- /SIDEBAR -->

	<div id="main-content" style="margin-left:50px !important">
		<div class="container">
			<div class="row">
				<div id="content" class="col-lg-12">

					<!-- PAGE HEADER-->
					<div class="row">
						<div class="col-sm-12">
							<div class="page-header">
								<!-- BREADCRUMBS -->
								<ul class="breadcrumb">
									<li><i class="fa fa-home"></i> <a href="index.html">Home</a>
									</li>
									<li>Analysis - SNF</li>
								</ul>
								<!-- /BREADCRUMBS -->

							</div>
						</div>
					</div>
					<!-- /PAGE HEADER -->

					<!-- PAGE CONTENT -->
					<div class="row" style="min-height:800px;">
						<div class="col-sm-12">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#inputdata" id="aInputData" data-toggle="tab">
										<i class="fa fa-search-plus"></i> <span
										class="hidden-inline-mobile">Input Data</span>
								</a></li>
								<li onclick="showBtnRun()"><a href="#snf" data-toggle="tab" id="aSNF"> <i
										class="fa fa-bar-chart-o"></i> <span
										class="hidden-inline-mobile">Similarity Network
											Fusion</span>
								</a></li><!-- onclick="inputProjectId(this)"-->
								<li><a href="#ngp" data-toggle="tab"> <i
										class="fa fa-bar-chart-o"></i> <span
										class="hidden-inline-mobile">New Group Predict</span>
								</a></li>
							</ul>
							<div class="tab-content" style="margin-top:15px;">

								<!-- INPUT DATA -->
								<div class="tab-pane fade in active" id="inputdata">
									<div class="row">
										<!-- GET FILE -->
										<div class="col-md-9" style="">
											<div class="box border blue" style="margin-bottom:0;">
												<div class="box-title">
													<h4>
														<i class="fa fa-money"></i>Getting Data
													</h4>
												</div>
												<div class="box-body">
													<div class="row">
														<div class="col-md-12">
															<button class="btn btn-info" onclick="loadEgData()">Load
																Example Data</button>
															<form class="form-horizontal" role="form" id="addFileForm" style="margin-top:10px;">
																<div class="form-group"><label class="col-md-1 control-label" id="labelData1">data1</label><div class="col-md-1"><button class="btn btn-info" data-toggle="modal" id="btnAddFile1" onclick="openUploadModal(1)">Add File</button></div><label class="col-md-1 control-label" id="typeLabel1">type1</label><div class="col-md-2"><select class="form-control"><option>Continuous</option><option>Discrete</option></select></div><label class="col-md-1 control-label" id="dataNameLabel1">name1</label><div class="col-md-2"><input type="text" flag="1" name="defname" onkeyup="renameFile(this)" oldvalue="data1" id="defname1" class="form-control" value="data1"></div><div class=" col-md-4"><label class="checkbox inlineBlock" style="">	<input type="checkbox" class="uniform" id="normalization1" checked="">	Normalization</label> <label class="checkbox inlineBlock" style="">	<input type="checkbox" class="uniform" id="logtransfor1">log2	transformation</label><label class="checkbox inlineBlock" style="padding:0 0 0 5"><i class="fa fa-minus-circle" style="color:red;margin-top:12px;" id="deleteLable1" onclick="deleteFile(this)" title="删除"></i></label></div></div>
																<div class="form-group"><label class="col-md-1 control-label" id="labelData2">data2</label><div class="col-md-1"><button class="btn btn-info" data-toggle="modal" id="btnAddFile2" onclick="openUploadModal(2)">Add File</button></div><label class="col-md-1 control-label" id="typeLabel2">type2</label><div class="col-md-2"><select class="form-control"><option>Continuous</option><option>Discrete</option></select></div><label class="col-md-1 control-label" id="dataNameLabel2">name2</label><div class="col-md-2"><input type="text" flag="2" name="defname" onkeyup="renameFile(this)" oldvalue="data2" id="defname2" class="form-control" value="data2"></div><div class=" col-md-4"><label class="checkbox inlineBlock" style="">	<input type="checkbox" class="uniform" id="normalization2" checked="">	Normalization</label> <label class="checkbox inlineBlock" style="">	<input type="checkbox" class="uniform" id="logtransfor2">log2	transformation</label><label class="checkbox inlineBlock" style="padding:0 0 0 5"><i class="fa fa-minus-circle" style="color:red;margin-top:12px;" id="deleteLable2" onclick="deleteFile(this)" title="删除"></i></label></div></div>
															</form>
															<div class="col-md-12" style="text-align:center;">
																<i class="fa fa-plus-circle blue" title="添加" style="font-size: 30;cursor:pointer;color: #2ca8d2;" onclick="toAddFile()"></i>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- /GET FILE -->

										<!-- SAMPLE INFOMATION -->
										<div class="col-md-3" style="padding-left:0px;">
											<div class="box border blue" style="margin-bottom:0;">
												<div class="box-title">
													<h4>
														Sample Information
													</h4>
												</div>
												<div class="box-body">
													<div class="row">
														<div class="col-md-12">
															<form class="form-horizontal" role="form" style="margin-top:10px;">
																<div class="form-group">
																	<label class="col-md-6 control-label">Sample
																		Data</label>
																	<div class="col-md-6">
																		<button class="btn btn-info" data-toggle="modal" onclick="openUploadModal(0)">Add File</button>
																	</div>
																</div>
																<div id="sampleDatastatus" style="width:100%;text-align:center;"></div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- /SAMPLE INFOMATION -->
									</div>
									<div class="row">
										<div class="col-md-12" style="margin:10px 30px 10px 0px;text-align:right;">
											<button id="btnValidate" class="btn btn-inverse" disabled onclick="submitInputData();">Submit</button>
										</div>
									</div>
									<!-- DATA VIEW -->
									<div class="row">
										<div class="col-md-12">
											<div class="box border">
												<div class="box-title">
													<h4>
														<i class="fa fa-columns"></i> <span
															class="hidden-inline-mobile">Data View</span>
													</h4>
												</div>
												<div class="box-body">
													<div class="tabbable header-tabs">
														<ul class="nav nav-tabs">
															<li class="active"><a href="#di-table"
																data-toggle="tab"><i class="fa fa-bookmark"></i> <span
																	class="hidden-inline-mobile">Table</span></a></li>
															<li id="heatmapli"><a onclick="showHeatmapDataView()" href="#di-heatmap" data-toggle="tab"><i
																	class="fa fa-rss"></i> <span
																	class="hidden-inline-mobile">Heatmap</span></a></li>
														</ul>
														<div class="tab-content">
															<!-- TABLE -->
															<div class="tab-pane active" id="di-table">
																<div class="panel panel-default">
																	<div class="panel-body" id="DataViewPanel">
																		<table id="DataViewTable" class="table table-striped table-bordered">
																	        <thead id="DataViewTableHeader">
																	            
																	        </thead>
																	        <tbody id="DataViewTableBody">
																	            
																	        </tbody>
																			<tfoot id="DataViewTableFooter">
																				
																			</tfoot>
																	    </table>
																	</div>
																</div>
															</div>
															<!-- /TABLE -->

															<!-- HEATMAP -->
															<div class="tab-pane" id="di-heatmap">
																<div class="row" style="margin-left:15px;padding-bottom:10px;">
																	<div id="tooltip" class="hidden">
																		<p>
																			<span id="value">
																		</p>
																	</div>
																	
																	<form role="form">
																	  <div>
																		<label for="heatmapDataSelect" id="heatmapDataLabel" style="float:left;margin-top: 7px;font-weight: bold;">data name: </label>
																		
																	  </div>
																	 
																	</form>
																</div>
																<div class="row">
																	<div class="col-md-7" id="chart">
																		
																	</div>
																	<div class="col-md-3" style="float:left;">
																		<div class="box border blue">
																			<div class="box-title">
																				<h4><i class="fa fa-table"></i>SAMPLE INFO</h4>
																			</div>
																			<div class="box-body">
																				<table class="table table-bordered table-striped table-condensed table-hover">
																					  <thead>
																						  <tr>
																							 <th>name</th>
																							 <th>value</th>                                         
																						  </tr>
																					  </thead>   
																					  <tbody id="dataviewSampleBody">
																																					
																					  </tbody>
																				 </table>
																			</div>
																		</div>
																		
																	</div>
																</div>
																<%--<div id="chart"
																	style='overflow:auto; width:960px; height:480px;'></div>
															--%></div>
															<!-- /HEATMAP -->
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- /DATA VIEW -->
								</div>
								<!-- /INPUT DATA -->

								<!-- SIMILARITY NETWORK CONFUSION -->
								<div class="tab-pane fade" id="snf">
									<!-- PARAMETERS SET -->
									<div class="row">
										<div class="col-md-6" style="width:40%;">
											<!-- BOX -->
											<div class="box border blue">
												<div class="box-title">
													<h4>
														<i class="fa fa-bars"></i> <span
															class="hidden-inline-mobile">Set Parameters</span>
													</h4>
												</div>
												<div class="box-body" style="min-height:200px;">
													<form class="form-horizontal" role="form">
														<div class="form-group">
															<label for="inputEmail3" class="col-sm-2 control-label">Neighbor Number:</label>
															<div class="col-sm-10">
															  <select id="NeighborNumber" class="form-control" style="width:100px;">
																    <option value="10">10</option>
																    <option value="11">11</option>
																    <option value="12">12</option>
																    <option value="13">13</option>
																    <option value="14">14</option>
																    <option value="15">15</option>
																    <option value="16">16</option>
																    <option value="17">17</option>
																    <option value="18">18</option>
																    <option value="19">19</option>
																    <option value="20" selected="selected">20</option>
																    <option value="21">21</option>
																    <option value="22">22</option>
																    <option value="23">23</option>
																    <option value="24">24</option>
																    <option value="25">25</option>
																    <option value="26">26</option>
																    <option value="27">27</option>
																    <option value="28">28</option>
																    <option value="29">29</option>
																    <option value="30">30</option>
																</select>
															</div>
														  </div>
														  <div class="form-group">
															<label for="inputEmail3" class="col-sm-2 control-label">Iteration Number:</label>
															<div class="col-sm-10">
															  <select id="IterationNumber" class="form-control" style="width:100px;">
																    <option value="10">10</option>
																    <option value="11">11</option>
																    <option value="12">12</option>
																    <option value="13">13</option>
																    <option value="14">14</option>
																    <option value="15">15</option>
																    <option value="16">16</option>
																    <option value="17">17</option>
																    <option value="18">18</option>
																    <option value="19">19</option>
																    <option value="20" selected="selected">20</option>
																</select>
															</div>
														  </div>
														  <div class="form-group">
															<label for="inputEmail3" class="col-sm-2 control-label">Alpha:</label>
															<div class="col-sm-10" style="padding-bottom: 10px;">
																<div style="float:left;" id="Alpha"></div>
																<input type="text" style="float:left;width:60px;margin-left:5px;" value="0.5" id="alphaValue" class="form-control" />
															</div>
														  </div>
														  <div class="form-group">
															<label for="inputEmail3" class="col-sm-2 control-label">Cluster Number:</label>
															<div class="col-sm-10">
															  	<input type="text" style="width:100px;" class="form-control" style id="ClusterNumber" value="0" />
															</div>
														  </div>
													</form>
												</div>
											</div>
											<!-- /BOX -->
										</div>

										<div class="col-md-6" style="width:150px">
											<div class="box">
												<div class="box-title" style="border:none"></div>
												<div class="box-body" style="min-height:240px;">
													<div style="position:absolute;bottom:25px;width:100%">
														<a onclick="submitSNF()" id="btnRun" disabled class="btn btn-inverse btn-icon input-block-level"
															href="javascript:void(0);">
															<div>Run</div>
														</a>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- /PARAMETERS SET -->

									<!-- RESULTS -->
									<div class="row">
										<div class="col-md-12">
											<div class="box border">
												<div class="box-title">
													<h4>
														<i class="fa fa-columns"></i> <span
															class="hidden-inline-mobile" >Result</span>
													</h4>
												</div>
												<div class="box-body">
													<div style="margin-top:-45px;position:absolute;margin-left:150px;z-index:12000;"><span style="color:blue;">PROJECT-ID:</span>
													<input type="text" id="resultHeader" class="form-control" style="display:inline-block;width:200px;height:30px;"></div>
													<div id="runningDiv" style="display:none;font-weight:bold;font-size:16px;">
													
													the project is calculating.<br>It may take a few minutes,please wait in patient.You can leave your email,
													we will send the result to your email after the calculation.<br/>
													Your projectid is xxx,the result can be saved for 10 days.You can view your result only by the projectid.</div>
													<div class="tabbable header-tabs" id="resultshowTab" style="display:none;">
														<ul class="nav nav-tabs">
															<!-- <li><a href="#snf-others" data-toggle="tab"><i
																	class="fa fa-rss"></i> <span
																	class="hidden-inline-mobile">Other Results</span></a></li>-->
															<li><a onclick="resizeTable('DataFeatureTable')" href="#snf-feature" data-toggle="tab"><i
																	class="fa fa-rss"></i> <span
																	class="hidden-inline-mobile">Feature</span></a></li>
															<li><a onclick="resizeTable('DataResultTable')" href="#snf-table" data-toggle="tab"><i
																	class="fa fa-rss"></i> <span
																	class="hidden-inline-mobile">Table</span></a></li>
															<li class="active"><a href="#snf-network"
																data-toggle="tab"><i class="fa fa-bookmark"></i> <span
																	class="hidden-inline-mobile">Network</span></a></li>
														</ul>
														<div class="tab-content">
															
															<!-- TABLE -->
															<div class="tab-pane" id="snf-table">
																<div class="panel panel-default">
																	<div class="panel-body">
																		<table id="DataResultTable" class="table table-striped table-bordered">
																	        <thead id="DataResultTableHeader">
																	            
																	        </thead>
																	        <tbody id="DataResultTableBody">
																	            
																	        </tbody>
																			<tfoot id="DataResultTableFooter">
																				
																			</tfoot>
																	    </table>
																	</div>
																</div>
															</div>
															<!-- /TABLE -->

															<!-- NETWORK -->
															<div class="tab-pane active" id="snf-network">
																<div style='margin-left:25px;float:left;'>
																	<label style='font-weight: bold;'>data name:</label>
																	<select id='selectTableHeatCyto' onchange='changeHeatCyto(this)'></select>
																</div>
																<iframe width="100%" height="700" name="iframe" id="iframe" frameborder="no" onload="iFrameHeight()" border="0" src=""></iframe>
															</div>
															<!-- /NETWORK -->

															<!-- FEATURE -->
															<div class="tab-pane" id="snf-feature">
																<div class="row">
																	<div class="col-md-6">
																		<table id="DataFeatureTable" class="table table-striped table-bordered">
																	        <thead id="DataFeatureTableHeader">
																	            
																	        </thead>
																	        <tbody id="DataFeatureTableBody">
																	            
																	        </tbody>
																			<tfoot id="DataFeatureTableFooter">
																				
																			</tfoot>
																	    </table>
																	</div>
																	<div class="col-md-6"></div>
																</div>
																
															</div>
															<!-- /FEATURE -->

															<!-- OTHER RESULTS 
															<div class="tab-pane" id="snf-others"></div>
															<!-- /OTHER RESULTS -->
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- /RESULTS -->
								</div>
								<!-- /SIMILARITY NETWORK CONFUSION -->

								<!-- NEW GROUP PREDICT -->
								<div class="tab-pane fade" id="ngp">
									<div class="tab-pane fade in active" id="inputdata">
										<div class="row">
											<!-- GET FILE -->
											<div class="col-md-9" style="padding-right: 0;">
												<div class="box border blue">
													<div class="box-title">
														<h4>
															<i class="fa fa-money"></i>New Data
														</h4>
													</div>
													<div class="box-body">
														<div class="row">
															<div class="col-md-12">
																<form class="form-horizontal" role="form" id="addNewFileForm" style="margin-top:10px;">
																	<div class="form-group">
																		<label class="col-md-1 control-label">new data1</label>
																		<div class="col-md-1">
																			<button class="btn btn-info" data-toggle="modal" onclick="openUploadNewModal(1)">Add File</button>
																		</div>
																		<label class="col-md-1 control-label">type1</label>
																		<div class="col-md-2">
																			<select class="form-control">
																			  <option>Continuous</option>
																			  <option>Discrete</option>
																			</select>
																		</div>
																		<label class="col-md-1 control-label">name1</label>
																		<div class="col-md-2">
																			<input type="text" flag="1" name="defname" class="form-control" onkeyup="renameFile(this)" oldvalue="newdata1" id="newname1" 
																				value="newdata1">
																		</div>
																		<div class=" col-md-4">
																			<label class="checkbox inlineBlock" style="">
																				<input type="checkbox" class="uniform" id="newnormalization1" checked="">
																				Normalization
																			</label> 
																			<label class="checkbox inlineBlock" style="">
																				<input type="checkbox" class="uniform" id="newlogtransfor1">log2
																				transformation
																			</label>
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="col-md-1 control-label">new data2</label>
																		<div class="col-md-1">
																			<button class="btn btn-info" data-toggle="modal"  onclick="openUploadNewModal(2)">Add File</button>
																		</div>
																		
																		<label class="col-md-1 control-label">type2</label>
																		<div class="col-md-2">
																			<select class="form-control">
																			  <option>Continuous</option>
																			  <option>Discrete</option>
																			</select>
																		</div>
																		<label class="col-md-1 control-label">name2</label>
																		<div class="col-md-2">
																			<input type="text" flag="2" name="defname" oldvalue="newdata2" onkeyup="renameFile(this)" id="newname2" class="form-control"
																				value="newdata2">
																		</div>
																		<div class=" col-md-4">
																			<label class="checkbox inlineBlock" style="">
																				<input type="checkbox" class="uniform" id="newnormalization2" checked="">
																				Normalization
																			</label> 
																			<label class="checkbox inlineBlock" style="">
																				<input type="checkbox" class="uniform" id="newlogtransfor2">log2
																				transformation
																			</label>
																		</div>
																	</div>
																	
																</form>
																<div class="col-md-12" style="text-align:center;">
																	<i class="fa fa-plus-circle blue" id="btn-addnew" title="添加" style="font-size: 30;cursor:pointer;color: #2ca8d2;" onclick="toAddNewFile()"></i>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<!-- /GET FILE -->

											<!-- SAMPLE INFOMATION -->
											<div class="col-md-3">
												<div class="box border blue">
													<div class="box-title">
														<h4>
															<i class="fa fa-money"></i>Sample Information
														</h4>
													</div>
													<div class="box-body">
														<form class="form-horizontal" role="form" style="margin-top:10px;">
																<div class="form-group">
																	<label class="col-md-6 control-label">Sample
																		Data</label>
																	<div class="col-md-6">
																		<button class="btn btn-info" data-toggle="modal" onclick="openUploadModal(0)">Add File</button>
																	</div>
																</div>
															</form>
													</div>
												</div>
											</div>
											<!-- /SAMPLE INFOMATION -->
										</div>
										<!-- DATA VIEW -->
										<div class="row">
											<div class="col-md-6" style="padding-right: 0;">
												<!-- BOX -->
												<div class="box border blue">
													<div class="box-title">
														<h4>
															<i class="fa fa-bars"></i> <span
																class="hidden-inline-mobile">Set Parameters </span>
														</h4>
													</div>
													<div class="box-body">
														<form class="form-horizontal" role="form">
															<div class="form-group">
																<label for="inputEmail3" class="col-sm-2 control-label">Neighbor Number:</label>
																<div class="col-sm-10">
																  <select id="NeighborNumberNew" class="form-control" style="width:100px;">
																	    <option value="10">10</option>
																	    <option value="11">11</option>
																	    <option value="12">12</option>
																	    <option value="13">13</option>
																	    <option value="14">14</option>
																	    <option value="15">15</option>
																	    <option value="16">16</option>
																	    <option value="17">17</option>
																	    <option value="18">18</option>
																	    <option value="19">19</option>
																	    <option value="20" selected="selected">20</option>
																	    <option value="21">21</option>
																	    <option value="22">22</option>
																	    <option value="23">23</option>
																	    <option value="24">24</option>
																	    <option value="25">25</option>
																	    <option value="26">26</option>
																	    <option value="27">27</option>
																	    <option value="28">28</option>
																	    <option value="29">29</option>
																	    <option value="30">30</option>
																	</select>
																</div>
															  </div>
															  <div class="form-group">
																<label for="inputEmail3" class="col-sm-2 control-label">Iteration Number:</label>
																<div class="col-sm-10">
																  <select id="IterationNumberNew" class="form-control" style="width:100px;">
																	    <option value="10">10</option>
																	    <option value="11">11</option>
																	    <option value="12">12</option>
																	    <option value="13">13</option>
																	    <option value="14">14</option>
																	    <option value="15">15</option>
																	    <option value="16">16</option>
																	    <option value="17">17</option>
																	    <option value="18">18</option>
																	    <option value="19">19</option>
																	    <option value="20" selected="selected">20</option>
																	</select>
																</div>
															  </div>
															  <div class="form-group">
																<label for="inputEmail3" class="col-sm-2 control-label">Alpha:</label>
																<div class="col-sm-10" style="padding-bottom: 10px;">
																    <div style="float:left;" id="AlphaNew"></div>
																	<input type="text" style="float:left;width:60px;margin-left:5px;" value="0.5" id="alphaNewValue" class="form-control" />
																</div>
															  </div>
															  <div class="form-group">
																<label for="inputEmail3" class="col-sm-2 control-label">Cluster Number:</label>
																<div class="col-sm-10">
																  	<input type="text" style="width:100px;" class="form-control" id="ClusterNumberNew" value="0">
																</div>
															  </div>
														</form>
													</div>
												</div>
												<!-- /BOX -->
											</div>

											<div class="col-md-6">
												<div class="box">
													<div class="box-title" style="border:none"></div>
													<div class="box-body" style="min-height:240px;">
														<div style="position:absolute;bottom:25px;width:150px">
															<a class="btn btn-info btn-icon input-block-level"
																href="javascript:void(0);" onclick="submitNewSNF()">
																<div>Run</div>
															</a>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="box border">
													<div class="box-title">
														<h4>
															<i class="fa fa-columns"></i> 
															<span class="hidden-inline-mobile" id="DataNewHeader" saveid="">Result <a style="font-size:13px;margin-left:20px;"></a></span>
														</h4>
													</div>
													<div class="box-body" style="min-height: 220px;">
														<div class="tabbable header-tabs">
															<ul class="nav nav-tabs">
																<li><a onclick="resizeTable('DataNewTable')" href="#ngp-table" data-toggle="tab"><i
																		class="fa fa-bookmark"></i> <span
																		class="hidden-inline-mobile">Table</span></a></li>
																<li class="active"><a href="#ngp-network"
																	data-toggle="tab"><i class="fa fa-rss"></i> <span
																		class="hidden-inline-mobile">Network</span></a></li>
															</ul>
															<div class="tab-content">
																<!-- TABLE -->
																<div class="tab-pane" id="ngp-table">
																	<div class="panel panel-default">
																		<div class="panel-body">
																			<table id="DataNewTable" class="table table-striped table-bordered">
																		        <thead id="DataNewTableHeader">
																		            
																		        </thead>
																		        <tbody id="DataNewTableBody">
																		            
																		        </tbody>
																				<tfoot id="DataNewTableFooter">
																					
																				</tfoot>
																		    </table>
																		</div>
																	</div>
																</div>
																<!-- /TABLE -->

																<!-- NETWORK -->
																<div class="tab-pane active" id="ngp-network">
																	<div style='margin-left:25px;float:left;'>
																		<label style='font-weight: bold;'>data</label>
																		<select id='selectNewTableHeatCyto' onchange='changeNewHeatCyto(this)'></select>
																	</div>
																	<iframe width="100%" style="overflow-y:hidden;" height="1800" name="iframe" id="newiframe" frameborder="no" onload="iFrameHeight('newiframe')" border="0" src=""></iframe>
																</div>
																<!-- /NETWORK -->
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- /DATA VIEW -->
									</div>
								</div>
								<!-- NEW GROUP PREDICT -->
							</div>
						</div>
					</div>
					<!-- /PAGE CONTENT -->

					<!-- PAGE FOOTER -->
					<div class="footer-tools">
						<span class="go-top"> Copyright @ 长沙瀚云科技有限公司 <i
							style="margin-left:30px; float:right;">当前访问人数：————人</i> <i
							class="fa fa-chevron-up"></i> Top
						</span>
					</div>
					<!-- /PAGE FOOTER -->
				</div>
			</div>
		</div>
	</div>
	</section>
	<!--/PAGE -->

	<!-- MODAL -->
	<div class="modal fade" id="fileUploadModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Upload Data</h4>
				</div>
				<div class="modal-body" id="fileUploadModalBody" type="0">
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close
					</button>
					<button type="button" class="btn btn-info" onclick="loadData()">Upload</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
	</div>
	<!-- /MODAL -->
	<!-- MODAL -->
	<div class="modal fade" id="fileUploadNewModal" tabindex="-1" role="dialog"
		aria-labelledby="myNewModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myNewModalLabel">Upload New Data</h4>
				</div>
				<div class="modal-body" id="fileUploadNewModalBody" type="0">
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close
					</button>
					<button type="button" class="btn btn-info" onclick="loadNewData()">Upload</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
	</div>
	<!-- /MODAL -->

	<!-- JAVASCRIPTS -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- JQUERY UI-->
	<script
		src="rweb/js/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
	<!-- BOOTSTRAP -->
	<script src="rweb/bootstrap-dist/js/bootstrap.min.js"></script>
	<!-- Include the plugin's CSS and JS: -->
	<script type="text/javascript" src="rweb/js/bootstrap-multiselect/bootstrap-multiselect.js"></script>
	 <!-- DataTables -->
    <script type="text/javascript" charset="utf8" src="rweb/js/jquery-datatables/jquery.dataTables.js"></script>
	<!-- COOKIE -->
	<script type="text/javascript"
		src="rweb/js/jQuery-Cookie/jquery.cookie.min.js"></script>
	<script type="text/javascript"
		src="rweb/js/bootbox/bootbox.min.js"></script>
	<!-- GRITTER -->
	<script type="text/javascript"
		src="rweb/js/gritter/js/jquery.gritter.min.js"></script>
	<script type="text/javascript"
		src="rweb/js/snf.js"></script>
	<script type="text/javascript"
		src="rweb/js/ajaxfileupload.js"></script>
	<script type="text/javascript"
		src="rweb/js/heatmap.js"></script>
	<script type="text/javascript" charset="utf8" src="rweb/test/test.js"></script>

	<!-- /JAVASCRIPTS -->

</body>
</html>