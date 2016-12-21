<%@ page language="java" import="java.util.*" pageEncoding="Utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	    <title>Network Fingerprint</title>

		<link rel="shortcut icon" href="static/image/w1.png" />
	    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<link href="rweb/assets/css/font-awesome.min.css" rel="stylesheet">
	    <link href="rweb/assets/css/style.min.css" rel="stylesheet">
		<link href="rweb/css/header.css"  type="text/css" rel="stylesheet">
		<link href="rweb/css/comment.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="rweb/js/bootbox/bootstrap-tour.min.css" />

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

<body style="font-size:medium; line-height: 1.5em">
	<div class="container-fluid content">
		<div class="row">
			<div style="margin:1em">
			<a onclick="openintrojs(0)" class="btn btn-success"><span class="glyphicon glyphicon-play" aria-hidden="true"></span>&nbsp;Interactive tutorial</a>
			<div>
		<br>
			<h3> Step 1: Prepare Data (<a href='javascript:void(0);' onclick="moveLink('networksimilarityHelp#PrepareinputbodyA');" >Learn more</a>)</h3>
			<h4>&nbsp;&nbsp;Generate network from gene list</h4>
			<p>NFPscanner server support analysis of human gene networks. Acceptable gene IDs are Entrez Gene, UniProt, Gene Symbol, Ensemble, Refseq and KEGG. Acceptable input network formats are Edgelist and GraphML. <br>
			If you have a list of genes obtained from RNA-seq, microarray and other high throughput experiments, you can make a network out of the gene list with the help of many available tools.  Four alternative options are provided as a quick reference for preparing input networks.
		 	</p>
			<div class="row">
				<div class="col-md-2"><img src="static/image/nfp_step_1.1.png"/></div>
				<div class="col-md-2"><img src="static/image/nfp_step_1.2.png"/></div>
				<div class="col-md-2"><img src="static/image/nfp_step_1.3.png"/></div>
				<div class="col-md-2"><img src="static/image/nfp_step_1.4.png"/></div>
			</div>				
			<div class="row">
				<div class="col-md-2" style="font-weight: bold;text-align:center">GeneMANIA</div>
				<div class="col-md-2" style="font-weight: bold;text-align:center">STRING</div>
				<div class="col-md-2" style="font-weight: bold;text-align:center">BioProfiling.de</div>
				<div class="col-md-2" style="font-weight: bold;text-align:center">jActiveModules</div>
			</div>	
			<br>
		 	<h4>&nbsp;&nbsp;Convert network formats</h4>
			<p>
				If you have work with biomedical networks in other context, and already have network files in a different format. It is possible to convert all network formats to NFPscanner acceptable formats. We describe how to export edgelist from Cytoscape and igraph as two examples. 
			</p>
			<div class="row">
				<div class="col-md-2"><img src="static/image/nfp_step_1.5.png"/></div>
				<div class="col-md-2 offser-2"><img src="static/image/nfp_step_1.6.png"/></div>
			</div>				
			<div class="row">
				<div class="col-md-2" style="font-weight: bold;text-align:center">Cytoscape</div>
				<div class="col-md-2" style="font-weight: bold;text-align:center">igraph</div>
			</div>	
			<br>
		 	<h4 class="tryexample">&nbsp;&nbsp;Try examples</h4>
		 	<a  href="javascript:void(0);"  id="LoadSample1" name="LoadSample-radio" value="not" style="text-decoration:underline;    font-size: 20px;display: none;"> clear</a>

			<div  id="step1" style="display:inline-block;line-height:34px;">
		 	<a href="javascript:void(0);" id="LoadSample1" class="step1" name="LoadSample-radio" value="1" style="font-size: 1.5em;"> #1</a>  Alzheimer‘s Disease networks generated with STRING. Genetic interaction networks associated with 12 month atrophy in Hippocampus and Entorhinal cortex. (Meda et al., 2000) <br>
			<a href="javascript:void(0);" id="LoadSample2" name="LoadSample-radio" value="2" style="font-size: 1.5em;"> #2</a>  Upregulated gene networks in neonatal sepsis identified with jActiveModules. Human neonatal immune-metabolic network associated with bacterial infection. (Smith et al., 2014)<br>
			<a href="javascript:void(0);" id="LoadSample3" name="LoadSample-radio" value="3" style="font-size: 1.5em;"> #3</a>  Transcription factor networks generated with GeneMANIA. E2F1, FOXM1,GATA3 and their downstream risk genes. (Kim et al., 2015) <br>
			<a href="javascript:void(0);" id="LoadSample4" name="LoadSample-radio" value="4" style="font-size: 1.5em;"> #4</a>  Alcohol Dependence networks from GWAS. A gene subnetwork underlying Alcohol Dependence identified by GWASs. (Han et al., 2013)	<br>
			Click <a href="examples/examples.zip"  >here</a> to download Examples.

			</div>
		</div>
		<!-- start: Content -->
		<div style="padding:0;margin-top:10px;background:#fff;">
			<div id="selectFileContent">
				<div class="row">
					<div class="col-lg-12 col-md-12">
						<div class="panel panel-info fieldset">
							<h3> Step 2: Upload network (<a href='javascript:void(0);' onclick="moveLink('networksimilarityHelp#UploadbodyA');">Learn more</a>)</h3>
							<p>Input one or more networks for network fingerprints.</p>
							<div class="panel-heading" style="background: #337ab7;">
								<h2><strong><font color="white">Input Network #1</font></strong></h2>

								<div class="panel-actions">
								</div>
							</div>

							<div class="panel-body" style="padding-left: 5px;padding-bottom: 0;" id="step2">
								<div class="row">
									<div class="col-lg-6 col-md-6">
										<div style="height:6em">
										<p style="margin-left: 5px;margin-top: 0px;"> <a class="btn btn-success" onclick="showSelectFileModal(1)" href="javascript:void(0);"><span class="glyphicon glyphicon-upload" aria-hidden="true"></span>&nbsp;Upload a network</a> GraphML(*.graphml) and edge list(*.edgelist) are supported.
										<br>
										Otherwise, enter a network below directly.
										</p></div>
										<div class="row">
										<div class="form-group" style="margin-bottom:3;width: 100%;">
										<div style="margin-left: 30px;margin-top: 5px;">
													 <div style="display:none">
														<div class="fileupload fileupload-new" onclick="showSelectFileModal(1)" style="margin-bottom:0;" data-provides="fileupload">
															<div class="input-group">
																<div class="input-group-btn" >
																	<a class="btn btn-default btn-file" style="width: 90px;"  id="selectFileWidth1">
																		<span class="fileupload-new" data-step="1" data-intro="select a file!" id="selectFile1" >Select file</span>
																		<span class="fileupload-exists">Change</span>
																	</a><a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload">Remove</a>
																</div>
															</div>
														</div>
														<input type="hidden" id="hiddenTxt1" name="hiddenTxt" value="0"/>
													 </div>
												  </div>
												</div>
										</div>
										<div  style="height: 300px;margin-top: -3px;">
											<input type="hidden" id="fileName1" name="fileName"/>
											<textarea rows="3" cols="5" id="textareaNet1"  name="textarea" placeholder="Enter edge list or graphml. " class="countable form-control" data-limit="100" style="margin: 0px -0.5px 0px 0px; height: 300px; "></textarea>
										</div>

									</div>
									<div class="col-lg-6 col-md-6">
									<div style="height:6em" id="networkOutputTip">
										<p style="margin-left: 5px;margin-top: 0px; ">The query network uploaded, parsed and visualized. </p>
									</div>
									<div  style="height:300px; border:1px dotted #ccc;padding-right:0;" id="previewNet1">

										<span style="margin-top:5px;display:inline-block;font-size:14px;">A preview of your query network will show here</span>
									</div>
									</div>
									<form class="form-horizontal " action="#" style="margin-top:10px;">
									<div class="row">
										<div style="float:right;">
											<a class="btn btn-default btn-primary" href="javascript:void(0);"  name="okBtn" id="OKBtn1">Update Network View</a>
											<a class="btn btn-default btn-primary" href="javascript:void(0);"  name="clearBtn" id="clearBtn1">Clear</a>&nbsp;&nbsp;&nbsp;
										</div>
									</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div><!--/row-->
			</div>
				<a class="btn btn-success" onclick="addMoreNet()" href="javascript:void(0);"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Add another network</a>
					</div>

			<h3> Step 3: Set parameters (<a href='javascript:void(0);' onclick="moveLink('networksimilarityHelp#SetparametersbodyA');">Learn more</a>) </h3>

			<div class="panel panel-default" data-step="2" id="step3" data-intro="set parameters!">
				<div class="panel-heading" style="background: #337ab7;">
					<h2><strong><font color="white">General Parameters</font></strong></h2>
					<div class="panel-actions">
						<a class="btn-minimize"></a>
					</div>
				</div>
				<div class="panel-body">
					<div class="row" style="display: none;">
						<label class="control-label col-md-4" style="margin-left:7px;line-height:34px;">Job ID : </label>
						<span type="text" id="jobTitle" style="width:200px;display:inline-block;line-height:34px;"  class="col-md-6" ></span>
					<p class="col-md-6" style="margin-top1:10px;font-family: 'Lucida Grande', 'Lucida Sans Unicode', 'Lucida Sans', Helvetica, Verdana, Tahoma, sans-serif;display: inline;line-height:34px;" >
						&nbsp;&nbsp;Enter a descriptive title for your alignment job</p>
					</div>
					<div class="row" style="display: block;">
 					<label class="control-label " style="margin-left:14px;line-height:34px;">Set parameters for NFPscanner analysis </label>
 					</div>

					<div class="row">
						<label class="control-label col-md-4" style="margin-left:7px;line-height:34px;">Similarity measures between network nodes: </label>
						<div class="col-md-6" style="display:inline-block;line-height:34px;">
							<input type="radio" id="similarity-radio1" name="similarity-radio" value="sequence"> Sequence  <input type="radio" id="similarity-radio2" name="similarity-radio" checked="checked" value="geneontology"> Gene Ontology
						</div>
					</div>
					<div class="row" style="">
							<div class="form-group">
								<label class="control-label col-md-4" style="margin-left:7px;line-height:34px;">Permutation cycles:</label>
									<select class="form-control" style="width: 300px;" id="cycleValue">
											<option value="10">Fast mode (10 cycles,~0.5 hours)</option>
											<option value="100">Normal mode (100 cycles,~5 hours)</option>
											<option value="1000">Accurate mode(1000 cycles,~50 hours)</option>
									</select>
							</div>
					</div>
					<div class="row" >
						<label class="control-label col-md-4" style="margin-left:7px;line-height:34px;">Alignment algorithm:</label>
						<div class="col-md-6">
							<div style="float:left;width:200px;"><label class="radio-inline" for="inline-radio1">
								<input type="radio" id="inline-radio1" name="inline-radios" value="APCLUSTER" checked="checked"> APCLUSTER
							</label><br>
							<label class="radio-inline" for="inline-radio2">
								<input type="radio" id="inline-radio2" name="inline-radios" value="ISORANK"> ISORANK
							</label><br>
							<label class="radio-inline" for="inline-radio3">
								<input type="radio" id="inline-radio3" name="inline-radios" value="SPINAL"> SPINAL
							</label><br>
							<label class="radio-inline" for="inline-radio4">
								<input type="radio" id="inline-radio4" name="inline-radios" value="GHOST"> GHOST
							</label> </div>
							<div style="float:left;margin-top:30px;">
					 </div>
						</div>
					</div>
					<div class="row" >
							<div class="form-group">
								<a class=" col-md-3" style="margin-left:7px;line-height:34px;text-decoration:underline;cursor: pointer;" onclick="advancedEvent(1);" id="advancedBtn">Show Advanced Parameters</a>
							</div>
					</div>
				</div>

			</div>
			<!-- Advanced -->
				<div class="panel panel-default panel-collapse " data-step="3" data-intro="select a ref net to compare!" style="display: none;" id="advancedDiv">
					<div class="panel-heading" style="background: #337ab7;">
						<h2><!-- <i class="fa fa-map-marker red"></i> --><strong><font color="white">Advanced Parameters</font></strong></h2>
						<div class="panel-actions">
							<a class="btn-minimize"></a>
						</div>
					</div>
					<div class="panel-body">
						<form id="apclusterForm" name="apclusterForm">
							<div id="apclusterDiv" style="display: none;">
								<p>
									Affinity Propagation clusters data using a set of real-valued pairwise data point similarities as input.
									Each cluster is represented by a cluster center data point (the so-called exemplar).
									The method is iterative and searches for clusters maximizing an objective function called net similarity.
									 Refer to XXXX文献 for
									 <a href='javascript:void(0);' onclick="moveLink('networksimilarityHelp#SetparametersbodyA');"> more details. </a>
								 </p>
								 <div class="row" >
									<div class="form-group">
										<label class="control-label col-md-4" style="margin-left:7px;line-height:34px;">q:</label>
										<select class="form-control" style="width: 100px;" id="q" name="q">
												<option value="0" selected="selected">0</option>
												<option value="0.2">0.2</option>
												<option value="0.4">0.4</option>
												<option value="0.6">0.6</option>
												<option value="0.8">0.8</option>
												<option value="1">1</option>
										</select>
									</div>
								</div>
								<div class="row" >
									<div class="form-group">
										<label class="control-label col-md-4" style="margin-left:7px;line-height:34px;">maxits:</label>
										<select class="form-control" style="width: 100px;" id="maxits" name="maxits">
												<option value="100">100</option>
												<option value="1000" selected="selected">1000</option>
												<option value="10000">10000</option>
										</select>
									</div>
								</div>
								<div class="row" >
									<div class="form-group">
										<label class="control-label col-md-4" style="margin-left:7px;line-height:34px;">convits:</label>
										<select class="form-control" style="width: 100px;" id="convits" name="convits">
												<option value="50">50</option>
												<option value="100" selected="selected">100</option>
												<option value="150">150</option>
										</select>
									</div>
								</div>
								<div class="row" >
									<div class="form-group">
										<label class="control-label col-md-4" style="margin-left:7px;line-height:34px;">lam:</label>
										<select class="form-control" style="width: 100px;" id="lam" name="lam">
												<option value="0.5">0.5</option>
												<option value="0.6">0.6</option>
												<option value="0.7">0.7</option>
												<option value="0.8">0.8</option>
												<option value="0.9" selected="selected">0.9</option>
												<option value="1">1</option>
										</select>
									</div>
								</div>
								<div class="row" >
									<div class="form-group">
										<label class="control-label col-md-4" style="margin-left:7px;line-height:34px;">nonoise:</label>
										<select class="form-control" style="width: 100px;" id="nonoise" name="nonoise">
												<option value="FALSE" selected="selected">false</option>
												<option value="TRUE">true</option>
										</select>
									</div>
								</div>
							</div>
						</form>
						<form id="ghostForm" name="ghostForm">
							<div id="ghostDiv" style="display: none;">
								<p>
									TODO
									 <a href='javascript:void(0);' onclick="moveLink('networksimilarityHelp#SetparametersbodyA');"> more details. </a>
								 </p>
								<div class="row" >
									<div class="form-group">
										<label class="control-label col-md-4" style="margin-left:7px;line-height:34px;">hops:</label>
										<select class="form-control" style="width: 100px;" id="hops" name="hops">
												<option value="2" >2</option>
												<option value="4" selected="selected">4</option>
												<option value="6">6</option>
										</select>
									</div>
								</div>
								<div class="row" >
									<div class="form-group">
										<label class="control-label col-md-4" style="margin-left:7px;line-height:34px;">nneighbors:</label>
										<select class="form-control" style="width: 100px;" id="nneighbors" name="nneighbors">
												<option value="-1" selected="selected">-1</option>
												<option value="0">0</option>
												<option value="5">5</option>
												<option value="10">10</option>
										</select>
									</div>
								</div>
								<div class="row" >
									<div class="form-group">
										<label class="control-label col-md-4" style="margin-left:7px;line-height:34px;">searchiter:</label>
										<select class="form-control" style="width: 100px;" id="searchiter" name="searchiter">
												<option value="5">5</option>
												<option value="10" selected="selected">10</option>
												<option value="15">15</option>
										</select>
									</div>
								</div>
								<div class="row" >
									<div class="form-group">
										<label class="control-label col-md-4" style="margin-left:7px;line-height:34px;">ratio:</label>
										<select class="form-control" style="width: 100px;" id="ratio" name="ratio">
												<option value="4">4</option>
												<option value="6">6</option>
												<option value="8" selected="selected">8</option>
												<option value="10">10</option>
										</select>
									</div>
								</div>
							</div>
						</form>
						<form id="isorankForm" name="isorankForm">
							<div id="isorankDiv" style="display: none;">
								<p>
									TODO
									 <a href='javascript:void(0);' onclick="moveLink('networksimilarityHelp#SetparametersbodyA');"> more details. </a>
								 </p>
								<div class="row" >
									<div class="form-group">
										<label class="control-label col-md-4" style="margin-left:7px;line-height:34px;">k:</label>
										<select class="form-control" style="width: 100px;" id="K" name="K">
												<option value="10" selected="selected">10</option>
												<option value="20">20</option>
												<option value="30">30</option>
										</select>
									</div>
								</div>
								<div class="row" >
									<div class="form-group">
										<label class="control-label col-md-4" style="margin-left:7px;line-height:34px;">thresh:</label>
										<select class="form-control" style="width: 100px;" id="thresh" name="thresh">
												<option value="0.0001" selected="selected">0.0001</option>
												<option value="0.001" >0.001</option>
												<option value="0.00001">0.00001</option>
										</select>
									</div>
								</div>
								<div class="row" >
									<div class="form-group">
										<label class="control-label col-md-4" style="margin-left:7px;line-height:34px;">alpha:</label>
										<select class="form-control" style="width: 100px;" id="alpha" name="alpha">
												<option value="0.2">0.2</option>
												<option value="0.4">0.4</option>
												<option value="0.6" selected="selected">0.6</option>
												<option value="0.8">0.8</option>
												<option value="1">1</option>
										</select>
									</div>
								</div>
								<div class="row" >
									<div class="form-group">
										<label class="control-label col-md-4" style="margin-left:7px;line-height:34px;">beta:</label>
										<select class="form-control" style="width: 100px;" id="beta" name="beta">
												<option value="0.25">0.25</option>
												<option value="0.5" selected="selected">0.5</option>
												<option value="0.75">0.75</option>
										</select>
									</div>
								</div>
								<div class="row" >
									<div class="form-group">
										<label class="control-label col-md-4" style="margin-left:7px;line-height:34px;">maxveclen:</label>
										<select class="form-control" style="width: 100px;" id="maxveclen" name="maxveclen">
												<option value="200000" selected="selected">200000</option>
												<option value="1000000">1000000</option>
												<option value="5000000">5000000</option>
										</select>
									</div>
								</div>
							</div>
						</form>
						<form id="spinalForm" name="spinalForm">
							<div id="spinalDiv" style="display: none;">
								<p>
									TODO
									 <a href='javascript:void(0);' onclick="moveLink('networksimilarityHelp#SetparametersbodyA');"> more details. </a>
								 </p>
								<div class="row" >
									<div class="form-group">
										<label class="control-label col-md-4" style="margin-left:7px;line-height:34px;">alpha:</label>
										<select class="form-control" style="width: 100px;" id="alpha" name="alpha">
												<option value="0" >0</option>
												<option value="0.3">0.3</option>
												<option value="0.7" selected="selected">0.7</option>
												<option value="1">1</option>
										</select>
									</div>
								</div>
							</div>
						</form>
					</div>
					</div>

			<h3 > Step 4: Choose a set of basic network (<a href='javascript:void(0);' onclick="moveLink('networksimilarityHelp#librarybodyA');" >Learn more</a>)</h3>
			<div class="panel panel-default"  id="step4" data-intro="select a ref net to compare!" >
				<div class="panel-heading" style="background: #337ab7;">
					<h2><strong><font color="white">Library of Basic Networks</font></strong></h2>
					<div class="panel-actions">
						<a class="btn-minimize"></a>
					</div>
				</div>
				<div class="panel-body">
					<form action="" method="post" class="form-horizontal">
							<div class="form-group">
								<label class="col-md-4 control-label" style="text-align: left;">Select basic network set from library<br><br>
								<a class="btn btn-success" href="javascript:void(0);" onclick="moveLink('networksimilaritystatistical');"><span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>&nbsp;Detailed Information</a>
							</label>
								<div class="col-md-8">
									<select id="refnetSelect" class="form-control" size="20" style="height: 400px;">
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
							<p id="refNetDescription" style="margin-left:380px;display:none; line-height: 34px; width: 270px; float: left;font-family: 'Lucida Grande', 'Lucida Sans Unicode', 'Lucida Sans', Helvetica, Verdana, Tahoma, sans-serif">NFP of one query net is Refnet dependent. Similarity score of query and every member of refnet indicates the magnitude of functional relationship of the very pair. Network finger print is compiled from these similarity scores.</p>
						</div>
					</form>
				</div>
			</div>
			<h3 style=""> Step 5: Start to analyze  (<a href='javascript:void(0);' onclick="moveLink('networksimilarityHelp#serverbodyA');" >Learn more</a>)</h3>
			<div class="row" style="margin-top:15px;margin-left:16px;" data-step="4" data-intro="how to show the result!">
				<div class="form-group">
                    <div style="display:inline-block;">
                        <div class="checkbox" id="step5" style="line-height:22px;">
                            <label for="checkbox1">
                            	<input type="checkbox"  id="checkEmail" name="checkEmail" value="option1" style="width: 20px;height: 20px;"> (optional)&nbsp;Send the result to <input id="notifyemail" placeholder="email address" type="email" size="30" />&nbsp;
                            </label>
                        </div>
                    </div>
                </div>
			</div>
		<button style="margin-left:15px;" data-step="5" id="step6" data-intro="click to run NFP!" type="button" class="btn btn-success" onclick="submitPairwise(2)"><i class="fa fa-magic"></i> Run Network Fingerprint Scan</button> <!-- compare 2 net to ... -->
 
 		</div>
		</div>
		<!-- end: Content -->
