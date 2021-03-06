var FIRST_UPLOAD = true;
var UPLOADED_FLAG = 0;
var UPLOADCOUNT = 0;
$(document).ready(function(){
	var alphaSlider = $('#Alpha').slider({
		  range: "min",
		  value: 50,
		  min: 30,
		  max: 80,
		  slide: function( event, ui ) {
			$( "#alphaValue" ).val(ui.value/100);
		  }
	});
	var alphanewSlider = $('#AlphaNew').slider({range: "min",
		  value: 50,
		  min: 30,
		  max: 80,
		  slide: function( event, ui ) {
			$( "#alphaNewValue" ).val(ui.value/100);
		  }
	});
	$("#alphaValue").keyup(function(){
		alphaSlider.slider("value",this.value*100);
	});
	$("#alphaNewValue").keyup(function(){
		alphanewSlider.slider("value",this.value*100);
	});
	$('.ui-tooltip-pointer-down-inner').each(function(){
		var bWidth = $('.ui-tooltip-pointer-down-inner').css('borderTopWidth');
		var bColor = $(this).parents('.ui-slider-tooltip').css('backgroundColor')
		$(this).css('border-top', bWidth+' solid '+bColor);
	});	
});
function iFrameHeight(id) {
	$("body").scrollTop(0);
    var ifm = document.getElementById(id);
    var subWeb = document.frames ? document.frames["iframe"].document : ifm.contentDocument;
    if (ifm != null && subWeb != null) {
         ifm.height = subWeb.body.scrollHeight;
    }
}
function renameFile(obj){
	var oldvalue = $(obj).attr("oldvalue");
	var flag = $(obj).attr("flag");
	
	if($("#selectDataView").length > 0){
		$("#selectDataView select > option").each(function(index,dom){
			var name = $(dom).val();
			if(("data" + flag + ".txt") == name){
				$(dom).text($(obj).val());
			}
		});
	}
	$("#heatmapDataSelect > option").each(function(index,dom){
		var name = $(dom).val();
		if(("data" + flag + ".txt") == name){
			$(dom).text($(obj).val());
		}
	});
	$(obj).attr("oldvalue",$(obj).val());
}
function toAddFile(){
	var html = "";
	var count = $("#addFileForm .form-group").length + 1;
	//$("#deleteLable" + (count-1)).hide();
	html += "<div class='form-group'>" +
			"<label class='col-md-1 control-label' id='labelData" + count + "'>data" + count + "</label>" +
			"<div class='col-md-1'>" +
				"<button class='btn btn-info' data-toggle='modal' id='btnAddFile" + count + "' onclick='openUploadModal(" + count + ")'>Add File" + "</button>" +
			"</div>" +
			"<label class='col-md-1 control-label' id='typeLabel" + count + "'>type" +count +"</label>" +
			"<div class='col-md-2'>" +
				"<select class='form-control'>" +
				  "<option>Continuous</option>" +
				  "<option>Discrete</option>" +
				"</select>" +
			"</div>" +
			"<label class='col-md-1 control-label' id='dataNameLabel" + count + "'>name" +count + "</label>" +
			"<div class='col-md-2'>" +
				"<input type='text' flag='" + count + "' name='defname' onkeyup='renameFile(this)' oldvalue='data" + count + "' id='defname" + count + "' class='form-control' value='data" + count + "'>" +
			"</div>" 
			+"<div class=' col-md-4'>"
			+"<label class='checkbox inlineBlock' style=''>"
			+"	<input type='checkbox' class='uniform' id='normalization" + count + "' checked>"
			+"	Normalization"
			+"</label> "
			+"<label class='checkbox inlineBlock' style=''>"
			+"	<input type='checkbox' class='uniform' id='logtransfor" + count + "'>log2"
			+"	transformation"
			+"</label>"
			+"<label class='checkbox inlineBlock' style='padding:0 0 0 5'>" 
			+ "<i class='fa fa-minus-circle' style='color:red;margin-top:12px;' id='deleteLable" + count + "' onclick='deleteFile(this)' title='删除'></i>" 
			+"</label>" 
		  +"</div>"
		"</div>";
	$("#addFileForm").append(html);
}
function toAddNewFile(){
	var html = "";
	var count = $("#addNewFileForm .form-group").length + 1;
	$("#deletenewLable" + (count-1)).hide();
	html += "<div class='form-group'>" +
			"<label class='col-md-1 control-label'>new data" + count + "</label>" +
			"<div class='col-md-1'>" +
				"<button class='btn btn-info' data-toggle='modal' onclick='openUploadNewModal(" + count + ")'>Add File" + "</button>" +
			"</div>" +
			"<label class='col-md-1 control-label'>type" +count +"</label>" +
			"<div class='col-md-2'>" +
				"<select class='form-control'>" +
				  "<option>Continuous</option>" +
				  "<option>Discrete</option>" +
				"</select>" +
			"</div>" +
			"<label class='col-md-1 control-label'>name" +count + "</label>" +
			"<div class='col-md-2'>" +
				"<input type='text' flag='" + count + "' name='defname' onkeyup='renameFile(this)' oldvalue='newdata" + count + "' id='newname" + count + "' class='form-control' value='newdata" + count + "'>" +
			"</div>" 
			+"<div class=' col-md-4'>"
			+"<label class='checkbox inlineBlock' style=''>"
			+"	<input type='checkbox' class='uniform' id='newnormalization" + count + "' checked>"
			+"	Normalization"
			+"</label> "
			+"<label class='checkbox inlineBlock' style=''>"
			+"	<input type='checkbox' class='uniform' id='newlogtransfor" + count + "'>log2"
			+"	transformation"
			+"</label>"
			+"<label class='checkbox inlineBlock' style='padding:0 0 0 5'><i id='deletenewLable" + count + "' class='fa fa-minus-circle' style='color:red;margin-top:12px;' onclick='deleteFile(this)' title='删除'></i></label>"
			//"<div class='col-md-1'><i class='fa fa-minus-circle' style='color:red;margin-top:12px;' onclick='deleteFile(this)' title='删除'></i></div>" 
		"</div>";
	$("#addNewFileForm").append(html);
}
function showBtnRun(){
	if(UPLOADCOUNT >= 2){
		$("#btnRun").attr("class","btn btn-info btn-icon input-block-level");
		$("#btnRun").removeAttr("disabled");
	}else{
		$("#btnRun").attr("class","btn btn-inverse btn-icon input-block-level");
		$("#btnRun").prop("disabled",true);
	}
}
function deleteFile(obj){
	var id = $(obj).attr("id");
	if(id.indexOf("deleteLable") > -1){
		var count = $("#addFileForm .form-group").length;
		var index = parseInt(id.split("deleteLable")[1]);
		$.ajax({
		   type: "POST",
		   async: false,
		   url: "networkconfusion/deleteFile.form",
		   data: {index:index,count:UPLOADCOUNT},
		   success: function(msg){
			   
			   if(UPLOADCOUNT>1){
				    showDataTable("data1.txt","DataView",false);
				    if($("#heatmapli").hasClass("active")){
						getDataViewHeatmap("data1.txt",false);
					}
				    var optstr = '';
					  for(var i=1;i<UPLOADCOUNT;i++){
						  optstr += "<option value='data" + i + ".txt'>" + $("#defname" + i).val() + "</option>";
					  }
					  $("#DataViewTable_length").after('<div id="selectDataView" style="margin-left:25px;float:left;">'+
					  '<label style="font-weight: bold;">data name:</label><select onchange="changeDataView(this,\'DataView\',false)">' +
					  optstr + '</select></div>');
					  $("#heatmapDataSelect").html(optstr);
			   }else{
					$("#heatmapDataSelect").html('');
					$("#DataViewTableHeader").html('');
					$("#DataViewTableBody").html('');
					$("#DataViewPanel").html('<table id="DataViewTable" class="table table-striped table-bordered"><thead id="DataViewTableHeader"></thead><tbody id="DataViewTableBody"></tbody><tfoot id="DataViewTableFooter"></tfoot></table>');
					$("#chart").html("");
			   }
			   UPLOADCOUNT --;
		   }
		});
		if(count == 1){
			$("#addFileForm .form-group:eq(0) label").css("color","#555555");
			$("#addFileForm .form-group:eq(0) label:eq(0)").attr("uploaded",false);
			return;
		}
		
		$(obj).parent().parent().parent().remove();
		for(var i=index+1;i<=count;i++){
			$("#labelData" + i).text("data" + (i-1));
			$("#labelData" + i).attr("id","labelData" + (i-1));
			$("#btnAddFile" + i).replaceWith("<button class='btn btn-info' id='btnAddFile" + (i-1) + "' data-toggle='modal' onclick='openUploadModal(" + (i-1) + ")'>Add File" + "</button>");
			$("#typeLabel" + i).text("type" + (i-1));
			$("#typeLabel" + i).attr("id","typeLabel" + (i-1));
			$("#dataNameLabel" + i).text("name" + (i-1));
			$("#dataNameLabel" + i).attr("id","dataNameLabel" + (i-1));
			$("#defname" + i).replaceWith("<input type='text' flag='" + (i-1) + "' name='defname' onkeyup='renameFile(this)' oldvalue='data" + (i-1) + "' id='defname" + (i-1) + "' class='form-control' value='data" + (i-1) + "'>");
			$("#defname" + i).attr("id","defname" + (i-1));
			$("#deleteLable" + i).attr("id","deleteLable" + (i-1));
			$("#normalization" + i).replaceWith("<input type='checkbox' class='uniform' id='normalization" + (i-1) + "' checked>");
			$("#logtransfor" + i).replaceWith("<input type='checkbox' class='uniform' id='logtransfor" + (i-1) + "' checked>");
		}
		
		//$("#deleteLable" + (count-1)).show();
	}else{
		var count = $("#addNewFileForm .form-group").length;
		$("#deletenewLable" + (count-1)).show();
		$(obj).parent().parent().parent().remove();
	}
	
}
function loadData(){
	$('#fileUploadModal').modal('hide');
	var type = $("#fileUploadModalBody").attr("type");
	$("#uploading,#maskload").show();
	
	if(type == 0){
		$("#sampleDatastatus").html("");
		$.ajaxFileUpload
		({
				url: "networkconfusion/upload.form", //用于文件上传的服务器端请求地址
				secureuri: false, //是否需要安全协议，一般设置为false
				fileElementId: "file0", //文件上传域的ID
				data: {filename: "sample_info.txt"},
				dataType: 'json', //返回值类型 一般设置为json
				success: function (data, status)  //服务器成功响应处理函数
				{
					$("#uploading,#maskload").hide();
					$("#sampleDatastatus").html("<span style='color:green;'>Upload Completed!</span>");
				}
        });
		return;
	}
	//networkconfusion/upload.form
	ajaxFileUpload('networkconfusion/upload.form',type);
	if(type > UPLOADED_FLAG){
		UPLOADED_FLAG = type;
	}
	if(type > UPLOADCOUNT){
		UPLOADCOUNT = type;
	}
}   
function loadNewData(){
	$('#fileUploadNewModal').modal('hide');
	var type = $("#fileUploadNewModalBody").attr("type");
	var fileId = "newfile" + type;
	var filename = "newdata" + type + ".txt";
	var saveId = $("#resultHeader").attr("saveId");
	$.ajaxFileUpload
    (
        {
            url: "networkconfusion/uploadNew.form", //用于文件上传的服务器端请求地址
            secureuri: false, //是否需要安全协议，一般设置为false
            fileElementId: fileId, //文件上传域的ID
            data: {filename: filename,saveId:saveId},
            dataType: 'json', //返回值类型 一般设置为json
            success: function (data, status)  //服务器成功响应处理函数
            {
                $("#addNewFileForm .form-group:eq(" + (type-1) + ") label").css("color","green");
            }
        });
}
function ajaxFileUpload(_url,type) {
	var fileId = "file" + type;
	var __filename = $("#" + fileId).val();
	var filename = "data" + type + ".txt"; //__filename.substring(__filename.lastIndexOf("\\")+1,__filename.length);
	var defname = $("#defname" + type).val();
	$("#uploading,#maskload").show();
    $.ajaxFileUpload
    (
        {
            url: _url, //用于文件上传的服务器端请求地址
            secureuri: false, //是否需要安全协议，一般设置为false
            fileElementId: fileId, //文件上传域的ID
            data: {filename: filename},
            dataType: 'json', //返回值类型 一般设置为json
            success: function (data, status)  //服务器成功响应处理函数
            {
				$("#addFileForm .form-group:eq(" + (type-1) + ") label").css("color","green");
				$("#addFileForm .form-group:eq(" + (type-1) + ") label:eq(0)").attr("uploaded",true);
				
                if(FIRST_UPLOAD){
                	$("#selectDataView").show();
                	$("#selectDataView").css({"margin-left":130,"margin-bottom":-24});
                	FIRST_UPLOAD = false;
					showDataTable(filename,"DataView",false);
                }
                var optstr = $("#selectDataView select").html();
                
				
				if($("#heatmapli").hasClass("active")){
					getDataViewHeatmap(filename,false);
					showDataTable(filename,"DataView",false);
				}else if(!FIRST_UPLOAD){
					showDataTable(filename,"DataView",false);
				}
            	
            	
                if($("#selectDataView").length == 0){
                	if(typeof(optstr) != 'undefined'){
                		$("#DataViewTable_length").after('<div id="selectDataView" style="margin-left:25px;float:left;"><label style="font-weight: bold;">data name:</label><select onchange="changeDataView(this,\'DataView\',false)">' + optstr + '</select></div>')
                	}else{
                		$("#DataViewTable_length").after('<div id="selectDataView" style="margin-left:25px;float:left;"><label style="font-weight: bold;">data name:</label><select onchange="changeDataView(this,\'DataView\',false)"></select></div>')
                	}
                }
                if($("#heatmapDataSelect").length == 0){
                	$("#heatmapDataLabel").after("<select id='heatmapDataSelect' onchange='changeDataViewHeatmap(this,false)' class='form-control' style='width:120px;float:left;'></select>")
                }
                
                if(!isExistDataViewOption(filename)){
                	$("#selectDataView select").append("<option value='" + filename + "'>" + defname + "</option>");
                    $("#heatmapDataSelect").append("<option value='" + filename + "'>" + defname + "</option>");
                }else{
                	$("#selectDataView select > option[value='" + filename + "']").text(defname);
                	$("#heatmapDataSelect > option[value='" + filename + "']").text(defname);
                }
                $("#selectDataView select").val(filename);
                $("#heatmapDataSelect").val(filename);
                
				$("#uploading,#maskload").hide();
                bootbox.dialog({
        		    message: '<div class="alert alert-block alert-success fade in" style="margin-bottom:0;margin:-20;"><h4><i class="fa fa-heart"></i> Successful!</h4> upload file successful.<p></p></div>',
        	    });
				
				if(UPLOADCOUNT >= 2){
					$("#btnValidate").attr("class","btn btn-info");
					$("#btnValidate").removeAttr("disabled");
				}else{
					$("#btnValidate").attr("class","btn btn-inverse");
					$("#btnValidate").prop("disabled",true);
				}
            },
            error: function (data, status, e)//服务器响应失败处理函数
            {
                alert(e);
            }
        }
    )
    return false;
}
function showHeatmapDataView(){
	var value = $("#selectDataView select").val();
	if(typeof(value) == 'undefined'){
		return;
	}
	if($("#chart svg").length == 0){
		$("#loading,#maskload").show();
		$("#heatmapDataSelect").val(value);
		$("#heatmapDataSelect").trigger("onchange");
	}
}
function submitSNF(){
	//$("#loading,#maskload").show();
	$("#btnRun").attr("class","btn btn-inverse btn-icon input-block-level");
	$("#btnRun").prop("disabled",true);
	$("#runningDiv").show();
	$("#resultshowTab").hide();
	var saveId = Date.parse(new Date());
	$("#resultHeader").attr("saveId","Report" + saveId);
    $("#resultHeader").val("Report" + saveId);
	setTimeout(function(){
		submitSNFAjax(saveId);
		$("#btnRun").attr("class","btn btn-info btn-icon input-block-level");
		$("#btnRun").removeAttr("disabled");
		$("#runningDiv").hide();
		$("#resultshowTab").show();
		//$("#loading,#maskload").hide();
	},500);
}
function submitSNFAjax(saveId){
	var if_norm = '';
	var if_log2 = '';
	var input_data_type = '';
	var names = '';
	if(UPLOADCOUNT < UPLOADED_FLAG){
		UPLOADED_FLAG = UPLOADCOUNT;
	}
	for(var i=1;i<=UPLOADED_FLAG;i++){
		if(i == UPLOADED_FLAG){
			if_norm += $("#normalization" + i).prop("checked") == true?1:0;
			if_log2 += $("#logtransfor" + i).prop("checked") == true?1:0;
			input_data_type += '1';
			names += $("#defname" + i).val();
		}else{
			if_norm += ($("#normalization" + i).prop("checked") == true?1:0) + ",";
			if_log2 += ($("#logtransfor" + i).prop("checked") == true?1:0) + ",";
			input_data_type += '1,';
			names += $("#defname" + i).val() + ",";
		}
	}
	$.ajax({
 	   type: "POST",
 	   async: false,
 	   url: "networkconfusion/submitSNF.form",
 	   data: {
 		  file_count: UPLOADED_FLAG,
 		  neighbor_num: $("#NeighborNumber").val(),
 		  alpha: $("#alphaValue").val(),
 		  iteration_num: $("#IterationNumber").val(),
 		  cluster_num: $("#ClusterNumber").val(),
 		  if_norm: if_norm,
 		  if_log2: if_log2,
 		  input_data_type: input_data_type,
 		  names: names,
		  saveId: saveId
 	   },
 	   success: function(msg){
 		   if(msg.data != "-1"){
 			  showHeatmapCytoScape("heatmap_of_data_result.txt");
 			  showDataTable("heatmap_of_data_result.txt","DataResult");
 			  showDataTable("NMI_rank_of_data1.txt","DataFeature");
 			  var htmlTable = "<div style='margin-left:25px;float:left;'><label style='font-weight: bold;'>data name:</label><select id='selectTableResult' onchange='changeDataView(this,\"DataResult\")'>";
 			  var htmlFeature = "<div style='margin-left:25px;float:left;'><label style='font-weight: bold;'>data name:</label><select id='selectTableFeature' onchange='changeDataView(this,\"DataFeature\")'>";
 			  var htmlHeatCyto = "";
			  htmlTable += "<option value='heatmap_of_data_result.txt'>result</option>";
			  htmlHeatCyto += "<option value='heatmap_of_data_result.txt'>result</option>";
 			  for(var i=1;i<=UPLOADED_FLAG;i++){
 				 htmlTable += "<option value='heatmap_of_data" + i + ".txt'>" + $("#defname" + i).val() + "</option>";
 				 htmlFeature += "<option value='NMI_rank_of_data" + i + ".txt'>" + $("#defname" + i).val() + "</option>";
 				 htmlHeatCyto += "<option value='heatmap_of_data" + i + ".txt'>" + $("#defname" + i).val() + "</option>";
 			  }
 			  htmlTable += "</select></div>";
 			  htmlFeature += "</select></div>";
 			  $("#DataResultTable_length").after(htmlTable);
 			  $("#DataFeatureTable_length").after(htmlFeature);
 			  $("#selectTableHeatCyto").html(htmlHeatCyto);
 		   }
 	   }
	});
}
function changeHeatCyto(obj){
	var filename = $(obj).val();
	showHeatmapCytoScape(filename);
}
function showHeatmapCytoScape(filename){
	var saveId = $("#resultHeader").attr("saveId");
	$.ajax({
 	   type: "POST",
 	   async: true,
 	   url: "networkconfusion/showHeatmapCytoScape.form",
 	   data: {filename:filename,saveId:saveId},
 	   success: function(msg){
 		   $("#iframe").attr("src","networkconfusionAnalysisSNF?filename=" + msg.data + "&heatmap=" + msg.heatmap);
 	   }
	});
}
function iFrameHeight() {
    var ifm = document.getElementById("iframe");
    var subWeb = document.frames ? document.frames["iframe"].document : ifm.contentDocument;
    if (ifm != null && subWeb != null) {
         ifm.height = subWeb.body.scrollHeight;
    }
}
function changeDataView(obj,div,flag){
	var dom = $(obj).parent().clone(true);
	dom.find("select").val($(obj).val())
	showDataTable($(obj).val(),div,flag);
	$("#" + div + "Table_length").after(dom);
}
function isExistDataViewOption(defname){
	var flag = false;
	$("#selectDataView select > option").each(function(index,dom){
		if($(dom).val() == defname){
			flag = true;
		}
	});
	return flag;
}
function changeDataViewHeatmap(obj,flag){
	var filename = $(obj).val();
	getDataViewHeatmap(filename,flag);
}
function getDataViewHeatmap(filename,flag){
	if(filename == null){
		return;
	}
	$("#loading,#maskload").show();
	$.ajax({
    	   type: "POST",
    	   async: true,
    	   url: "networkconfusion/getDataViewHeatmap.form",
    	   data: {filename:filename,isSaved:flag},
    	   success: function(msg){
    		   var hcrow = msg.featureid;
    		   var hccol = msg.sampleid;
    		   var rowLabel = msg.featurenames;
    		   var colLabel = msg.samplenames;
    		   var tsvpath = msg.tsvpath[0];
    		   showDataViewHeatmap(hcrow,hccol,rowLabel,colLabel,tsvpath);
			   
			   
    	   }
     });
}
function showDataTable(filename,div,isSaved){
	var columns = [];
	var saveId = '';
	if(div == "DataFeature" || div == "DataResult"){
		saveId = $("#resultHeader").attr("saveId");
	}else if(div == "DataNew"){
		saveId = $("#DataNewHeader").attr("saveId");
	}
	
	if(div == "DataFeature"){
		columns = [{'mData': 'feature','sClass':'left'},{'mData': 'NMI','sClass':'left'},{'mData': 'rank','sClass':'left'}];
		$("#" + div + "TableHeader").html("<tr><th>feature</th><th>NMI</th><th>rank</th></tr>");
		
		$("#" + div + "TableFooter").html('<tr><th><input type="text" placeholder="Search" /></th><th><input type="text" placeholder="Search" /></th><th><input type="text" placeholder="Search" /></th></tr>');
	}else{
		$.ajax({
	    	   type: "POST",
	    	   async: false,
	    	   url: "networkconfusion/get" + div + "Header.form",
	    	   data: {filename:filename,saveId:saveId,isSaved: isSaved},
	    	   success: function(msg){
	        	     var data = msg.data;
					 var tfootr = '';
	        	     var html = "<tr>";
	        	     for(var i=0;i<data.length;i++){
	        	    	 columns.push({
	        	    		 'mData': data[i],
	        	    		 'sClass':'center'
	        	    	 });
						 if(i != 0){
							 html += "<th><i onclick='deleteCol(\"" + div + "\",\"" + filename + "\"," + isSaved + ",this,event)' class='fa fa-minus-circle' style='color:blue;'></i><span>" + data[i] + "</span></th>"; 
						 }else{
							 html += "<th>" + data[i] + "</th>";
						 }
	        	    	 tfootr += '<th><input type="text" placeholder="Search" /></th>';
	        	     }
	        	     html += "</tr>";
	        	     $("#" + div + "TableHeader").html(html);
					 $("#" + div + "TableFooter").html("<tr>" + tfootr + "</tr>");
	    	   }
		});
	}
    
    var table = $('#' + div + 'Table').DataTable({
		//"bJQueryUI": true,
		"bPaginate" : true,// 分页按钮
		"bFilter" : true,// 搜索栏
		"bLengthChange" : true,// 每行显示记录数
		"iDisplayLength" : 10,// 每页显示行数
		"bSort" : true,// 排序
		//"aLengthMenu": [[50,100,500,1000,10000], [50,100,500,1000,10000]],//定义每页显示数据数量
		"iScrollLoadGap":10,//用于指定当DataTable设置为滚动时，最多可以一屏显示多少条数据
		//"aaSorting": [[4, "desc"]],
		"bInfo" : true,// Showing 1 to 10 of 23 entries 总记录数没也显示多少等信息
		"bWidth":true,
		//"sScrollY": "62%",
        "sScrollX": "90%",
        "bScrollCollapse": true,
		"sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
		"sPaginationType" : "bootstrap", // 分页，一共两种样式 full_numbers另一种为two_button // 是datatables默认
		"bProcessing" : true,
		"bServerSide" : true,
		"bDestroy": true,
		"bSortCellsTop": true,	
        "sAjaxSource": 'networkconfusion/get' + div + 'Body.form', 
        "aoColumns":columns,
        "fnServerData" : function(sSource, aoData, fnCallback) {
			$.ajax({
				"type" : 'POST',
				"url" : sSource,
				"dataType" : "json",
				"data" : {
					aoData : JSON.stringify(aoData),
					filename : filename,
					saveId: saveId,
					isSaved: isSaved
				},
				"success" : function(resp) {
					fnCallback(resp);
					var aData = resp.aaData.aaData;
					var html = '';
					var tfootr = '';
					var searchvalue = $("#" + div + "Table_filter input[type='search']").val();
					for(var i=0;i<aData.length;i++){
						html += "<tr>";
						for(var j=0;j<aData[i].length;j++){
							var color = '';
							if(searchvalue != "" && aData[i][j].indexOf(searchvalue) > -1){
								color = "color:red;";
							}
							if(j==0){
								if(div == 'DataFeature'){
									continue;
								}
								html += "<td style='" + color + "'><i onclick='deleteRow(\"" + div + "\",\"" + filename + "\"," + isSaved + ",this,event)' class='fa fa-minus-circle' style='color:blue;'></i><span>" + aData[i][j] + "</span></td>";
							}else{
								if(div == 'DataFeature' && j==1){
									html += "<td style='" + color + "'><i onclick='deleteRow(\"" + div + "\",\"" + filename + "\"," + isSaved + ",this,event)' class='fa fa-minus-circle' style='color:blue;'></i><span>" + aData[i][j] + "</span></td>";
									continue;
								}
								html += "<td style='" + color + "'>" + aData[i][j] + "</td>";
							}
						}
						html += "</tr>";
					}
					$("#" + div + "TableBody").html(html);
					$('#' + div + 'Table').resize();
				}
			});
		}
    });
    // Apply the search
    table.columns().eq( 0 ).each( function ( colIdx ) {
        $( 'input', table.column( colIdx ).footer() ).on( 'keyup change', function () {
			//colIdx  this.value 
			var clone = $('#' + div + 'Table_length').next().clone();
			reloadTable(filename,div,isSaved,colIdx,this.value,columns,saveId,clone);
			$(this).focus();
        } );
    } );
}
function reloadTable(filename,div,isSaved,colIdx,searchcol,columns,saveId,clone){
	if(div == 'DataFeature'){
		colIdx ++;
	}
	$('#' + div + 'Table').DataTable({
		//"bJQueryUI": true,
		"bPaginate" : true,// 分页按钮
		"bFilter" : true,// 搜索栏
		"bLengthChange" : true,// 每行显示记录数
		"iDisplayLength" : 10,// 每页显示行数
		"bSort" : true,// 排序
		//"aLengthMenu": [[50,100,500,1000,10000], [50,100,500,1000,10000]],//定义每页显示数据数量
		"iScrollLoadGap":10,//用于指定当DataTable设置为滚动时，最多可以一屏显示多少条数据
		//"aaSorting": [[4, "desc"]],
		"bInfo" : true,// Showing 1 to 10 of 23 entries 总记录数没也显示多少等信息
		"bWidth":true,
		//"sScrollY": "62%",
        "sScrollX": "90%",
        "bScrollCollapse": true,
		"sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
		"sPaginationType" : "bootstrap", // 分页，一共两种样式 full_numbers另一种为two_button // 是datatables默认
		"bProcessing" : true,
		"bServerSide" : true,
		"bDestroy": true,
		"bSortCellsTop": true,	
        "sAjaxSource": 'networkconfusion/get' + div + 'Body.form', 
        "aoColumns":columns,
        "fnServerData" : function(sSource, aoData, fnCallback) {
			aoData.push( { "name": "colIdx", "value": colIdx } );
			aoData.push( { "name": "searchvalue", "value": searchcol } );
			$.ajax({
				"type" : 'POST',
				"url" : sSource,
				"dataType" : "json",
				"data" : {
					aoData : JSON.stringify(aoData),
					filename : filename,
					saveId:saveId,
					isSaved: isSaved
				},
				"success" : function(resp) {
					fnCallback(resp);
					var aData = resp.aaData.aaData;
					var html = '';
					var tfootr = '';
					var searchvalue = $("#" + div + "Table_filter input[type='search']").val();
					for(var i=0;i<aData.length;i++){
						html += "<tr>";
						for(var j=0;j<aData[i].length;j++){
							var color = '';
							if(searchvalue != "" && aData[i][j].indexOf(searchvalue) > -1){
								color = "color:red;";
							}
							if(searchcol != "" && colIdx == j && aData[i][j].indexOf(searchcol) > -1){
								color = "color:red;";
							}
							if(j==0){
								if(div == 'DataFeature'){
									continue;
								}
								html += "<td style='" + color + "'><i onclick='deleteRow(\"" + div + "\",\"" + filename + "\"," + isSaved + ",this,event)' class='fa fa-minus-circle' style='color:blue;'></i><span>" + aData[i][j] + "</span></td>";
							}else{
								if(div == 'DataFeature' && j==1){
									html += "<td style='" + color + "'><i onclick='deleteRow(\"" + div + "\",\"" + filename + "\"," + isSaved + ",this,event)' class='fa fa-minus-circle' style='color:blue;'></i><span>" + aData[i][j] + "</span></td>";
									continue;
								}
								html += "<td style='" + color + "'>" + aData[i][j] + "</td>";
							}
						}
						html += "</tr>";
					}
					$("#" + div + "TableBody").html(html);
					$('#' + div + 'Table').resize();
				}
			});
		}
    });
	$("#" + div + "Table_length").after(clone);
}
function deleteCol(div,filename,isSaved,o,e){
	e.preventDefault(); 
	e.stopPropagation();
	var title = $(o).next().text();
	if(div == "DataResult"){
		deleteRowAndCol(div,filename,isSaved,title);
		return;			
	}
	$.ajax({
	 	   type: "POST",
	 	   async: false,
	 	   url: "networkconfusion/deleteCol.form",
	 	   data: {
			   filename: filename,
			   title: title,
	 		   isSaved: isSaved,
	 	   },
	 	   success: function(msg){
			   try{
				   showDataTable(filename,div,isSaved);
			   }catch(e){
				   showDataTable(filename,div,isSaved);
			   }
				showDataTable(filename,div,isSaved);
				if(div == "DataView"){
					getDataViewHeatmap(filename,isSaved);
				}
		   }
	});
}
function deleteRow(div,filename,isSaved,o,e){
	e.preventDefault(); 
	e.stopPropagation();
	var title = $(o).next().text();
	if(div == "DataResult"){
		deleteRowAndCol(div,filename,isSaved,title);
		return;			
	}
	$.ajax({
	 	   type: "POST",
	 	   async: false,
	 	   url: "networkconfusion/deleteRow.form",
	 	   data: {
			   filename: filename,
			   title: title,
	 		  isSaved: isSaved,
			  saveId : $("#resultHeader").attr("saveId"),
	 	   },
	 	   success: function(msg){
				showDataTable(filename,div,isSaved);
				if(div == "DataView"){
					getDataViewHeatmap(filename,isSaved);
				}
		   }
	});
}
function deleteRowAndCol(div,filename,isSaved,title){
	$.ajax({
	 	   type: "POST",
	 	   async: false,
	 	   url: "networkconfusion/deleteRowAndCol.form",
	 	   data: {
			   filename: filename,
			   title: title,
	 		   saveId : $("#resultHeader").attr("saveId"),
	 	   },
	 	   success: function(msg){
				try{
				   showDataTable(filename,div,isSaved);
			   }catch(e){
				   showDataTable(filename,div,isSaved);
			   }
		   }
	});
}
function resizeTable(id){
	//$("body").trigger("resize");
	//$("#" + id).resize();
}
function openUploadModal(type){
	$("#fileUploadModal").modal('show');
	$("#fileUploadModalBody").html('<input type="file" id="file' + type + '" name="file" />');
	$("#fileUploadModalBody").attr("type",type);
	if(type == 0){
		$("#sampleDatastatus").html("");
	}
}
function openUploadNewModal(type){
	$("#fileUploadNewModal").modal('show');
	$("#fileUploadNewModalBody").html('<input type="file" id="newfile' + type + '" name="file" />');
	$("#fileUploadNewModalBody").attr("type",type);
}
function inputProjectId(obj){
	var saveid = $("#resultHeader").attr("saveId");
	if($(obj).attr("class") != 'active'){
		//“do you use the former result or other projectid?”
		 bootbox.confirm({  
		        buttons: {  
		            confirm: {  
		            	label: "OK",  
	                    className: "btn-info", 
		            },  
		            cancel: {  
		            	label: "Cancel",  
	                    className: "btn-default",  
		            }  
		        },  
		        message: "do you use the former result?",
		        callback: function(result) {  
		            if(result) {  
		                if(typeof(saveid) == 'undefined'){
		                	$("#aInputData").trigger("click");
		                	bootbox.dialog({
		            		    message: '<div class="alert alert-block alert-warning fade in" style="margin-bottom:0;margin:-20;"><h4><i class="fa fa-exclamation-circle"></i> Warning!</h4> please Input data.<p></p></div>',
		            	    });
		                }else{
							for(var i=2;i<UPLOADED_FLAG;i++){
								$("#btn-addnew").trigger("click");
							}
						}
		            } else {  
		            	if(typeof(saveid) == 'undefined'){
		            		saveid = "";
		            	}
		            	bootbox.dialog({  
		                    message: '<form class="form-horizontal " action="#">'
		        			            	+'<div class="form-group">'
		        			    		+'<label class="col-md-4 control-label">ResultId:</label>'
		        			    		+'<div class="col-md-5">'
		        			    			+'<input class="form-control" type="text" name="inputResultId" size="30" id="inputResultId" value="' + saveid + '">'
		        			    		+ '</div>'
		        			    	+'</div>'																
		        			   +'</form>',  
		                    title: "Input ResultId",  
		                    buttons: {  
		                        Cancel: {  
		                            label: "Cancel",  
		                            className: "btn-default",  
		                            callback: function () {  
		                            	$("#aSNF").trigger("click"); 
		                            }  
		                        }  
		                        , OK: {  
		                            label: "OK",  
		                            className: "btn-info",  
		                            callback: function () {  
		                                intoNewSNF();
		                            }  
		                        }  
		                    }  
		                });    
		            }  
		        },
		 });
	}
}
function intoNewSNF(){
	var saveId = $("#inputResultId").val();
	$("#resultHeader").attr("saveId",saveId);
	$("#resultHeader").html("Result <a style='font-size:13px;margin-left:20px;'>(ID:<b>" + saveId + "</b>)</a>");
	$.ajax({
	 	   type: "POST",
	 	   async: false,
	 	   url: "networkconfusion/loadSavedSNF.form",
	 	   data: {
	 		  saveId: saveId,
	 	   },
	 	   success: function(msg){
	 		   console.log(msg.data);
	 		    var data = msg.data;
	 		    var filenum = data[6];
	 		    var params = JSON.parse(data[7]);
	 		    var names = params.names.split(",");
	 		    
	 		    UPLOADED_FLAG = filenum;
	 		    FIRST_UPLOAD = false;
	 		    showDataTable("data1.txt","DataView",true);
	            getDataViewHeatmap("data1.txt",true);
	          	$("#selectDataView").show();
	          	$("#selectDataView").css({"margin-left":130,"margin-bottom":-24});
	          	var optionstr = "";
	          	for(var i=1;i<=filenum;i++){
	          		optionstr += "<option value='data" + i + ".txt'>" + names[i-1] + "</option>";
	          	}
	          	$("#DataViewTable_length").after('<div id="selectDataView" style="margin-left:25px;float:left;"><label style="font-weight: bold;">data name:</label>' +
	          			'<select onchange="changeDataView(this,\'DataView\',true)">' + optionstr + '</select></div>')
	          	//$("#heatmapDataSelect").html(optionstr);
	          	if($("#heatmapDataSelect").length > 0){
	          		$("#heatmapDataSelect").remove();
	          	}
	          	$("#heatmapDataLabel").after("<select id='heatmapDataSelect' onchange='changeDataViewHeatmap(this,true)' class='form-control' style='width:120px;float:left;'>" + optionstr + "</select>");
	          	
	          	  showHeatmapCytoScape("heatmap_of_data1.txt");
	 			  showDataTable("heatmap_of_data1.txt","DataResult");
	 			  showDataTable("NMI_rank_of_data1.txt","DataFeature");
	 			  var htmlTable = "<div style='margin-left:25px;float:left;'><label style='font-weight: bold;'data name:/label><select id='selectTableResult' onchange='changeDataView(this,\"DataResult\")'>";
	 			  var htmlFeature = "<div style='margin-left:25px;float:left;'><label style='font-weight: bold;'data name:/label><select id='selectTableFeature' onchange='changeDataView(this,\"DataFeature\")'>";
	 			  var htmlHeatCyto = "";
	 			  for(var i=1;i<=filenum;i++){
	 				 htmlTable += "<option value='heatmap_of_data" + i + ".txt'>" + names[i-1] + "</option>";
	 				 htmlFeature += "<option value='NMI_rank_of_data" + i + ".txt'>" + names[i-1] + "</option>";
	 				 htmlHeatCyto += "<option value='heatmap_of_data" + i + ".txt'>" + names[i-1] + "</option>";
	 			  }
	 			  htmlTable += "</select></div>";
	 			  htmlFeature += "</select></div>";
	 			  $("#DataResultTable_length").after(htmlTable);
	 			  $("#DataFeatureTable_length").after(htmlFeature);
	 			  $("#selectTableHeatCyto").html(htmlHeatCyto);
	 	   }
	});
}
function submitNewSNF(){
	$("#loading,#maskload").show();
	setTimeout(function(){
		submitNewSNFAjax();
		$("#loading,#maskload").hide();
	},500);
}
function submitNewSNFAjax(){
	var if_norm = '';
	var if_log2 = '';
	var input_data_type = '';
	var names = '';
	
	for(var i=1;i<=UPLOADED_FLAG;i++){
		if(i == UPLOADED_FLAG){
			if_norm += $("#newnormalization" + i).prop("checked") == true?1:0;
			if_log2 += $("#newlogtransfor" + i).prop("checked") == true?1:0;
			names += $("#newname" + i).val();
			input_data_type += '1';
		}else{
			if_norm += ($("#newnormalization" + i).prop("checked") == true?1:0) + ",";
			if_log2 += ($("#newlogtransfor" + i).prop("checked") == true?1:0) + ",";
			input_data_type += '1,';
			names += $("#newname" + i).val() + ",";
		}
	}
	$.ajax({
 	   type: "POST",
 	   async: false,
 	   url: "networkconfusion/submitNewSNF.form",
 	   data: {
 		  file_count: UPLOADED_FLAG,
 		  neighbor_num: $("#NeighborNumberNew").val(),
 		  alpha: $("#alphaNewValue").val(),
 		  iteration_num: $("#IterationNumberNew").val(),
 		  cluster_num: $("#ClusterNumberNew").val(),
 		  if_norm: if_norm,
 		  if_log2: if_log2,
 		  input_data_type: input_data_type,
 		  names: names
 	   },
 	   success: function(msg){
 		   console.log(msg);
 		   if(msg.data != "-1"){
 			  $("#DataNewHeader").attr("saveId",msg.data);
 			  $("#DataNewHeader").html("Result <a style='font-size:13px;margin-left:20px;'>(ID:<b>" + msg.data + "</b>)</a>");
 			  
 			  showNewHeatmapCytoScape("heatmap_of_data_result.txt");
 			  showDataTable("heatmap_of_data_result.txt","DataNew");
 			  //showDataTable("NMI_rank_of_data1.txt","DataFeature");
 			  var htmlTable = "<div style='margin-left:25px;float:left;'><label style='font-weight: bold;'data name:/label>"+
							"<select id='selectTableNew' onchange='changeDataView(this,\"DataNew\")'><option value='heatmap_of_data_result.txt'>result</option>";
 			  //var htmlFeature = "<div style='margin-left:25px;float:left;'><label style='font-weight: bold;'data name:/label><select id='selectTableFeature' onchange='changeDataView(this,\"DataFeature\")'>";
 			  var htmlHeatCyto = "<option value='heatmap_of_data_result.txt'>result</option>";
 			  for(var i=1;i<=UPLOADED_FLAG;i++){
 				 htmlTable += "<option value='heatmap_of_data" + i + ".txt'>" + $("#newname" + i).val() + "</option>";
 				 //htmlFeature += "<option value='NMI_rank_of_data" + i + ".txt'>" + $("#defname" + i).val() + "</option>";
 				 htmlHeatCyto += "<option value='heatmap_of_data" + i + ".txt'>" + $("#newname" + i).val() + "</option>";
 			  }
 			  htmlTable += "</select></div>";
 			  //htmlFeature += "</select></div>";
 			  $("#DataNewTable_length").after(htmlTable);
 			  //$("#DataFeatureTable_length").after(htmlFeature);
 			  $("#selectNewTableHeatCyto").html(htmlHeatCyto);
 		   }
 	   }
	});
}
function changeNewHeatCyto(obj){
	var filename = $(obj).val();
	showNewHeatmapCytoScape(filename);
}
function showNewHeatmapCytoScape(filename){
	var saveId = $("#DataNewHeader").attr("saveId");
	$.ajax({
 	   type: "POST",
 	   async: true,
 	   url: "networkconfusion/showHeatmapCytoScape.form",
 	   data: {filename:filename,saveId:saveId},
 	   success: function(msg){
 		   $("#newiframe").attr("src","networkconfusionAnalysisSNF?filename=" + msg.data);
 	   }
	});
}
function getSampleInfo(colname){
	$.ajax({
 	   type: "POST",
 	   async: true,
 	   url: "networkconfusion/getDataviewSample.form",
	   data: {colname:colname},
 	   success: function(msg){
 		  var obj = msg.data;
		  var html = '';
		  for(var i in obj){
			  html += "<tr><td>" + i + "</td><td>" + obj[i] + "</td></tr>"
		  }
		  $("#dataviewSampleBody").html(html);
 	   }
	});
}
function loadEgData(){
	$("#addFileForm .form-group").each(function(i,dom){
		if(i>1){
			$(dom).remove();
		}
	});
	$.ajax({
 	   type: "POST",
 	   async: true,
 	   url: "networkconfusion/loadSampleData.form",
 	   success: function(msg){
 		  //getDataViewHeatmap("data1.txt",false);
		  showDataTable("data1.txt","DataView",false);
		  $("#DataViewTable_length").after('<div id="selectDataView" style="margin-left:25px;float:left;">'+
		  '<label style="font-weight: bold;">data name:</label><select onchange="changeDataView(this,\'DataView\',false)">' +
		  '<option value="data1.txt">data1</option><option value="data2.txt">data2</option>' + '</select></div>');
		  $("#addFileForm .form-group:eq(0) label").css("color","green");
		  $("#addFileForm .form-group:eq(1) label").css("color","green");
		  $("#addFileForm .form-group:eq(0) label:eq(0)").attr("uploaded",true);
		  $("#addFileForm .form-group:eq(1) label:eq(0)").attr("uploaded",true);
		  $("#heatmapDataLabel").after("<select id='heatmapDataSelect' onchange='changeDataViewHeatmap(this,false)' class='form-control' style='width:120px;float:left;'>" +
			"<option value='data1.txt'>data1</option><option value='data2.txt'>data2</option>"+ "</select>")
		  if($("#heatmapli").hasClass("active")){
			getDataViewHeatmap("data1.txt",false);
		  }
		  $("#sampleDatastatus").html("<span style='color:green;'>Upload Completed!</span>");
 	   }
	});
}
function submitInputData(){
	$.ajax({
 	   type: "POST",
 	   async: true,
 	   url: "networkconfusion/validateInputData.form",
	   data: {count:UPLOADCOUNT},
 	   success: function(msg){
		   console.log(msg);
		   if(msg.hasString){
			    bootbox.dialog({
					message: '<div class="alert alert-block alert-warning fade in" style="margin-bottom:0;margin:-20;"><h4><i class="fa fa-exclamation-circle"></i> Warning!</h4> your input data value has string.<p></p></div>',
				});
		   }
		   if(msg.nolength){
			   bootbox.dialog({
					message: '<div class="alert alert-block alert-warning fade in" style="margin-bottom:0;margin:-20;"><h4><i class="fa fa-exclamation-circle"></i> Warning!</h4> your input data header has not length.<p></p></div>',
				});
		   }
		   if(msg.valueerror){
			   bootbox.dialog({
					message: '<div class="alert alert-block alert-warning fade in" style="margin-bottom:0;margin:-20;"><h4><i class="fa fa-exclamation-circle"></i> Warning!</h4> your input data header not equals.<p></p></div>',
				});
		   }
		   if(!msg.hasString && !msg.nolength && !msg.valueerror){
			    $("#aSNF").tab('show');
			    $("#btnRun").attr("class","btn btn-info btn-icon input-block-level");
				$("#btnRun").removeAttr("disabled");
		   }
	   }
	});
}