<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'SNFResult.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="rweb/js/network/css/pure-min.css" type="text/css"/>
    <link rel="stylesheet" href="rweb/js/network/css/inchlib.css" type="text/css"/>
    <link rel="stylesheet" href="rweb/js/network/css/highlight.css" type="text/css"/>
    <link href="rweb/js/network/css/metro-blue/easyui.css" rel="stylesheet" type="text/css">
    <link href="rweb/js/network/css/icon.css" rel="stylesheet" type="text/css">
    <script src="rweb/js/network/js/jquery-2.0.3.min.js"></script>
	<script src="rweb/test/canvg.js"></script>
  </head>
  
  <body>
  <button class="exportPng">test</button><button onclick="test()" class="">test2</button>
  <a download="network" href="" style="width:120px;display:none;" class="exportPngLink" id="exportPngLink">Export network</a>

    <div id="molecule">
            <a href="" target="_blank">
                <img src="" id="molecule_img"></img>
                <div id="mol_id"></div>
            </a>
        </div>
        <div id="floating_mol">
            <img id="floating_img" src=""/>
        </div>
		<iframe id="heatmapView" width="100%" height="800px" src=""></iframe>
        
		
        <div id="cc" class="easyui-layout" style="width:100%;height:800px;">
            <div data-options="region:'center',title:'Network view'" style="width:70%">
                <div id="cytoContainer" style="width:100%;height:700px;"></div>
            </div>
            <div data-options="region:'east',title:'Control panel',split:true" style="width:30%">
                <div id="cytoPanel" class="easyui-tabs" style="width:100%;">
                    <div title="Layout" style="">
                        Layout:
                        <select name="layoutSelect" id="layoutSelect">
                            <option value="circle">circle</option>
                            <option value="random">random</option>
                            <option value="grid">grid</option>
                            <option value="concentric">concentric</option>
                            <option value="breadthfirst">breadthfirst</option>
                            <option value="dagre">dagre</option>
                            <option value="cose">cose</option>
                            <option value="cola">cola</option>
                        </select>
                        <div>

                        </div>
                    </div>
                    <div title="Filter" data-options="" style="">
						<div style="margin:20px 0 20px 0;"></div>
                        <div style="margin:10px;"><div data-options="min:0,max:90,step:1" style="width:250px;" id="selectFilterSlider"></div></div>
						<!--<input type="text" id="selectFilterValue" />-->
                    </div>
                    <div title="Visual style" data-options="" style="">
                        Global background color:<input type="color" value="#ffffff" name="bgcolor" id="bgcolor" oninput="changeBackgound(bgcolor.value)"/>
                        <h4>Nodes</h4>
                        Nodes color:<input type="color" value="#ffffff" name="nodecolor" id="nodecolor" oninput="changeNodeColor(nodecolor.value)"/><br>
                        Nodes width:<input type="text" value="80" name="nodeSize" id="nodeSize" oninput="changeNodeSize(nodeSize.value)"/>
                        <h4>Edges</h4>
                        Edges width:<input type="text" value="3" name="edgeWidth" id="edgeWidth" oninput="changeEdgeWidth(edgeWidth.value)" /><br>
                        Edges opacity:<input type="text" value="" name="edgeOpacity" id="edgeOpacity" oninput="changeEdgeOpacity(edgeOpacity.value)"/><br>
                        Edges color:<input type="color" value="" name="edgecolor" id="edgecolor" oninput="changeEdgeColor(edgecolor.value)" />
                        <h4>Label</h4>
                        Nodes label:<input type="radio" name="nodeLabelControl" value="show" checked />show<input type="radio" name="nodeLabelControl" value="hide"/>hide<br>
                        Edges label:<input type="radio" name="edgeLabelControl" value="show" checked />show<input type="radio" name="edgeLabelControl" value="hide"/>hide
                    </div>
                </div>
            </div>
        </div>
		<canvas style="width:300px;height:300px;" id="sss"></canvas>
  </body>
  <script>
  	var FILE_NAME = '<%=request.getParameter("filename") %>';
	var HEAT_MAPNAME = '<%=request.getParameter("heatmap") %>';
  	var DATA = '';
	$("#heatmapView").attr("src",HEAT_MAPNAME);
    $(document).ready(function() { //run when the whole page is loaded
    	$.ajax({
    	 	   type: "POST",
    	 	   async: false,
    	 	   url: "networkconfusion/SNFNetworkData.form",
    	 	   data: {filename:FILE_NAME},
    	 	   success: function(msg){
    	 		  DATA = msg.data;
    	 	   }
    	});
		
		var heatmapHeaderArr = ["TCGA.02.0001.01C.01R.0177.01","TCGA.02.0003.01A.01R.0177.01","TCGA.02.0007.01A.01R.0177.01","TCGA.02.0009.01A.01R.0177.01","TCGA.02.0010.01A.01R.0177.01","TCGA.02.0011.01B.01R.0177.01","TCGA.02.0014.01A.01R.0177.01","TCGA.02.0021.01A.01R.0177.01","TCGA.02.0024.01B.01R.0177.01","TCGA.02.0027.01A.01R.0177.01","TCGA.02.0028.01A.01R.0177.01","TCGA.02.0033.01A.01R.0177.01","TCGA.02.0034.01A.01R.0177.01","TCGA.02.0038.01A.01R.0177.01","TCGA.02.0043.01A.01R.0177.01","TCGA.02.0047.01A.01R.0177.01","TCGA.02.0052.01A.01R.0177.01","TCGA.02.0054.01A.01R.0177.01","TCGA.02.0057.01A.01R.0177.01","TCGA.02.0058.01A.01R.0177.01","TCGA.02.0060.01A.01R.0177.01","TCGA.02.0064.01A.01R.0202.01","TCGA.02.0069.01A.01R.0202.01","TCGA.02.0071.01A.01R.0202.01","TCGA.02.0074.01A.01R.0202.01","TCGA.02.0075.01A.01R.0202.01","TCGA.02.0080.01A.01R.0202.01","TCGA.02.0083.01A.01R.0202.01","TCGA.02.0085.01A.01R.0202.01","TCGA.02.0086.01A.01R.0202.01","TCGA.02.0089.01A.01R.0202.01","TCGA.02.0099.01A.01R.0202.01","TCGA.02.0102.01A.01R.0202.01","TCGA.02.0107.01A.01R.0202.01","TCGA.02.0113.01A.01R.0202.01","TCGA.02.0114.01A.01R.0202.01","TCGA.02.0115.01A.01R.0202.01","TCGA.02.0116.01A.01R.0202.01","TCGA.06.0122.01A.01R.0219.01","TCGA.06.0124.01A.01R.0219.01","TCGA.06.0125.01A.01R.0219.01","TCGA.06.0126.01A.01R.0219.01","TCGA.06.0128.01A.01R.0219.01","TCGA.06.0129.01A.01R.0219.01","TCGA.06.0130.01A.01R.0219.01","TCGA.06.0133.01A.02R.0219.01","TCGA.06.0137.01A.01R.0219.01","TCGA.06.0139.01A.01R.0219.01","TCGA.06.0141.01A.01R.0219.01","TCGA.06.0143.01A.01R.0219.01"];
		var tempXObj = [];
		var tempYObj = [];
		window.widthStep=0;
		window.heightStep = 0;
		$("#heatmapView").load(function(){
			//$("#heatmapView").contents().find(".brush").css("pointer-events","visibleFill");
			//$("#heatmapView").contents().find(".datapt").css("pointer-events","all");
			/*$("#heatmapView").contents().find(".datapt").each(function(index,ele){
				if(index==1){
					//var 
				}
			})*/
			$("#heatmapView").contents().find(".datapt").each(function(){
				var x = $(this).attr("x");
				var y = $(this).attr("y");
				if(-1==tempXObj.indexOf(x)){
					tempXObj.push(x);
				}
				if(-1==tempYObj.indexOf(y)){
					tempYObj.push(y);
				}
				widthStep = tempXObj[1] - tempXObj[0];
				heightStep = tempYObj[1] - tempYObj[0];
				
			})
			$("#heatmapView").contents().find("body").click(function(){
				$("#heatmapView").contents().find(".datapt").each(function(){
					$(this).removeAttr("style");
				})
			})
			/*$("#heatmapView").contents().find("#clikBtn").on("click",function(e){
				var index = 0;
				var flag = 0;
				$("#heatmapView").contents().find(".tick").each(function(){
					var classs = $(this).attr("class");
					if("tick" == classs){
						index ++;
					}
				})
				if(2==index){
					var selectedColum = getTick();
				}
				alert(index);
			})
			function getTick(){
				var result = [];
				$("#heatmapView").contents().find(".tick").each(function(){
					var classs = $(this).attr("class");
					if("tick" == classs){
						result.push($(this).text());
					}
				})
				return result;
			}*/
		})

		//window.cyto = generateCy(elements);
		
		
         //cytoscapt
        window.cyto = generateCy(getCytoElement(DATA));
		
		nodeClick(heatmapHeaderArr);
		edgeClick(heatmapHeaderArr);
		
		var test = $('#selectFilterSlider').slider({
			showTip:true,
			tipFormatter: function(value){
				return value/1000;
			},
			onComplete: function(value){
				console.log(value);
				filterValue(value);
				
			}
		});
        bindLayoutControl();
        
       
        //layout control
       
        function bindLayoutControl(){
            $("#layoutSelect").change(function(){
                var layoutName = $(this).val();
                var layout = cyto.makeLayout({
                    name: layoutName
                });

                layout.run();
            })
            $("input[name='nodeLabelControl']").change(function(){
                var value = $(this).val();
                if("show"==value){
                    cyto.$("node").removeClass("noLabel");
                }else{
                    cyto.$("node").addClass("noLabel");
                }
            })
            $("input[name='edgeLabelControl']").change(function(){
                var value = $(this).val();
                if("show"==value){
                    cyto.$("edge").removeClass("noLabel");
                }else{
                    cyto.$("edge").addClass("noLabel");
                }
            })
        }
		
		$(".exportPng").click(function(){
			var href = cyto.png();
			$(".exportPngLink").attr("href",href);
			document.getElementById("exportPngLink").click();
		})
    });