</div>

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
											<input type="file" name="file" id="file" flag="0" class="file-input" accept="application/graphml,application/gml,application/edgelist">
										</a>
										<a href="#" id="removeFileBtn" class="btn btn-danger fileupload-exists" data-dismiss="fileupload">Remove</a>
									</div>
									</div>
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
	<div id="firstDiv"></div>
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.1.min.js"></script>
	<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="rweb/js/pairwise.js"></script>
	<script src="//cdn.bootcss.com/bootstrap-tour/0.10.1/js/bootstrap-tour.min.js"></script>
	<script type="text/javascript">

		var EMAIL = '<%=request.getSession().getAttribute("email")%>';
		$(document).ready(function(){
			if(EMAIL != 'null'){
				$("#notifyemail").val(EMAIL);
			}
			$("#jobTitle").html( generateId());
			$("input[name=inline-radios]").bind('change',function(){
				advancedEvent(0);
			});

			$("a[name=clearBtn]").bind("click",clearTxt);
			$("a[name=okBtn]").bind("click",textareaChange);

			if(getCookie("play") != 'null' && getCookie("play") != '' && getCookie("play") != null){
				openintrojs(0);
				delCookie("play");
			}
		});


		function generateId(){
			var d = new Date(),str = '';
			str += d.getFullYear();
			if(d.getMonth()+1 <10){
				str += "0";
				str  += d.getMonth() + 1;
			}else{
				str  += d.getMonth() + 1;
			}


			str  += (d.getDate() > 9 ? d.getDate() : "0"+ d.getDate());
			str += (d.getHours() >9 ? d.getHours() : "0"+ d.getHours());
			str  += (d.getMinutes() >9 ? d.getMinutes() : "0"+ d.getMinutes());
			str += (d.getSeconds() >9 ? d.getSeconds() : "0"+ d.getSeconds());
			str += d.getMilliseconds();
			var id = str;
			return id;
		}

		function openintrojs(index){
			var tour = new Tour({
				  name: "tour1",
				  backdrop : true,
				  orphan : true,
				  steps: [
				  {
					element: "#step1",
					title: "step1",
					content: "Load an example",
					placement: "bottom",
					onNext: function(){
						myscroll("#step2");
						tour.end();
						$(".step1").trigger("click");
						setCookie("tour1",1);
					}
				  },
				  {
					element: "#step2",
					title: "step2",
					placement: "bottom",
					content: "Preview input networks" ,
					onNext: function(){
						myscroll("#step3");
						setCookie("tour1",2);
					},
					onPrev: function(){
						myscroll("#step1");
					}
				  },
				  {
					element: "#step3",
					title: "step3",
					placement: "bottom",
					content: "Set parameters",
					onNext: function(){
						myscroll("#step4");
						setCookie("tour1",3);
					},
					onPrev: function(){
						myscroll("#step2");
					}
				  },
				  {
					element: "#step4",
					title: "step4",
					placement: "bottom",
					content: "Select an reference set",
					onNext: function(){
						myscroll("#step5");
						setCookie("tour1",4);
					},
					onPrev: function(){
						myscroll("#step3");
					}
				  },
				  {
					element: "#step5",
					title: "step5",
					placement: "Optionally, enter email to monitor job status",
					onNext: function(tour){
						myscroll("#step6");
						setCookie("tour1",5);
					},
					onPrev: function(){
						myscroll("#step4");
					},
					content: "send email"
				  },
				  {
					element: "#step6",
					title: "step6",
					content: "click to run Network Fingerprint Scanner!",
					placement: "right",
					onNext: function(tour){
						setCookie("tour1",6);
						submitPairwise(2);
					},
					onPrev: function(){
						myscroll("#step5");
					}
				  },
				  {
					element: "#step6",
					title: "step6",
					content: "click to run Network Fingerprint Scanner!",
					onNext: function(tour){

					}
				  }
				],
				onEnd: function(tour){
						delCookie("tour1");
				  },
			});
			myscroll(".tryexample");
			// Initialize the tour
			tour.init();
			tour.setCurrentStep(index);
			// Start the tour
			tour.start(true);
		}
	</script>
</body>
</html>
