
function initResultInfo(url){
	console.log(url);
/*	$.getJSON(url,function(data){
		console.log(data);
	}); */
	$.getJSON(url,function(data){
/*		   $("#div111").hide();
		   $("#div222").show();*/
//		   $("#netNameP").html("net1 net2");
		saveStorage(data);

		sessionStorage.setItem("clusterData",JSON.stringify(data));
		paging(data);
		net1paging();
		net2paging();
	});
	bindResize(document.getElementById('moveDiv'));
}

function bindResize(el)
{
	var test = document.getElementById('drawchartLeft').style;
	var test2 = document.getElementById('drawchartRight').style;
	console.log(test);
	console.log(test2);
    //初始化参数
    var els = el.style,
    //鼠标的 X 和 Y 轴坐标
    x = y = 0;
    //邪恶的食指
    $(el).mousedown(function (e)
    {
        //按下元素后，计算当前鼠标与对象计算后的坐标
        x = e.clientX - el.offsetWidth,
    y = e.clientY - el.offsetHeight;
        //在支持 setCapture 做些东东
        el.setCapture ? (
        //捕捉焦点
            el.setCapture(),
        //设置事件
            el.onmousemove = function (ev)
            {
                mouseMove(ev || event);
            },
            el.onmouseup = mouseUp
        ) : (
            //绑定事件
            $(document).bind("mousemove", mouseMove).bind("mouseup", mouseUp)
        );
        //防止默认事件发生
        e.preventDefault();
    });
    //移动事件
    function mouseMove(e)
    {
        //宇宙超级无敌运算中...
    	var allwidth =$("#allDiv").width();
		if(e.clientX<=(allwidth-200)&&e.clientX>=200){
			test.width = e.clientX + 'px';
			test2.width = (allwidth-e.clientX-6) +"px";
			//showEchart();
		}
		$('div [name = tooltip_'+'networkChart'+1+"]").remove();
		$('div [name = tooltip_'+'networkChart'+2+"]").remove();
		$('div [name = tooltip_'+'networkChart'+3+"]").remove();
		$('div [name = tooltip_'+'networkChart'+4+"]").remove();
    }
    //停止事件
    function mouseUp()
    {
        //在支持 releaseCapture 做些东东
        el.releaseCapture ? (
        //释放焦点
            el.releaseCapture(),
        //移除事件
            el.onmousemove = el.onmouseup = null
        ) : (
            //卸载事件
            $(document).unbind("mousemove", mouseMove).unbind("mouseup", mouseUp)
        );
    }
}


function saveStorage(data){
	var num = 0;
	var net1Num = 0;
	var net2Num = 0;
	var arr1 = new Array();
	var arr2 = new Array();
	var arr3 = new Array();
	for(var i=0 ; i<data.episodes.length ;i++){
		for(var k = 0;k<data.episodes[i].links.length;k++,num ++){//
			for(var j=0 ;j<data.themes.length;j++ ){
				if(data.themes[j].name==data.episodes[i].links[k]){
					var dataStorage ={"name":data.episodes[i].name,"type1":data.episodes[i].type,
							"score":data.episodes[i].score,"linksName":data.themes[j].name,
							"type2":data.themes[j].type,"slug":data.themes[j].slug,"group":"","type3":"themes","netscore":data.themes[j].score};
					arr1[num]=dataStorage;
					arr2[net1Num]=dataStorage;
					net1Num++;
				}
			}

			for(var j=0 ;j<data.perspectives.length;j++ ){
				if(data.perspectives[j].name==data.episodes[i].links[k]){
					var dataStorage={"name":data.episodes[i].name,"type1":data.episodes[i].type,
							"score":data.episodes[i].score,"linksName":data.perspectives[j].name,
							"type2":data.perspectives[j].type,"slug":"","group":data.perspectives[j].group,"type3":"perspectives","netscore":data.perspectives[j].score};
					arr1[num]=dataStorage;
					arr3[net2Num]=dataStorage;
					net2Num++;
				}
			}
		}
	}
	sessionStorage.setItem("dataStorage",JSON.stringify(arr1));
	sessionStorage.setItem("net1Storage",JSON.stringify(arr2));
	sessionStorage.setItem("net2Storage",JSON.stringify(arr3));
}


function showLeftNetInfo(){
	var html = "<tr><td>name</td><td>Cluster</td></tr>";
	var currentpage = $("#net1Page").val();
	var da = JSON.parse(sessionStorage.getItem("net1Storage"));

	var i = currentpage*10;
	for(i ; i < da.length; ){
		/*alert(da.linksName);*/
		html += "<tr><td>"+da[i].linksName+"</td><td>"+da[i].name+"</td></tr>";
		i++
		if((i)%10==0){
			break;
		}
	}
	$("#net1table").html(html);
}