function filterValue(value){
	cyto.edges().each(function(i,ele){
		var weight = ele.data().weight;
		if(weight < value/1000){
			ele.addClass("edgeHide");
		}else{
			ele.removeClass("edgeHide");
		}
	})
}

//网络图节点选择和heatmap的交互
	function nodeClick(heatmapHeaderArr){
		cyto.on("click","node",function(evt){
			var nodeName = this.id();
			var x = widthStep*(nodeName-1);
			var y = heightStep*(nodeName-1);
			console.log(x+"---"+y);
			var heatmapRowAndCol = heatmapHeaderArr[nodeName-1];
			$("#heatmapView").contents().find(".datapt").each(function(i,ele){
				$(ele).css("opacity","1");
				var elex = $(ele).attr("x");
				var eley = $(ele).attr("y");
				if(Math.abs(x - elex)>1 && Math.abs(y - eley)>1){
					$(ele).css("opacity","0.2");
				}
			})
		})
	}
	//网络图边的选择和heatmap的交互
	function edgeClick(heatmapHeaderArr){
		cyto.on("click","edge",function(evt){
			var source = this.data().source;
			var target = this.data().target;
			var x = widthStep*(source-1);
			var y = heightStep*(target-1);
			console.log(x+"---"+y);
			$("#heatmapView").contents().find(".datapt").each(function(i,ele){
				$(ele).css("opacity","1");
				var elex = $(ele).attr("x");
				var eley = $(ele).attr("y");
				if(Math.abs(x - elex)<1 && Math.abs(y - eley)<1){
					$(ele).css("opacity","1");
				}else{
					$(ele).css("opacity","0.2");
				}
			})
		})
	}
