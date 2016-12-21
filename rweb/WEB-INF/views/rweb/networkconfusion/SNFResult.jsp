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
  </head>
  
  <body>
    <div id="molecule">
            <a href="" target="_blank">
                <img src="" id="molecule_img"></img>
                <div id="mol_id"></div>
            </a>
        </div>
        <div id="floating_mol">
            <img id="floating_img" src=""/>
        </div>
		<div id="dendrogram"></div>
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
                        <div class="easyui-tabs" style="width:100%;height:100%;">
                            <div title="Nodes " style="overflow:auto;padding:20px;"></div>
                            <div title="Edges " style="overflow:auto;padding:20px;"></div>
                        </div>
                    </div>
                    <div title="Visual style" data-options="" style="">
                        Global background color:<input type="color" value="#ffffff" name="bgcolor" id="bgcolor" oninput="changeBackgound(bgcolor.value)"/>
                        <h4>Nodes</h4>
                        Nodes color:<input type="color" value="#ffffff" name="nodecolor" id="nodecolor" oninput="changeNodeColor(nodecolor.value)"/><br>
                        Nodes width:<input type="text" value="80" name="nodeSize" id="nodeSize" oninput="changeNodeSize(nodeSize.value)"/>
                        <h4>Edges</h4>
                        Edges width:<input type="text" value="3" name="edgeWidth" id="edgeWidth" oninput="changeEdgeWidth(edgeWidth.value)"/><br>
                        Edges opacity:<input type="text" value="" name="edgeOpacity" id="edgeOpacity" oninput="changeEdgeOpacity(edgeOpacity.value)"/><br>
                        Edges color:<input type="color" value="" name="edgecolor" id="edgecolor" oninput="changeEdgeColor(edgecolor.value)"/>
                        <h4>Label</h4>
                        Nodes label:<input type="radio" name="nodeLabelControl" value="show" checked/>show<input type="radio" name="nodeLabelControl" value="hide"/>hide<br>
                        Edges label:<input type="radio" name="edgeLabelControl" value="show" checked/>show<input type="radio" name="edgeLabelControl" value="hide"/>hide
                    </div>
                </div>
            </div>
        </div>
  </body>
  <script>
  	var FILE_NAME = '<%=request.getParameter("filename") %>';
  	var DATA = '';
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
         //cytoscapt
        var cyto = generateCy(getCytoElement(DATA));
        bindLayoutControl();
        window.dendrogram = new InCHlib({ //instantiate InCHlib
            target: "dendrogram", //ID of a target HTML element
            metadata: true, //turn on the metadata 
            column_metadata: true, //turn on the column metadata 
            max_height: 1000, //set maximum height of visualization in pixels
            width: 800, //set width of visualization in pixels
            heatmap_colors: "RdLrBu", //set color scale for clustered data
            metadata_colors: "RdLrBu", //set color scale for metadata
            highlight_colors:"RdGy"
        });

        //dendrogram.read_data_from_file("data/chembl_era_normalized.json"); //read input json file
		dendrogram.read_data_from_file(FILE_NAME); //read input json file
        dendrogram.draw(); //draw cluster heatmap
        //heatmap和cytoscape的交互
        dendrogram.events.row_onclick = function(object_ids, evt){
            cyto.nodes().removeClass("highLight");
            cyto.edges().removeClass("highLight");
            var attrs = evt.target.attrs;
            var column = attrs.column.split("_");
            var header_type2value = {"d": _this.heatmap_header[column[1]],
                                    "m": _this.metadata_header[column[1]],
                                    "Count": "Count"};
              
            if(_this.column_metadata_header !== undefined){
                header_type2value["cm"] = _this.column_metadata_header[column[1]];
            }
              
            var value = attrs.value;//对应值
            var header = header_type2value[column[0]];//列名
            console.log(object_ids+"-----"+header+"=="+value);

            cyto.$("#"+object_ids).addClass("highLight");
            cyto.$("#"+header.substr(1)).addClass("highLight");

            var edgeId = object_ids+"_"+header.substr(1);
            if(object_ids>header.substr(1)){
                edgeId = header.substr(1)+"_"+object_ids;
            }
            cyto.$("#"+edgeId).addClass("highLight");
        };
        //cytoscape和heatmap的交互
        cyto.on("click","node",function(evt){
            var nodeId = this.id();
            dendrogram.highlight_rows(nodeId);

            //dendrogram.highlight_rows(nodeId); 
        })
        cyto.on("click","edge",function(evt){
            var sourceId = this.data().source;
            var targetId = this.data().target;
            dendrogram.highlight_column_cluster(targetId);
        })
       
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
    });
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
        }),
        elements:elements,
        layout:{
            name:"circle",
            padding:30,
            fit:true
        }
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
</script>
<%--<script src="rweb/js/network/js/cytodata.js"></script>
--%></html>
