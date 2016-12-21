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
	    <link href="rweb/assets/css/style.min.css" rel="stylesheet">
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

<body>
	
	<div class="container-fluid content">		
		<!-- start: Content -->
		<div class="" style="padding:0;margin-top:10px;background:#fff;">
			<div class="row"  style="margin-left:15px;">
				<a href="" class="btn btn-primary"><i class="fa fa-file-text"></i> Edit and resubmit</a>
				<a href="" class="btn btn-info" onclick="javascript:void(0)"><i class="fa fa-print"></i> Download</a>
			</div>
			<div class="row" style="margin-top:15px;margin-left:16px;">
				<label class="control-label">Request ID : </label>
				<div style="margin-left: 10px;display: inline-block;">
					<p id="requestId" class="form-control-static"></p>
				</div>
			</div>
			<div class="row" style="margin-top:15px;margin-left:16px;">
				<label class="control-label">Discription : </label>
				<div style="margin-left: 10px;display: inline-block;">
					<p class="form-control-static">the discription</p>
				</div>
			</div>
			<div class="row" style="margin-top:15px;margin-left:16px;">
				<label class="control-label">Program : </label>
				<div style="margin-left: 10px;display: inline-block;">
					<p class="form-control-static">NFP</p>
				</div>
			</div>
			<div class="row" style="margin-top:15px;margin-left:16px;">
				<label class="control-label">Query Net : </label>
				<div style="margin-left: 10px;display: inline-block;">
					<p class="form-control-static">x:node,y:edge</p>
				</div>
			</div>
			<div class="row" style="margin-top:15px;margin-left:16px;">
				<label class="control-label">Parameters : </label>
				<div style="margin-left: 10px;display: inline-block;">
					<p class="form-control-static"><span class="badge badge-info"><i class="fa fa-chevron-down"></i></span></p>
				</div>
			</div>
			<div class="row" style="margin-top:15px;margin-left:16px;">
				<label class="control-label">Notification will be send to <span id="inputedEmail"></span></label>
				
			</div>
			<div class="row" style="margin-top:10px;">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading" style="height:34px;">
							<h2><i class="fa fa-table red"></i><strong>Graph summary</strong></h2>
						</div>
						<div class="panel-body no-padding" style="">
							<div id="netfingerprint">
							
							</div>
							<iframe width="100%" height="800" frameborder="no" scrolling="no" border="0" id="pariwiseResultIframe" src=""></iframe>
							<div id="drawchart">
								<div class="panel-heading" style="height:34px;">
									<h2><i class="fa fa-table red"></i><strong>NET1</strong></h2>
								</div>
								<div id="networkChart1"></div>
								<div class="panel-heading" style="height:34px;">
									<h2><i class="fa fa-table red"></i><strong>NET2</strong></h2>
								</div>
								<div id="networkChart2"></div>
							</div>
						</div>
					</div>	
				</div>
			</div>
		</div>
		<!-- end: Content -->
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
	<script src="rweb/assets/js/jquery-2.1.1.min.js"></script>
	<script src="rweb/assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="rweb/assets/js/bootstrap.min.js"></script>	
	<script src="rweb/assets/plugins/d3/d3.min.js"></script>	
	<script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
    <script type="text/javascript">
        // 路径配置
        require.config({
            paths: {
                echarts: 'http://echarts.baidu.com/build/dist'
            }
        });
    </script>
	<script src="rweb/js/e-charts/echarts-temp.js" type="text/javascript"></script>	

	<script src="rweb/assets/plugins/jquery-ui/js/jquery-ui-1.10.4.min.js"></script>
	
	<script>
	function iFrameHeight(id) {
	    var ifm = document.getElementById(id);
	    var subWeb = document.frames ? document.frames["iframe"].document : ifm.contentDocument;
	    if (ifm != null && subWeb != null) {
	         ifm.height = subWeb.body.scrollHeight;
	    }
	}
	$(document).ready(function(){
		$("body", window.parent.document).scrollTop(0);
		$("#requestId").html($('#resultNav', window.parent.document).attr("jobtitle"));
		$("#inputedEmail").html($('#resultNav', window.parent.document).attr("email"));
		var saveId = $('#resultNav', window.parent.document).attr("saveId");
		var type = $('#resultNav', window.parent.document).attr("type");
		if(type == 1){
			showType1Chart(saveId);
		}else if(type == 2){
			showType2Chart(saveId);
		}
	});
	function showType1Chart(saveId){
		$("#pariwiseResultIframe,#drawChart").show();
		$("#netfingerprint").css({width: 'auto',height:'auto'});
		$.ajax({
		 	   type: "POST",
		 	   async: false,
		 	   url: "networkconfusion/getPairwiseChart.form",
		 	   data: {saveId: saveId},
		 	   success: function(msg){
		 		   console.log(msg);
		 		   var filename = msg.data;
		 		   $("#pariwiseResultIframe").attr("src","concept_map?filename=" + filename.replace(/\\/g,"/"));
		 	   }
		});
		$.ajax({
		 	   type: "POST",
		 	   async: false,
		 	   url: "networkconfusion/getNetFingerPrint.form",
		 	   data: {saveId: saveId},
		 	   success: function(msg){
		 		   console.log(msg);
		 		   $("#netfingerprint").html("<strong style='font-size:16px;margin: 10px 25px;'>Netfingerprint : " + msg.data + "</strong>");
		 	   }
		});
		$.ajax({
		 	   type: "POST",
		 	   async: false,
		 	   url: "networkconfusion/getPairwiseNetChart.form",
		 	   data: {saveId: saveId},
		 	   success: function(msg){console.log(msg.data)
		 		  for(var i=0;i<msg.data.length;i++){
		 			 var data = msg.data[i];
		 			  drawChart(i+1,data.replace(/\\/g,"/"));
		 		  }
		 	   }
		});
	}
	function drawChart(num,data){
			if($("#networkChart" + num).length == 0){
				$("#drawChart").append("<div class='panel-heading' style='height:34px;'><h2><i class='fa fa-table red'></i><strong>NET" + num + "</strong></h2></div><div id='networkChart" + num + "'></div>");
			}
			var width = $(document.body).width(),
 		    height = 500;

 			var color = d3.scale.category20();
 		
 			var force = d3.layout.force()
 			    .charge(-120)
 			    .linkDistance(30)
 			    .size([width, height]);
 		
 			var svg = d3.select("#networkChart" + num).append("svg")
 			    .attr("width", width)
 			    .attr("height", height);
 		
 			d3.json(data, function(error, graph) {
 			  if (error) throw error;
 		
 			  force
 			      .nodes(graph.nodes)
 			      .links(graph.links)
 			      .start();
 		
 			  var link = svg.selectAll(".link")
 			      .data(graph.links)
 			    .enter().append("line")
 			      .attr("class", "link")
 			      .style("stroke-width", function(d) { return Math.sqrt(d.value); });
 		
 			  var node = svg.selectAll(".node")
 			      .data(graph.nodes)
 			    .enter().append("circle")
 			      .attr("class", "node")
 			      .attr("r", 5)
 			      .style("fill", function(d) { return color(d.group); })
 			      .call(force.drag);
 		
 			  node.append("title")
 			      .text(function(d) { return d.name; });
 		
 			  force.on("tick", function() {
 			    link.attr("x1", function(d) { return d.source.x; })
 			        .attr("y1", function(d) { return d.source.y; })
 			        .attr("x2", function(d) { return d.target.x; })
 			        .attr("y2", function(d) { return d.target.y; });
 		
 			    node.attr("cx", function(d) { return d.x; })
 			        .attr("cy", function(d) { return d.y; });
 			  });
 			});
	}
	function showType2Chart(saveId){
		$("#pariwiseResultIframe,#drawChart").hide();
		$("#netfingerprint").css({width: '100%',height:'500'});
		var num = $('#resultNav', window.parent.document).attr("num");
		$.ajax({
		 	   type: "POST",
		 	   async: false,
		 	   url: "networkconfusion/getPathwayLineChart.form",
		 	   data: {saveId: saveId,num: num},
		 	   success: function(msg){
		 		    console.log(msg);
		 		    var option = ECharts.ChartOptionTemplates.Lines(msg.data,"",true);
		 		    var container = $("#netfingerprint")[0];
		 		    option.func = function(param){
		 		    	console.log(param);
		 		    	var dataIndex = param.dataIndex +1;
		 		    	var libIndex = param.seriesIndex +1;
		 		    	$.ajax({
			 			 	   type: "POST",
			 			 	   async: false,
			 			 	   url: "networkconfusion/getPathwayChart.form",
			 			 	   data: {saveId: saveId,dataIndex:dataIndex,libIndex: libIndex},
			 			 	   success: function(msg){
			 			 		   console.log(msg);
			 			 		   var filename = msg.data;
			 			 		   $("#pariwiseResultIframe").show();
			 			 		   $("#pariwiseResultIframe").attr("src","concept_map?filename=" + filename.replace(/\\/g,"/"));
			 			 		   window.parent.window.iFrameHeight("resultIframe"); 
			 			 	   }
			 			});
		 		    };
					opt = ECharts.ChartConfig(container, option);
					ECharts.Charts.RenderChart(opt);
		 	   }
		});
	}
	</script>
	
</body>
</html>