</script>
<script src="rweb/js/network/js/kinetic-v5.1.0.min.js"></script>
<script src="rweb/js/network/js/inchlib-1.1.0.js"></script>
<script src="rweb/js/network/js/jquery.easyui.min.js"></script>
<script src="rweb/js/network/js/cytoscape.min.js"></script>
<script>
function getCytoElement(data){
	var dataLine = data.split("#");
	var dataLineNum = dataLine.length;
	var nodes = [];
	var edges = [];
	var nodeTempObj={};
	var edgeTempObj={};
	for(var i=1;i<dataLineNum;i++){
		var itemArr = dataLine[i].split(",");
		var sourceNode = itemArr[1];
		var targetNode = itemArr[2];
		var weight = itemArr[3];
		if(!check(sourceNode,nodeTempObj)){
			nodes.push({"data":{"id":sourceNode,"width":80},"classes":"nodeItem"});
			nodeTempObj[sourceNode] = "nodeId";
		}
		if(!check(targetNode,nodeTempObj)){
			nodes.push({"data":{"id":targetNode,"width":80},"classes":"nodeItem"});
			nodeTempObj[targetNode] = "nodeId";
		}
		if(!check(targetNode+"_"+sourceNode,edgeTempObj)){
			edges.push({"data":{"id":sourceNode+"_"+targetNode,"source":sourceNode,"target":targetNode,"weight":weight},"classes":"edgeItem"});
			edgeTempObj[sourceNode+"_"+targetNode] = "edgeItem";
		}		
		
	}
	console.log(edgeTempObj);
	return {"nodes":nodes,"edges":edges};
}