function showRightNetInfo(){
	var html = "<tr><td>name</td><td>Cluster</td></tr>";
	var currentpage = $("#net2Page").val();
	var da = JSON.parse(sessionStorage.getItem("net2Storage"));
	var i = currentpage*10;
	for(i ; i < da.length; ){

		html += "<tr><td>"+da[i].linksName+"</td><td>"+da[i].name+"</td></tr>";
		i++
		if((i)%10==0){
			break;
		}
	}
	$("#net2table").html(html);
}

function showClusterNetInfo(data){

	sessionStorage.setItem("clusterData",JSON.stringify(data));
	////////////////////
	var html = "<tr><td>name</td><td>score</td></tr>";
	var currentpage = $("#clusterPage").val();
/*	var da = JSON.parse(sessionStorage.getItem("dataStorage"));*/
	var i = currentpage*10;
	for(i ; i < data.episodes.length; ){
		html += "<tr><td>"+data.episodes[i].name+"</td><td>"+data.episodes[i].score+"</td></tr>";
		i++
		if((i)%10==0){
			break;
		}
	}
	$("#clustertable").html(html);
}

function paging(data){
//	var allNum = data.themes.length + data.perspectives.length;
	var allNum = data.episodes.length;
	var currentpage = $("#clusterPage").val();
	 	function pageselectCallback(page_id, jq) {
	        //alert(page_id); 回调函数，进一步使用请参阅说明文档
//		 alert(11);
	 		$("#clusterPage").val(page_id);
	 		showClusterNetInfo(data);

	    }
	    $("#Pagination").pagination(allNum, {
	        callback: pageselectCallback,//PageCallback() 为翻页调用次函数。
	        prev_text: "Prev",
	        next_text: "Next ",
	        items_per_page: 10, //每页的数据个数
	        num_display_entries: 2, //两侧首尾分页条目数
	        current_page: currentpage,   //当前页码
	        num_edge_entries: 3 //连续分页主体部分分页条目数

	    });
}
function net1paging(){
//	var allNum = data.themes.length + data.perspectives.length;
	var allNum = JSON.parse(sessionStorage.getItem("net1Storage")).length;
	var currentpage = $("#net1Page").val();
	 	function pageselectCallback(page_id, jq) {
	        //alert(page_id); 回调函数，进一步使用请参阅说明文档
//		 alert(11);
	 		$("#net1Page").val(page_id);
	 		showLeftNetInfo();

	    }
	    $("#net1Pagination").pagination(allNum, {
	        callback: pageselectCallback,//PageCallback() 为翻页调用次函数。
	        prev_text: "Prev",
	        next_text: "Next ",
	        items_per_page: 10, //每页的数据个数
	        num_display_entries: 2, //两侧首尾分页条目数
	        current_page: currentpage,   //当前页码
	        num_edge_entries: 3 //连续分页主体部分分页条目数

	    });
}

function net2paging(){
	var allNum = JSON.parse(sessionStorage.getItem("net2Storage")).length;
	var currentpage = $("#net2Page").val();
	 	function pageselectCallback(page_id, jq) {
	 		$("#net2Page").val(page_id);
	 		showRightNetInfo();

	    }
	    $("#net2Pagination").pagination(allNum, {
	        callback: pageselectCallback,//PageCallback() 为翻页调用次函数。
	        prev_text: "Prev",
	        next_text: "Next ",
	        items_per_page: 10, //每页的数据个数
	        num_display_entries: 2, //两侧首尾分页条目数
	        current_page: currentpage,   //当前页码
	        num_edge_entries: 3 //连续分页主体部分分页条目数

	    });
}

var by = function(name,minor){

    return function(o,p){

        var a,b;

        if(o && p && typeof o === 'object' && typeof p ==='object'){

            a= o[name];

            b= p[name];

            if(a=== b){

                return typeof minor === 'function'? minor(o,p):0;

            }

            if(typeof a === typeof b){

                return a <b ? -1:1;

            }

            return typeof a < typeof b ? -1 : 1;

        }else{

            thro("error");

        }

    }

}


function sortData(){
	var msg = JSON.parse(sessionStorage.getItem("Type2Data"));
	var aa = msg.data.sort(by('value',by('group')));
	sessionStorage.setItem("Type2DataNew",JSON.stringify(aa));
}

