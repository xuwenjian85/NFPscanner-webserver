
$(document).ready(function(){
	loadTableData();
	
});
//  显示关键字对应数据列表
function loadTableData() {
	$("#systemRefNet").bootstrapTable('destroy', null);
	$("#systemRefNet").bootstrapTable({
		method : 'post',
		url : "networkconfusion/showSystemLibraryTable.form",
		cache : false,
		striped : true,
		pagination : true,
		pageSize : 10,
		pageList : [ 10, 25, 50, 100, 200 ],
		search : true,
		showColumns : false,
		showRefresh : false,
		minimumCountColumns : 2,
		clickToSelect : false,
		columns : [ {
			field : 'systemLibrary',
			title : 'System Library',
			align : 'left',
			valign : 'bottom',
			sortable : true
		}, {
			field : 'size',
			title : 'size',
			align : 'center',
			valign : 'middle',
			sortable : true
		}, {
			field : 'createTime',
			title : 'Create Date',
			align : 'center',
			valign : 'top',
			sortable : true
		}, {
			field : 'updateTime',
			title : 'Update Date',
			align : 'center',
			valign : 'middle',
			clickToSelect : true,
			sortable : true
		} , {
			field : 'popularity',
			title : 'popularity',
			align : 'left',
			valign : 'middle',
			clickToSelect : true,
			sortable : false,
			formatter: popularityFormatter
		}, {
			field : 'operation',
			title : 'Operation',
			align : 'center',
			valign : 'middle',
			clickToSelect : true,
			sortable : false,
			formatter: operationFormatter
		}, {
			field : 'name',
			title : 'name',
			align : 'center',
			valign : 'middle',
			clickToSelect : true,
			visible : false
		}],onLoadSuccess:function(data){
			$(".search").css("margin-right",'20px');
			//$(".search").before("<span style='margin: 5px 5px 5px 5px;'>The library of basic networks contains 49 sets of manually curated basic networks, which are originally retrieved from 6 network databases (KEGG, Reactome, NCI, SPIKE, HumanCyc, PANTHER).<a href='networksimilarityHelp#librarybodyA'> Learn more </a></span>");
			$(".search").before("<span style='margin: 5px 5px 5px 5px;'>The library of basic networks contains 49 sets of manually curated basic networks, which are originally retrieved from seven network databases (KEGG, Reactome, NCI, SPIKE, HumanCyc, PANTHER and BioCarta).<a href='networksimilarityHelp#librarybodyA'> Learn more </a></span>");

			if(libraryNet!=null&&libraryNet!=undefined&&libraryNet!=""&&libraryNet!="null"){
				$(".search input").val(libraryNet);
				$(".search input").keyup();
			}

		}
	});
}

function operationFormatter(value, row, index){
	return [
		      "<div><button type='button' onclick='uselibrary(\""+row.id+"\")' class='btn btn-default btn-success' >use library</button>&nbsp;&nbsp;&nbsp;<button type='button' onclick='expand(\""+row.rData+"\")' class='btn btn-default btn-primary' >expand</button><div>"
		   ].join('');
}

function uselibrary(id){
	window.location.href = "networksimilarityAnalysis?type=1&library=" +id;
}
function expand(index){
	showTip(index);
}
function showTip(rData){
	loadTableContentData(rData);
	

}
var indexs = "-999";
//显示关键字对应数据列表
function loadTableContentData(name) {
	$("#systemContent").bootstrapTable('destroy', null);
	$("#systemContent").bootstrapTable({
		method : 'get',
		url : "networkconfusion/showSystemLibraryContentTable.form?name="+name,
		cache : false,
		striped : true,
		pagination : true,
		pageSize : 10,
		pageList : [ 10, 25, 50, 100, 200 ],
		search : true,
		showColumns : false,
		showRefresh : false,
		minimumCountColumns : 2,
		clickToSelect : false,
		columns : [ {
			field : 'id',
			title : 'ID',
			align : 'center',
			valign : 'bottom',
			sortable : true
		}, {
			field : 'description',
			title : 'Description',
			align : 'left',
			valign : 'middle',
			sortable : true
		}, {
			field : 'category',
			title : 'Category',
			align : 'left',
			valign : 'top',
			sortable : true
		}, {
			field : 'edgeCount',
			title : 'Edge Count',
			align : 'center',
			valign : 'middle',
			clickToSelect : true
		} , {
			field : 'nodeCount',
			title : 'Node Count',
			align : 'center',
			valign : 'middle',
			clickToSelect : true
		}],onLoadSuccess : function(){
			$("#tipModal2222").modal('show');
			$(".search").css("margin-right",'20px');
			
			
		}
	});
	
}
function  popularityFormatter(value, row, index){
		var num = row.rowNum;
		var color = "";
		var width = "";
		if(value != "0"){
			if(num<11){
				color = colorArr[num-1];
				width = (11-num)*5+"px";
			}else{
				color = colorArr[10];
				width = "5px";
			}
		}else{
			color = colorArr[10];
			width = "5px";
		}
		return [
			      "<div style='width: "+width+"; height: 20px;background-color:"+color+";margin: 0 0'>"+""+"</div>"
			   ].join('');
}

//定义11种颜色
//var colorArr = ['#EE0000','#EE30A7','#EE5C42','#EE7600','#EE7AE9','#EE9A00','#EEAD0E','#EEC591','#EED2EE','#EEDC82',"#AEEEEE"];
var colorArr = ['#9B1A53','#A63467','#B14F7C','#BB6990','#C684A4','#D19EB9','#DBB9CD','#E6D3E1','#F1EEF6','#F2F1F4',"#FFFFFF"];

//['#FFFFFF‘,#F1EEF6','#E6D3E1','#DBB9CD','#D19EB9','#C684A4','#BB6990','#B14F7C','#A63467','#9B1A53']





