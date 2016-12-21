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
    <title>Network Fingerprint Scanner</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
		<link rel="shortcut icon" href="static/image/w1.png"   type="image/x-icon"/>
		<script>
			if (navigator.userAgent.split(";")[1].toLowerCase().indexOf("msie") > 0 ){
				window.location.href = "supportInfo";
			}
		</script>
	    <!-- Css files -->
		<link href="rweb/css/header.css"  type="text/css" rel="stylesheet">
	   	<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<link href="rweb/assets/css/font-awesome.min.css" rel="stylesheet">
	    <link href="rweb/assets/css/style.min.css" rel="stylesheet">
		<link href="rweb/assets/css/style.css" rel="stylesheet" type="text/css">
		<link href="rweb/css/header.css"  type="text/css" rel="stylesheet">
		<link href="rweb/css/comment.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="rweb/assets/js/bootstrap-fileupload/bootstrap-fileupload.min.css" />
		
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

<body class="sticky-header-on tablet-sticky-header" style="padding-bottom:0;	font-size:medium
; line-height: 1.5em">
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
			<header id="" class="sticky-header" style="opacity: 1;padding:0;">

				<!-- Main Header -->
				<div id="main-header" style="height: 80px;">
					<div id="logo" class="col-lg-12 col-md-12 col-sm-12">
							<img src="static/image/b2.png" style="width: 110px;margin-top: -20px;margin-right: -20px;"/>
							<span style="color:white;font-size:33px;margin-top: 1px;">Network Fingerprint Scanner</span>
							<span style="color: white; font-size: 15px; top: 28px; margin-left: 5px;">NFPscanner:a server for knowledge-based characterization of biomedical networks
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


						<li >
							<a class="fa " href="networksimilarityHome.html">Home</a>
						</li>
					<li  style="width: 300px;" id="Fingerprint">
							<a class="fa  " href="networksimilarityAnalysis?type=1" onclick="changeSubTab('networksimilarityAnalysis_1',this,2)">Network Fingerprint Scan</a>
						</li>
						<li style="width: 250px;" id="Alignment">
							<a class="fa  " href="networksimilarityAnalysis?type=2" onclick="changeSubTab('networksimilarityAnalysis_3',this,1)">Pairwise Alignment</a>
						</li>
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
					<div class="modal fade" id="selectFileModal" style="top:25%;margin:0 auto;width:620px;" tabindex="-1" role="dialog" aria-labelledby="selectFileModalLabel">
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
                        <label class="col-md-3 control-label">Input File:</label>
                        <div class="col-md-9">
                            <div class="fileupload fileupload-new" style="margin-bottom:0;" data-provides="fileupload">
                            	<span class="form-control fileupload-preview" style="float: left;width:150px;" ></span>
								<div class="input-group">
									<div class="input-group-btn">
										<a class="btn btn-default btn-file">
											<span class="fileupload-new">Add file</span>
											<span class="fileupload-exists">Change</span>
											<input type="file" name="file" id="file" flag="0" class="file-input"  >
										</a>
										<a href="#" id="removeFileBtn" class="btn btn-danger fileupload-exists" data-dismiss="fileupload">Remove</a>
									</div>
								</div>
							</div>
                        </div>

                    </div>
           		<div class="row">
					 <div class="form-group" style="">
						<div class="col-md-3 " >
							<div class="form-group" style="margin-bottom:0;width: 620px;" >
								<label class="col-md-3 control-label" for="input-small" >ID Type:</label>
								<div class="col-md-9">
									<select class="form-control select2" style="width: 180px;float: left;margin-left: 5px;" id="idTypeUpload" name="idType">
										<option value="GeneSymbol">GeneSymbol</option>
										<option value="ENSEMBL">ENSEMBL</option>
										<option value="REFSEQ_PROTEIN">REFSEQ_PROTEIN</option>
										<option value="REFSEQ_RNA">REFSEQ_RNA</option>
										<option value="UNIPROT">UNIPROT</option>
										<option value="HGNC">HGNC</option>
										<option value="Entrez" selected id="loadSampleOption">Entrez</option>
									</select>
									<span class="" style="float: left;margin-left: 10px;margin-top: 5px;" >Specify if necessary. </span>
								</div>
								
							</div>
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


		<section id="content" style="min-height: 1400px;" id="section1" >
	<section class="section full-width-bg" style="padding-top:5px;">
				<ol class="breadcrumb" id="breadcrumb" style="margin:10px 0 0 0;display: none;">
					<li><a href="networksimilarityAnalysis" style="font-size: 15px;">Analysis</a></li>
					<li><span id="analysisName" style="font-size: 15px;">NetworkFingerPrint</span></li>
					<span style="float:right;padding:0 10px;" class="btn btn-default" onclick="startIntro()">Tutorials</span>
				</ol>
				<iframe width="100%" style="min-height: 1450px;" onload="iFrameHeight('pariwiseIframe')" frameborder="no" scrolling="no" border="0" id="pariwiseIframe" name="pariwiseIframe" ></iframe>

		</section>						</section>
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
<input type="hidden" id="play" />
	</div>

				<div class="modal fade" id="tipModal1" style="top:15%;" tabindex="-1" role="dialog" aria-labelledby="selectFileModalLabel">
	  <div class="modal-dialog" style="border:none;width: 400px;" role="document" >
		<div class="box border">
			<div class="box-title">
				<h4><i class="fa fa-check-square-o"></i>Tip</h4>
				<div class="tools">
					<a href="javascript:;" data-dismiss="modal" id="tipXBtn" aria-label="Close" class="remove">
						<i class="fa fa-times"></i>
					</a>
				</div>
			</div>
			<div class="box-body">
				<form class="form-horizontal" role="form">
                    <div class="form-group"  align="center">
                        <label class="" id="tipInfo1" style="width: 100%;"></label>
                        <div class="col-md-9">
                            <div class="fileupload fileupload-new" style="margin-bottom:0;" data-provides="fileupload">
								<img src="static/image/loading.gif"  id="imgLoading" style="display: none;" />
							</div>
                        </div>
                    </div>
                </form>
				<div class="modal-footer" style="padding: 10px 0 0 0;margin-top:0px;">
					<button type="button" id="tipCancelBtn" style="display: none;" class="btn btn-default" data-dismiss="modal" >Cancel</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal" aria-label="Close" id="tipOKBtn" >OK</button>

				</div>
			</div>
		</div>
	  </div>
	</div>




	<div class="modal fade" id="skipModal" style="top:15%;" tabindex="-1" role="dialog" aria-labelledby="skipModalLabel">
	  <div class="modal-dialog" style="border:none;width: 400px;" role="document" >
		<div class="box border">
			<div class="box-title">
				<h4><i class="fa fa-check-square-o"></i>System info</h4>
				<div class="tools">
					<a href="javascript:;" data-dismiss="modal" id="skipTipBtn" aria-label="Close" class="remove">
						<i class="fa fa-times"></i>
					</a>
				</div>
			</div>
			<div class="box-body">
				<form class="form-horizontal" role="form">
                    <div class="form-group"  align="center">
                        <label class="" id="skipTipLabel" style="width: 100%;"></label>
                    </div>
                </form>
				<div class="modal-footer" style="padding: 10px 0 0 0;margin-top:0px;">
					<button type="button" id="stillbtn" class="btn btn-default" data-dismiss="modal" >Still run</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal" aria-label="Close" id="skipbtn" >Skip</button>

				</div>
			</div>
		</div>
	  </div>
	</div>
	 <div class="modal fade" id="tipModalLoading" style="top:30%;" tabindex="-1" role="dialog" aria-labelledby="selectFileModalLabel">
	  <div class="modal-dialog" style="border:none;width: 250px;height: 150px;" role="document" >
		<div class="box border">
			<div class="box-title">
				<h4><i class="fa fa-check-square-o"></i>Tip</h4>
				<div class="tools">
				</div>
			</div>
			<div class="box-body">
				<form class="form-horizontal">
                    <div class="form-group"  align="center">
                        <div class="col-md-9">
                            <div class="fileupload fileupload-new" style="margin-bottom:0;" align="center" data-provides="fileupload">
								<img src="static/image/loading.gif"  id="imgLoading" width="100px;" style="margin-left: 65px;"/>
							</div>
                        </div>
                    </div>
                </form>
			</div>
		</div>
	  </div>
	</div>

	<div class="modal fade" id="tipformatModal" style="top:15%;" tabindex="-1" role="dialog" aria-labelledby="selectFileModalLabel">
	  <div class="modal-dialog" style="border:none;width: 500px;" role="document" >
		<div class="box border">
			<div class="box-title">
				<h4><i class="fa fa-check-square-o"></i>Tip</h4>
				<div class="tools">
				</div>
			</div>
			<div class="box-body">
				<form class="form-horizontal">
                    <div class="form-group"  align="center">
                        <label class="" id="tipInfo" style="width: 100%;">To verify the format, please choose!</label>
                        <div class="col-md-9">
								<label class="control-label col-md-1" style="margin-left: 10px;width: 120px;" >Format Type:</label>
									<select class="form-control" style="width: 200px;" id="formatType" name="formatType">
										<option value=edgelist>edgelist</option>
										<option value="graphml">graphml</option>
										<option value="gml">gml</option>
									</select>
									<input type="hidden" id="formatHid"/>
                        </div>
                        <div class="col-md-9">
								<label class="control-label col-md-1" style="margin-left: 10px;width: 120px;" >ID Type:</label>
									<select class="form-control select2" style="width: 200px;" id="idTypeUploadformat" >
										<option value="GeneSymbol">GeneSymbol</option>
										<option value="ENSEMBL">ENSEMBL</option>
										<option value="REFSEQ_PROTEIN">REFSEQ_PROTEIN</option>
										<option value="REFSEQ_RNA">REFSEQ_RNA</option>
										<option value="UNIPROT">UNIPROT</option>
										<option value="HGNC">HGNC</option>
										<option value="Entrez" selected id="loadSampleOption">Entrez</option>
									</select>
									<input type="hidden" id="formatHid1"/>
                        </div>
                    </div>
                </form>
				<div class="modal-footer" style="padding: 10px 0 0 0;margin-top:0px;">
					<button type="button" class="btn btn-primary" data-dismiss="modal" aria-label="Close" onclick="formatOK();" >OK</button>
				</div>
			</div>
		</div>
	  </div>
	</div>
	<input type="hidden" id='libraryHidden'>
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.1.min.js"></script>
	<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="rweb/assets/js/bootstrap-fileupload/bootstrap-fileupload.min.js"></script>
	<script type="text/javascript">
	var REQUEST_TYPE = '<%=request.getParameter("type")%>';
	var play = '<%=request.getParameter("play")%>';
	var ID = '<%=request.getParameter("id")%>';
	var library = '<%=request.getParameter("library")%>';
	$(document).ready(function(){
		if(REQUEST_TYPE != null){
			$("#analysis" + REQUEST_TYPE).trigger("click");
			if(REQUEST_TYPE==1){
				$("#Fingerprint").addClass('current-menu-item');
				document.getElementById('pariwiseIframe').src = 'networksimilarityAnalysis_1';
				$("#analysisName").html('Network fingerprint scan');
			}
			if(REQUEST_TYPE==2){

				$("#Alignment").addClass('current-menu-item');
				document.getElementById('pariwiseIframe').src = 'networksimilarityAnalysis_3';
				$("#analysisName").html('Pairwase Alignment');
			}
		}
		if(play != undefined&& play != null && play == "1"){
			$("#play").val(play);
		}


		if(library!=undefined&&library!=null){
			$("#libraryHidden").val(library);
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
	function changeSubTab(type,obj,num){

		$("body").scrollTop(0);
		$("#topAnalysis").trigger("click");
		document.getElementById('pariwiseIframe').src = type;
		$("#analysisName").html($(obj).text());
	}
	function changeTab(type,obj){
		$("body").scrollTop(0);
		var jobID = $("#jobTitle",window.frames['pariwiseIframe'].document).val();
		if(type == 2){
		 	if(ID == undefined||ID==""||ID=='null'){
		 		return;
				window.location.href = 'networksimilarityAnalysis';

			}else{
	 			window.location.href = 'networksimilarityResult_2?&id=' + ID;

			}
			$("#pariwiseIframe,#breadcrumb").hide();
			return;
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
	var typeID = "";
	function MyModal(str,type){
		$("#selectFileModal").modal(str);
		if(str == 'show'){
			$("#file").attr("flag",type);
			$("#okUpload").attr("flag",type);
		}
		typeID = type;
	}
	function MyModalTip(str){

			$("#tipInfo1").html(str);
			$("#tipModal1").modal({backdrop: 'static', keyboard: false});

	}

	function skipModalTip(str){

		$("#skipTipLabel").html(str);
		$("#skipModal").modal({backdrop: 'static', keyboard: false});
	}

	function ModalTipLoading(str){
		if(str=='hide'){
			$("#tipModalLoading").modal(str);
		}else{
			$("#tipModalLoading").show();
			$("#tipModalLoading").modal({backdrop: 'static', keyboard: false});
		}
	}


	function MyModalFormatTip(id){
		$("#formatHid").val(id);
		$("#tipformatModal").modal({backdrop: 'static', keyboard: false});
	}
	function submitUploadFile(){
		check();
	}
    function check() {
        var f = document.getElementById("file").files;
		for(var i=0;i<f.length;i++){
			if(f[i].size>1*1024*1024){
				var tipInfo111 = f[0].name +" file is too large!Less than 1 MB file please upload again!";
				showTip(tipInfo111);
				return;
			}
		}
		var filename = $("#file").val();
 		if(filename.endWith(".graphml")||filename.endWith(".gml")||filename.endWith(".edgelist")){
			var type = $("#okUpload").attr("flag");
			$("#pariwiseIframe")[0].contentWindow.submitUploadFile(type);
			//$("#file").attr("flag");

			var showname = f[0].name.substring(0,f[0].name.indexOf("."));
			$("#fileName"+$("#file").attr("flag"),window.frames['pariwiseIframe'].document).val(f[0].name);
			if(showname.length>10){
				$("#selectFileWidth"+$("#file").attr("flag"),window.frames['pariwiseIframe'].document).css("width","200px");

				if(showname.length>=20){
					showname = showname.substring(0,17)+"…";
				}
			}
			$("#selectFile"+$("#file").attr("flag"),window.frames['pariwiseIframe'].document).text(showname);
		}else{
			showTip("File upload error format!");
		}
    }
	function showTip(info){

		window.parent.window.MyModalTip(info);

	}

	 String.prototype.endWith=function(s){
		  if(s==null||s==""||this.length==0||s.length>this.length)
		     return false;
		  if(this.substring(this.length-s.length)==s)
		     return true;
		  else
		     return false;
		  return true;
	}
	function startIntro(){
		document.getElementById('pariwiseIframe').contentWindow.startIntro();
	}

	function formatOK(){
		var id = $("#formatHid").val();
		var txt = $("#textareaNet"+id,window.frames['pariwiseIframe'].document).val();
		var select = $("#formatType").val();
		var idType = $("#idTypeUploadformat").val();
		$.ajax({
		 	   type: "POST",
		 	   async: true,
		 	   data:{content:txt,type:select,id:id,idType:idType},
		 	   url: "networksimilarity/formatChange.form",
		 	   success: function(msg){
		 	       var result = JSON.parse(msg);
		 
		 	       var data = result.data;
		 	       if(data == 'success'){

		 	    	   var num = result.result;
		 	    	   var node = result.node;
		 	    	 $("#fileName"+id,window.frames['pariwiseIframe'].document).val("Input"+id+"."+select);
		 	    	   if(num == -9999){
		 	    		   showTip("The "+idType+" mistakes!");
		 	    	   }else {
		 	    		   $("#tipXBtn").hide();
		 	    		   $("#tipCancelBtn").show();
		 	    		   $("#tipCancelBtn").bind("click",function(){
		 	    			   $("#textareaNet" + id).val("");
		 	    			   $("#previewNet" + id).html("A preview of your query network will show here");
		 	    			   $("#hiddenTxt" + id).html("0");
		 	    		   });
		 	    		   $(window.parent.document.getElementById("tipOKBtn")).bind("click",function(){
		 	    			  $("#pariwiseIframe")[0].contentWindow.showNetAllInfo(id);
		 	    		   });
	 	    		 		   
		 	    		  $("#pariwiseIframe",parent.document).css("height",($("#pariwiseIframe",parent.document).height()+40)+"px");
		 	    		   var table="";
		 	    		   console.log(result.error);
		 	    		   for(var dd in result.error){
		 	    			   table += "<tr><td>"+result.error[dd]+"</td><td>"+dd+"</td></tr>";
		 	    		   }
		 	    		   showTip(
		 	    				   "In the gene identifiers you provided:<br>"+
		 	    				   +node + " matched to human genes,<br><a href='javascript:void(0)' style='cursor: pointer;' title=\"Check the details\" onclick='return $(\"#errorDiv\").show()'>"
		 	    				   +num + "</a> did not match to any human genes.<br>"+
		 	    				   "Make sure that you have selected the correct networks.<br><br><b><center>continue?</center><b>"
		 	    				   +"<br>" +
		 	    				   "<div id='errorDiv' style='display:none'><p style='margin-left:10px;'>not match info</p><div  style='width:100%;overflow: auto;border-top:1px solid;border-bottom:1px solid;    border-color: #67c2ef;'><table><tr><td>id</td><td>data</td></tr></table></div><div style='width:100%;height:200px;overflow: auto;border-bottom:1px solid;border-color: #67c2ef;'><table>"+table+"</table></div></div>");
		 	    
		 	    		   
 					/* 	showTip("In the gene identifiers you provided:<br>"
		 	    				+node + " matched to human genes,<br>"
		 	    				+num + " did not match to any human genes.<br>"
		 	    				+"Make sure that you have selected the correct networks.<br><br><b><center>continue?</center><b>"
		 	    											); */
		 	    	   }
		 	       }else if(data == 'error'){
				    	  showTip("Format or input errors!");
				      }


			  }
		});

	}
	</script>
</body>
</html>