//导出PDF
function downloadPDF(){
	var type = $("#typeIDs").val();
	var  verticalOffset = 20;
//	return;
	var doc = new jsPDF();
	var href = document.location.href;
	var	lines = doc.setFontSize(12).splitTextToSize('Hyperlink:   '+href,150);
	doc.setFontSize(22);
	doc.text(30, verticalOffset, 'Report of Network Fingerprint Scanning');//title
	doc.setFontSize(12);
	verticalOffset += 10
	doc.text(50, verticalOffset, 'A knowledge-based characterization of biomedical networks');//shuoming
	verticalOffset += 10
	doc.text(20, verticalOffset, 'Job ID:   '+$("#requestId").html());
	verticalOffset += 10
	doc.text(20,  verticalOffset + 12 / 72, lines);
	verticalOffset += (lines.length + 0.5) * 12 / 72;
	verticalOffset += 15
	doc.text(20, verticalOffset, 'Start at:   '+$("#start_time").html());
	verticalOffset += 5
	doc.text(20, verticalOffset, 'Complete at:   '+$("#completedtime").html());
	verticalOffset += 5
	doc.text(20, verticalOffset, 'Total run time:   '+$("#timing").html());
	verticalOffset += 10
	if(type=='1'){
		doc.text(20, verticalOffset, 'Input network #1:   '+$("#queryNet1 a").html());
		verticalOffset += 5
		doc.text(20, verticalOffset, 'Input network #2:   '+$("#queryNet2 a").html());
	}else if(type=='2'){
		doc.text(20, verticalOffset, 'Input network:   '+$("#queryNet a").html());
		verticalOffset += 5
		doc.text(20, verticalOffset, 'Reference set:   '+$("#libraryNet a").html());
	}

	if($("#inputedEmail").html()!=undefined&&$("#inputedEmail").html().trim()!=""){
		verticalOffset += 10;
		doc.text(20, verticalOffset, 'Your email:   '+$("#inputedEmail").html());
	}
	doc.setLineWidth(0.5);

	if(type=='1'){//Type2Data
		var score = $("#bdscore").val();
//	 	var netnames = $("#netNameP").html();
	 	//var netnamesArr = netnames.split(",");
	 	verticalOffset += 5;
		doc.text(20, verticalOffset,"        net1:                                net2:                              score ");
		verticalOffset += 5;
		var group1 = $("#queryNet1 a").html();
		group1 = group1.substr(0,group1.trim().indexOf("."));
		if(group1.length>15){
			group1 = group1.substring(0,15)+"…";
		}else{
			var cha = 15 - group1.length;
			for(var a=0;a<cha;a++){
				group1 += "";
			}
			group1 += "  ";
		}
		var group2 = $("#queryNet2 a").html();
		group2 = group2.substr(0,group2.trim().indexOf("."));
		if(group2.length>15){
			group2 = group1.substring(0,15)+"…";
		}else{
			var cha = 15 - group2.length;
			for(var a=0;a<cha;a++){
				group2 += "";
			}
			group2 += "  ";
		}
		doc.text(20, verticalOffset,"        "+group1+"                             "+group2+"                              "+score+" ");
		verticalOffset += 5;
		doc.line(20, verticalOffset, 190, verticalOffset);
	}else if(type=='2'){
		var flag1 = false;
		var num1 = 0 ;
		var max1 = 0;
		var pageNum = 0;
		var nets = JSON.parse(sessionStorage.getItem("Type2Data"));
		var msg = JSON.parse(sessionStorage.getItem("Type2DataNew"));
		for(var k = 0 ;k< nets.net.length ; k++ ){
			var net = nets.net[k];
			verticalOffset += 10;
			doc.text(20, verticalOffset, '#'+(k+1)+', Network fingerprint for ' + net);
			verticalOffset += 10;
			doc.text(30, verticalOffset, 'Basic Network');
			doc.text(150, verticalOffset, 'Z-score');
			verticalOffset += 5;
			doc.line(30, verticalOffset , 165, verticalOffset);

			for(var i=msg.length-1,l=0;i > -1 ;i--,l++){
				if(verticalOffset>=270){
					doc.addPage();
					verticalOffset = 15;
					pageNum = pageNum + 1;
				}
				var nodeNet = msg[i].group.trim();
				if(nodeNet == net){
					var basicNetwork = msg[i].refname.trim();
					if(basicNetwork.length>50){
						basicNetwork = basicNetwork.substring(0,51)+"…  ";
					}else{
						var cha = 50 - basicNetwork.length;
						for(var a=0;a<cha;a++){
							basicNetwork += "  ";
						}
						basicNetwork += "    ";
					}
					verticalOffset += 5;
					var group = msg[i].group.trim();
					group = group.substr(0,msg[i].group.trim().indexOf("."));
					if(group.length>15){
						group = group.substring(0,15)+"…";
					}else{
						var cha = 15 - group.length;
						for(var a=0;a<cha;a++){
							group += "";
						}
						group += "  ";
					}

					doc.text(30,verticalOffset,basicNetwork)
					doc.text(150,verticalOffset,msg[i].value.trim())
				}

			}
		}
		verticalOffset += 10;
		doc.text(100,verticalOffset,'Fingerprint Graph')
		saveAsImage2();
		if(verticalOffset<=265){
			verticalOffset += 5;
			if(verticalOffset<=135){
				verticalOffset += 5;
				doc.addImage(path, 20, verticalOffset, 180, 100);

			}else{
				doc.addPage();
				verticalOffset = 20;
				doc.addImage(path, 20, verticalOffset, 180, 100);
			}

		}else{
			doc.addPage();
			verticalOffset = 20;
			doc.addImage(path, 20, verticalOffset, 180, 100);
		}

	}

	doc.save('resultInfo.pdf');
}
String.prototype.trim=function(){
    return this.replace(/(^\s*)|(\s*$)/g, "");
 }