function check(str,obj){
	if(obj[str]){
		return true;
	}else{
		return false;
	}
}
//draw cytoscape
function generateCy(elements){
    $("#cytoContainer").cytoscape({
        style:cytoscape.stylesheet().selector("node").css({
            'content':'data(id)',
            'width': "data(width)",
            'height':"data(width)",
            'background-fit': 'cover',
            'border-color': 'white',
            'border-width': 0,
            'border-opacity': 1
        }).selector("node.noLabel").css({
        	'content':"",
        }).selector("node.highLight").css({
        	'width':100,
        	'height':100,
        	'background-color':"red"
        }).selector("edge").css({
        	'content':"data(weight)",
            'target-arrow-shape': 'none',
            //'width': "data(weight)",
            'width': 3,
            'curve-style':"bezier",
            'control-point-step-size':20,
            'line-color':'blue'
        }).selector("edge.noLabel").css({
        	'content':"",
        }).selector("edge.highLight").css({
        	'width': 10,
        	'line-color':'red'
        }).selector("edge.edgeHide").css({
			'visibility': 'hidden'
		}),
        elements:elements,
        layout:{
            name:"circle",
            padding:30,
            fit:true
        },
		zoom:0.5,
        minZoom:0.25,
        maxZoom:1
    })
    var cyto = $("#cytoContainer").cytoscape("get");
    return cyto;
}
function changeBackgound(color){
    document.getElementById("cytoContainer").style.backgroundColor = color;
}
function changeNodeColor(color){
	//var stringStylesheet = 'node { background-color: '+ color +'; }';
	//cyto.style( stringStylesheet ).update();
	cyto.nodes().style("background-color",color);
}
function changeEdgeColor(color){
	cyto.edges().style("line-color",color);
}
function changeNodeSize(nodeSize){
	cyto.nodes().style("width",nodeSize);
	cyto.nodes().style("height",nodeSize);
}
function changeEdgeWidth(edgeWidth){
	cyto.edges().style("width",edgeWidth);
}
function changeEdgeOpacity(opacity){
	cyto.edges().style("opacity",opacity);
}
function test(){
	console.log($("#heatmapView").contents().find(".colormap"))
	var svgHtml = $("#heatmapView").contents().find(".colormap")[0].outerHTML;
	canvg(document.getElementById("sss"),svgHtml);
	var imgSrc = document.getElementById("sss").toDataUrl("image/png");
}
</script>
<%--<script src="rweb/js/network/js/cytodata.js"></script>
--%></html>