function pdfInfo(doc){
	doc.text(50, 20, 'Network Finger Print');
}

var path ;
function saveAsImage(){
	var svgHtml = $("#netfingerprint div").html();
	var imgSrc= $("canvas")[0].toDataURL("image/png");
	console.log(imgSrc);
	path = imgSrc;
}
var path2;
function saveAsImage2(){
	html2canvas($("#downloadALLTP"), {
	    allowTaint: true,
	    taintTest: false,
	    onrendered: function(canvas) {
	        canvas.id = "mycanvas";
	        //生成base64图片数据
	        var dataUrl = canvas.toDataURL();
	        path =  dataUrl;
	    }
	});


}
function showLegend(id){
	if(id==1){
		$("#legendZ").show();
		$("#downloadTLDiv").css("width",'2%')
		$("#sssssss").css("width",'98%')
		$("#legendJIDV").hide();
		$("#downloadTLDiv").removeClass("righttableY");
	}else{
		$("#legendZ").hide();
		$("#downloadTLDiv").css("width",'15%')
		$("#sssssss").css("width",'85%')
		$("#legendJIDV").show();
		$("#downloadTLDiv").addClass("righttableY");
	}
	$("#downloadTL").html("");
	showEchart();
}
function saveAsImage3(){
	html2canvas($("#downloadALLTP"), {
	    allowTaint: true,
	    taintTest: false,
	    onrendered: function(canvas) {
	        canvas.id = "mycanvas";
	        //生成base64图片数据
	        var dataUrl = canvas.toDataURL();
	        var newImg = document.createElement("img");
	        saveFile(dataUrl,"line.png")
	    }
	});


}
var saveFile = function(data, filename){
    var save_link = document.createElementNS('http://www.w3.org/1999/xhtml', 'a');
    save_link.href = data;
    save_link.download = filename;

    var event = document.createEvent('MouseEvents');
    event.initMouseEvent('click', true, false, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);
    save_link.dispatchEvent(event);
};


function downloadImage(type){
	if(type==1){
		saveFile("data:image/png;base64," + vis1.png(),"net1.png");
	}else if(type==2){
		saveFile("data:image/png;base64," + vis2.png(),"net2.png");
	}else if(type==3){
		saveAsImage3();
	}

}

String.prototype.replaceAll = function(reallyDo, replaceWith, ignoreCase) {
    if (!RegExp.prototype.isPrototypeOf(reallyDo)) {
        return this.replace(new RegExp(reallyDo, (ignoreCase ? "gi": "g")), replaceWith);
    } else {
        return this.replace(reallyDo, replaceWith);
    }
}


function showBaseInfoTable(msg){
	var clusterData = JSON.parse(msg.clusterData);
	var datas = "[";
	for(var i = 0 ;i <clusterData.length; i++){
		datas += "{\"cluster\":\"cluster #"+i+"\",\"score\":\""+clusterData[i]+"\",\"operate\":\""+i+"\"}";
		if(i!=clusterData.length-1){
			datas+=",";
		}
	}
	datas+="]";
	var dateeee = JSON.parse(datas);
	$("#clusterTableInfo").bootstrapTable('destroy', null);
	$("#clusterTableInfo").bootstrapTable({
		method : 'get',
		data : dateeee,
		cache : false,
		striped : true,
		pagination : true,
		pageSize : 10,
		pageList : [ 10, 'All' ],
		search : true,
		showColumns : false,
		showRefresh : false,
		minimumCountColumns : 2,
		clickToSelect : false,
		columns : [ {
			field : 'cluster',
			title : 'Cluster',
			align : 'left',
			valign : 'bottom',
			sortable : true
		}, {
			field : 'score',
			title : 'Similarity',
			align : 'left',
			valign : 'middle',
			sortable : true
		}, {
			field : 'operate',
			title : 'Highlight',
			align : 'center',
			valign : 'top',
			sortable : false,
			formatter: popularityFormatter
		}],
		onLoadSuccess:function(data){
			/*var p = "<div class=\"columns columns-left btn-group pull-left\"><button class=\"btn btn-default\" type=\"button\" name=\"refresh\" title=\"show all\">show all</button></div>";
			$(".search").before(p);*/
		},
		onSearch: function () {
/*			var p = "<div class=\"columns columns-left btn-group pull-left\"><button class=\"btn btn-default\" type=\"button\" name=\"refresh\" title=\"show all\">show all</button></div>";
			$("#clusterTableInfo").find(".search").before(p);*/
			initChangeColorCheck();
			mouseoverNetworkTable("cluster");
		},
		onPageChange: function(){
/*			var p = "<div class=\"columns columns-left btn-group pull-left\"><button class=\"btn btn-default\" type=\"button\" name=\"refresh\" title=\"show all\">show all</button></div>";
			$("#clusterTableInfo").find(".search").before(p);*/
			initChangeColorCheck();
			mouseoverNetworkTable("cluster");
		}
	});
	
	var p = "<div  style='margin-left: 10px;'  class=\"columns columns-left btn-group pull-left\"><button class=\"btn btn-success\" type=\"button\" name=\"refresh\" onclick='showAll(\"home\")' title=\"show all\">show all</button></div>";
	$("#home .search").before(p);
	$("#home .search").css("width","70%");
	mouseoverNetworkTable("cluster");

}

function showAll(id){
	$("#"+id+" .search input").val("");
	$("#"+id+" .search input").keyup();
}
var divs ;
function showEkgEgoInfoTable(msg,div){
	divs = div;
	
	$("#" + div + "TableInfo").bootstrapTable('destroy', null);
	$("#" + div + "TableInfo").bootstrapTable({
		method : 'get',
		data : msg,
		cache : false,
		fontSize:10,
		striped : true,
		pagination : true,
		pageList : [ 10, 50, 100 ],
		search : true,
		showColumns : false,
		showRefresh : false,
		minimumCountColumns : 2,
		clickToSelect : false,
		columns : [ {
			field : 'Description',
			title : 'Description',
			align : 'left',
			valign : 'bottom',
			sortable : true
		}, {
			field : 'GeneRatio',
			title : 'Coverage',
			align : 'left',
			valign : 'middle',
			sortable : true
		}, {
			field : 'pvalue',
			title : 'p-value',
			align : 'left',
			valign : 'top',
			sortable : true
			
		}, {
			field : 'operate',
			title : 'Highlight',
			align : 'center',
			valign : 'top',
			sortable : false,
			formatter: divFormatter
		}, {
			field : 'geneID',
			title : 'geneID',
			align : 'center',
			valign : 'top',
			sortable : false,
			visible : false
		}],
		onSearch: function () {
/*			var p = "<div class=\"columns columns-left btn-group pull-left\"><button class=\"btn btn-default\" type=\"button\" name=\"refresh\" title=\"show all\">show all</button></div>";
			$("#" + div + "TableInfo").find(".search").before(p);*/
			initChangeColorCheck();
			mouseoverNetworkTable(div);
		},
		onPageChange: function(){
	/*		alert("2"+divs);
			var p = "<div class=\"columns columns-left btn-group pull-left\"><button class=\"btn btn-default\" type=\"button\" name=\"refresh\" title=\"show all\">show all</button></div>";
			$("#" + div + "TableInfo").find(".search").before(p);*/
			initChangeColorCheck();
			mouseoverNetworkTable(div);
		},
		onLoadSuccess:function(data){
			/*var p = "<div class=\"columns columns-left btn-group pull-left\"><button class=\"btn btn-default\" type=\"button\" name=\"refresh\" title=\"show all\">show all</button></div><div class=\"pull-right search\"><input class=\"form-control\" type=\"text\" placeholder=\"Search\"></div>";
			$("#" + div + "TableInfo .fixed-table-toolbar").html(p);*/
	/*		var p = "<div class=\"columns columns-left btn-group pull-left\"><button class=\"btn btn-default\" type=\"button\" name=\"refresh\" title=\"show all\">show all</button></div>";
			$(".search").before(p);*/
		}
	});
	if(div=='ekg'){
		
		var p = "<div id='ekgDivss' style='margin-left: 10px;'  class=\"columns columns-left btn-group pull-left\"><button class=\"btn btn-success\" type=\"button\" name=\"refresh\" onclick='showAll(\"ios\")' title=\"show all\">show all</button></div>";
		$("#ios .search").before(p);
		$("#ios .search").css("width","70%");
	}else{
		
		var p = "<div id='ekgDivss'  style='margin-left: 10px;' class=\"columns columns-left btn-group pull-left\"><button class=\"btn btn-success\" type=\"button\" name=\"refresh\" onclick='showAll(\"ego\")' title=\"show all\">show all</button></div>";
		$("#ego .search").before(p);
		$("#ego .search").css("width","70%");
	}
	
	mouseoverNetworkTable(div);
}

function popularityFormatter(value, row, index){
	return "<input class='checkboxColor' type='checkbox' cluster='" + (parseInt(row.operate)+1) + "' onclick='changeColorCheck(this)' style='display:inline-block;top:0;' /><a onclick='$(this).prev().trigger(\"click\");' style='cursor:pointer;width:16px;height:16px;display:inline-block;background:none'></a>";
}

function divFormatter(value, row, index){
	return "<input geneid='" + row.geneID + "' class='checkboxColor" + divs + "' type='checkbox' onclick='changeColorCheck" + divs + "(this)' style='display:inline-block;top:0;' /><a onclick='$(this).prev().trigger(\"click\");' style='cursor:pointer;width:16px;height:16px;display:inline-block;background:none'></a>";
}

function showLineInfoTable(msg){
	var clusterData = msg.data;
	$("#lineTableInfo").bootstrapTable('destroy', null);
	$("#lineTableInfo").bootstrapTable({
		method : 'get',
		data : clusterData,
		cache : false,
		striped : true,
		pagination : true,
		pageSize : 10,
		pageList : [ 10, 'All' ],
		search : true,
		showColumns : false,
		minimumCountColumns : 2,
		clickToSelect : false,
		columns : [ {
			field : 'group',
			title : 'query',
			align : 'left',
			valign : 'bottom',
			sortable : true
		}, {
			field : 'description',
			title : 'description',
			align : 'left',
			valign : 'middle',
			sortable : true
		}, {
			field : 'value',
			title : 'score',
			align : 'left',
			valign : 'top',
			sortable : true,
		}],
		onSearch: function () {
			bindLineTables();
		},
		onPageChange: function(){
			bindLineTables();
		},
		onLoadSuccess:function(data){
			$(".search input").val("");
			$(".search input").keyup();
		}
	});
	bindLineTables();
}
function clearFilter(){
	$("#linefingerprint .search input").val("");
	$("#linefingerprint .search input").trigger("keyup");
}
var mouseoverLineTable = false;
function bindLineTables(){
	$("#lineTableInfo tr").on("mouseover",function(event){
		var data = JSON.parse(sessionStorage.getItem("Type2Data")).data;
		var data_name = $(this).find("td:eq(0)").text();
		var __desc = $(this).find("td:eq(1)").text();
		var ref_name = 0;
		for(var i=0;i<data.length;i++){
			var oo = data[i];
			//console.log(oo.description + "---" + __desc)
			if(oo.description == __desc){
				ref_name = parseInt(oo.name)-1;
				break;
			}
		}
		mouseoverLineTable = true;
		ECharts.option.chart.component.tooltip.showTip({ seriesName: data_name, dataIndex:ref_name });
	});
}
function filterTableInfo(node_id,node_cluster){
	node_cluster = parseInt(node_cluster) -1;
	$("#myTabContent #home .search input").val("cluster #" + node_cluster);
	$("#myTabContent #home .search input").keyup();
	$("#myTabContent #ios .search input").val(node_id);
	$("#myTabContent #ios .search input").keyup();
	$("#myTabContent #ego .search input").val(node_id);
	$("#myTabContent #ego .search input").keyup();
}
function clearFilterTableInfo(){
	$("#myTabContent #home .search input").val("");
	$("#myTabContent #home .search input").keyup();
	$("#myTabContent #ios .search input").val("");
	$("#myTabContent #ios .search input").keyup();
	$("#myTabContent #ego .search input").val("");
	$("#myTabContent #ego .search input").keyup();
}
var baseCheckbox = ['#8DCBC3','#D28BCC','#907CC7','#C26661','#639BC7','#E9AE3D','#333333'];
var egoCheckbox = ['#8DCBC3','#D28BCC','#907CC7','#C26661','#639BC7','#E9AE3D','#333333'];
var ekgCheckbox = ['#8DCBC3','#D28BCC','#907CC7','#C26661','#639BC7','#E9AE3D','#333333'];
function initChangeColorCheck(){
	var colorEntries = [];
	var opacities = [];
	var borderColors = [];
	$(".checkboxColorego:checked").each(function(index,dom){
		$(dom).prop("checked",false);
		$(dom).next().css("background","none");
	});
	$(".checkboxColorego:disabled").each(function(index,dom){
		$(dom).prop("disabled",false);
	});
	$(".checkboxColorekg:checked").each(function(index,dom){
		$(dom).prop("checked",false);
		$(dom).next().css("background","none");
	});
	$(".checkboxColorekg:disabled").each(function(index,dom){
		$(dom).prop("disabled",false);
	});

	baseCheckbox = ['#8DCBC3','#D28BCC','#907CC7','#C26661','#639BC7','#E9AE3D','#333333'];
	egoCheckbox = ['#8DCBC3','#D28BCC','#907CC7','#C26661','#639BC7','#E9AE3D','#333333'];
	ekgCheckbox = ['#8DCBC3','#D28BCC','#907CC7','#C26661','#639BC7','#E9AE3D','#333333'];
}
var globalcolorlist = ['#8DCBC3','#D28BCC','#907CC7','#C26661','#639BC7','#E9AE3D','#333333'];
function mouseoverNetworkTable(div){
	$("#" + div + "TableInfo tbody tr").on("mouseover",function(){

		if(div == 'cluster'){
			var cluster = $(this).find("input[type='checkbox']").attr("cluster");
			var bgcolor = $(this).find("input[type='checkbox']").attr("bg");
			if(typeof(bgcolor) == 'undefined'){
				bgcolor = "#20A8D8";
			}
			var nodesarr = [];
			var vis1nodes = vis1.nodes();
			var vis2nodes = vis2.nodes();
			for(var i=0;i<vis1nodes.length;i++){
				var nodedata = vis1nodes[i].data;
				if(nodedata.group == cluster){
					nodesarr.push(nodedata.id);
				}
			}
			for(var i=0;i<vis2nodes.length;i++){
				var nodedata = vis2nodes[i].data;
				if(nodedata.group == cluster){
					nodesarr.push(nodedata.id);
				}
			}
			var edgeOpacityEntries = [];
			var edgeColorEntries = [];
			for(var i=0;i<nodesarr.length;i++){
				for(var j=0;j<nodesarr.length;j++){
					var node_id = nodesarr[i] + "_" + nodesarr[j];
					edgeOpacityEntries.push({attrValue: node_id,value: 1});
					edgeColorEntries.push({attrValue: node_id,value: bgcolor});
				}
			}

			var discreteMapper =  {
						defaultValue: "#555",
						discreteMapper: {
								attrName: "group",
								entries: [{attrValue: cluster,value:bgcolor }]
							}
						};
			var discreteMapper1 =  {
					defaultValue: "#555",
					discreteMapper: {
							attrName: "group",
							entries: [{attrValue: cluster,value: $(this).find("input[type='checkbox']").attr("bg")}]
						}
					};

			var opacity = {
						defaultValue: 0.2,
						discreteMapper: {
								attrName: "group",
								entries: [{attrValue: cluster,value: 1}]
						}
			};
			var edgeOpacity = {
						defaultValue: 0.1,
						discreteMapper: {
								attrName: "id",
								entries: edgeOpacityEntries
						}
			};
			var edgeColor = {
						defaultValue: "#999999",
						discreteMapper: {
								attrName: "id",
								entries: edgeColorEntries
						}
			};
			var style1 = vis1.visualStyle();
			style1.nodes.color = discreteMapper;
			style1.nodes.opacity = opacity;
			style1.nodes.borderColor = discreteMapper1;
			style1.edges.opacity = edgeOpacity;
			style1.edges.color = edgeColor;
			vis1.visualStyle(style1);
			var style2 = vis2.visualStyle();
			style2.nodes.color = discreteMapper;
			style2.nodes.opacity = opacity;
			style2.nodes.borderColor = discreteMapper1;
			style2.edges.opacity = edgeOpacity;
			style2.edges.color = edgeColor;
			vis2.visualStyle(style2);
		}else{
			var nodelist = $(this).find("input[type='checkbox']").attr("geneid").split("/");
			var bgcolor = $(this).find("input[type='checkbox']").attr("bg");
			var colorEntries = [];
			var opacities = [];
			var borderColors = [];
			var edgeOpacityEntries = [];
			var edgeColorEntries = [];
			if(typeof(bgcolor) == 'undefined'){
				bgcolor = "#20A8D8";
			}
			for(var i=0;i<nodelist.length;i++){
				colorEntries.push({attrValue: nodelist[i],value: bgcolor});
				opacities.push({attrValue: nodelist[i],value: 1});
				borderColors.push({attrValue: nodelist[i],value: bgcolor});
			}

			for(var i=0;i<nodelist.length;i++){
				for(var j=0;j<nodelist.length;j++){
					var node_id = nodelist[i] + "_" + nodelist[j];
					edgeOpacityEntries.push({attrValue: node_id,value: 1});
					edgeColorEntries.push({attrValue: node_id,value: bgcolor});
				}
			}

			var discreteMapper =  {
						defaultValue: "#555",
						discreteMapper: {
								attrName: "id",
								entries: colorEntries
							}
						};
			var discreteMapper1 =  {
					defaultValue: "#555",
					discreteMapper: {
							attrName: "id",
							entries: borderColors
						}
					};

			var opacity = {
						defaultValue: 0.2,
						discreteMapper: {
								attrName: "id",
								entries: opacities
						}
			};
			var edgeOpacity = {
						defaultValue: 0.1,
						discreteMapper: {
								attrName: "id",
								entries: edgeOpacityEntries
						}
			};
			var edgeColor = {
						defaultValue: "#999999",
						discreteMapper: {
								attrName: "id",
								entries: edgeColorEntries
						}
			};
			var style1 = vis1.visualStyle();
			style1.nodes.color = discreteMapper;
			style1.nodes.opacity = opacity;
			style1.nodes.borderColor = discreteMapper1;
			style1.edges.opacity = edgeOpacity;
			style1.edges.color = edgeColor;
			vis1.visualStyle(style1);
			var style2 = vis2.visualStyle();
			style2.nodes.color = discreteMapper;
			style2.nodes.opacity = opacity;
			style2.nodes.borderColor = discreteMapper1;
			style2.edges.opacity = edgeOpacity;
			style2.edges.color = edgeColor;
			vis2.visualStyle(style2);
		}
	});
	$("#" + div + "TableInfo tbody tr").on("mouseout",function(){
		if(div == 'cluster'){
			var colorEntries = [];
			var opacities = [];
			var borderColors = [];
			$(".checkboxColor").each(function(index,dom){
				var cluster = parseInt($(dom).attr("cluster"));
				if($(dom).prop("checked")){
					colorEntries.push({attrValue: cluster,value: $(dom).attr("bg")});
					opacities.push({attrValue: cluster,value: 1});
					borderColors.push({attrValue: cluster,value: $(dom).attr("bg")});
				}else{
					colorEntries.push({attrValue: cluster,value: '#808080'});
					borderColors .push({attrValue: cluster,value: '#808080'});
					opacities.push({attrValue: cluster,value: 0.6});
				}
			});
			var discreteMapper =  {
						discreteMapper: {
								attrName: "group",
								entries: colorEntries
							}
						};
			var discreteMapper1 =  {
					discreteMapper: {
							attrName: "group",
							entries: borderColors
						}
					};

			var opacity = {
						discreteMapper: {
								attrName: "group",
								entries: opacities
						}
			};
			var style1 = vis1.visualStyle();
			style1.nodes.color = discreteMapper;
			style1.nodes.opacity = opacity;
			style1.nodes.borderColor = discreteMapper1;
			style1.edges.opacity = 0.8;
			style1.edges.color = "#999999";
			vis1.visualStyle(style1);
			var style2 = vis2.visualStyle();
			style2.nodes.color = discreteMapper;
			style2.nodes.opacity = opacity;
			style2.nodes.borderColor = discreteMapper1;
			style2.edges.color = "#999999";
			style2.edges.opacity = 0.8;
			vis2.visualStyle(style2);
		}else{
			var colorEntries = [];
			var opacities = [];
			var borderColors = [];
			for(var k=0;k<globalcolorlist.length;k++){
				var dom = $(".checkboxColor" + div + "[bg='" + globalcolorlist[k] + "']:checked");
				if(dom.length == 0){
					continue;
				}
				var nodelist = dom.attr("geneid").split("/");

				for(var i=0;i<nodelist.length;i++){
					colorEntries.push({attrValue: nodelist[i],value: dom.attr("bg")});
					opacities.push({attrValue: nodelist[i],value: 1});
					borderColors.push({attrValue: nodelist[i],value: dom.attr("bg")});
				}
			}
			var discreteMapper =  {
				discreteMapper: {
						attrName: "id",
						entries: colorEntries
					}
				};
			var discreteMapper1 =  {
					discreteMapper: {
							attrName: "id",
							entries: borderColors
						}
					};

			var opacity = {
						discreteMapper: {
								attrName: "id",
								entries: opacities
						}
			};
			var style1 = vis1.visualStyle();
			style1.nodes.color = discreteMapper;
			style1.nodes.opacity = opacity;
			style1.nodes.borderColor = discreteMapper1;
			style1.edges.opacity = 0.8;
			style1.edges.color = "#999999";
			vis1.visualStyle(style1);
			var style2 = vis2.visualStyle();
			style2.nodes.color = discreteMapper;
			style2.nodes.opacity = opacity;
			style2.nodes.borderColor = discreteMapper1;
			style2.edges.opacity = 0.8;
			style2.edges.color = "#999999";
			vis2.visualStyle(style2);
				}
	});
}
