var FIRST_UPLOAD = true;
var UPLOADED_FLAG = 0;
var UPLOADCOUNT = 0;
function loadEgData(){
	
}
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
	$("#deleteLable" + (count-1)).hide();
	html += "<div class='form-group'>" +
			"<label class='col-md-1 control-label'>data" + count + "</label>" +
			"<div class='col-md-1'>" +
				"<button class='btn btn-info' data-toggle='modal' onclick='openUploadModal(" + count + ")'>Add File" + "</button>" +
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
			+"<label class='checkbox inlineBlock' style='padding:0 0 0 5'><i class='fa fa-minus-circle' style='color:red;margin-top:12px;' onclick='deleteFile(this)' title='删除'></i></label>"
			//"<div class='col-md-1'><i class='fa fa-minus-circle' style='color:red;margin-top:12px;' onclick='deleteFile(this)' title='删除'></i></div>" 
		"</div>";
	$("#addNewFileForm").append(html);
}
function deleteFile(obj){
	var count = $("#addNewFileForm .form-group").length;
	$("#deleteLable" + count).show();
	$(obj).parent().parent().parent().remove();
}
function loadData(){
	$('#fileUploadModal').modal('hide');
	var type = $("#fileUploadModalBody").attr("type");
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
                console.log(data);
            }
        });
}
function ajaxFileUpload(_url,type) {
	var fileId = "file" + type;
	var __filename = $("#" + fileId).val();
	var filename = "data" + type + ".txt"; //__filename.substring(__filename.lastIndexOf("\\")+1,__filename.length);
	var defname = $("#defname" + type).val();
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
                if (typeof (data.error) != 'undefined') {
                    if (data.error != '') {
                        alert(data.error);
                    } else {
                        alert(data.msg);
                    }
                }
				$("#addFileForm .form-group:eq(" + (type-1) + ") label").css("color","green");
				
                if(FIRST_UPLOAD){
                	$("#selectDataView").show();
                	$("#selectDataView").css({"margin-left":130,"margin-bottom":-24});
                	FIRST_UPLOAD = false;
                }
                var optstr = $("#selectDataView select").html();
                showDataTable(filename,"DataView",false);
            	getDataViewHeatmap(filename,false);
            	
                if($("#selectDataView").length == 0){
                	if(typeof(optstr) != 'undefined'){
                		$("#DataViewTable_length").after('<div id="selectDataView" style="margin-left:25px;float:left;"><label style="font-weight: bold;">data</label><select onchange="changeDataView(this,\'DataView\',false)">' + optstr + '</select></div>')
                	}else{
                		$("#DataViewTable_length").after('<div id="selectDataView" style="margin-left:25px;float:left;"><label style="font-weight: bold;">data</label><select onchange="changeDataView(this,\'DataView\',false)"></select></div>')
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
                
                bootbox.dialog({
        		    message: '<div class="alert alert-block alert-success fade in" style="margin-bottom:0;margin:-20;"><h4><i class="fa fa-heart"></i> Successful!</h4> upload file successful.<p></p></div>',
        	    });
            },
            error: function (data, status, e)//服务器响应失败处理函数
            {
                alert(e);
            }
        }
    )
    return false;
}
function submitSNF(){
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
 		  alpha: $("#Alpha").val(),
 		  iteration_num: $("#IterationNumber").val(),
 		  cluster_num: $("#ClusterNumber").val(),
 		  if_norm: if_norm,
 		  if_log2: if_log2,
 		  input_data_type: input_data_type,
 		  names: names
 	   },
 	   success: function(msg){
 		   if(msg.data != "-1"){
 			  $("#resultHeader").attr("saveId",msg.data);
 			  $("#resultHeader").html("Result <a style='font-size:13px;margin-left:20px;'>(ID:<b>" + msg.data + "</b>)</a>");
 			  showHeatmapCytoScape("heatmap_of_data1.txt");
 			  showDataTable("heatmap_of_data1.txt","DataResult");
 			  showDataTable("NMI_rank_of_data1.txt","DataFeature");
 			  var htmlTable = "<div style='margin-left:25px;float:left;'><label style='font-weight: bold;'>data</label><select id='selectTableResult' onchange='changeDataView(this,\"DataResult\")'>";
 			  var htmlFeature = "<div style='margin-left:25px;float:left;'><label style='font-weight: bold;'>data</label><select id='selectTableFeature' onchange='changeDataView(this,\"DataFeature\")'>";
 			  var htmlHeatCyto = "";
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
 		   $("#iframe").attr("src","networkconfusionAnalysisSNF?filename=" + msg.data);
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
    		   showDataViewHeatmap(hcrow,hccol,rowLabel,colLabel,tsvpath)
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
		columns = [{'mData': 'Number','sClass':'left'},{'mData': 'feature','sClass':'left'},{'mData': 'NMI','sClass':'left'},{'mData': 'rank','sClass':'left'}];
		$("#" + div + "TableHeader").html("<tr><th>Number</th><th>feature</th><th>NMI</th><th>rank</th></tr>");
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
					saveId:saveId,
					isSaved: isSaved
				},
				"success" : function(resp) {
					fnCallback(resp);
					var aData = resp.aaData.aaData;
					var html = '';
					var tfootr = '';
					for(var i=0;i<aData.length;i++){
						html += "<tr>";
						for(var j=0;j<aData[i].length;j++){
							if(j==0){
								html += "<td><i onclick='deleteRow(\"" + div + "\",\"" + filename + "\"," + isSaved + ",this,event)' class='fa fa-minus-circle' style='color:blue;'></i><span>" + aData[i][j] + "</span></td>";
							}else{
								html += "<td>" + aData[i][j] + "</td>";
							}
						}
						html += "</tr>";
					}
					$("#" + div + "TableBody").html(html);
					$("#DataViewTable_filter input[type='search']").keyup(function(){
						var value = $(this).val();
						var trSize = $("#" + div + "TableBody tr").length;
						if(isNaN(value)){
							for(var i=1;i<trSize;i++){
								
							}
						}
					});
					resizeTable();
				}
			});
		}   
    });
    // Apply the search
    table.columns().eq( 0 ).each( function ( colIdx ) {
        $( 'input', table.column( colIdx ).footer() ).on( 'keyup change', function () {
            alert(1)
        } );
    } );
}
function deleteCol(div,filename,isSaved,o,e){
	e.preventDefault(); 
	e.stopPropagation();
	var title = $(o).next().text();
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
					showDataTable(filename,div,isSaved);
					getDataViewHeatmap(filename,isSaved);
					
		   }
	});
}
function deleteRow(div,filename,isSaved,o,e){
	e.preventDefault(); 
	e.stopPropagation();
	var title = $(o).next().text();
	$.ajax({
	 	   type: "POST",
	 	   async: false,
	 	   url: "networkconfusion/deleteRow.form",
	 	   data: {
			   filename: filename,
			   title: title,
	 		  isSaved: isSaved,
	 	   },
	 	   success: function(msg){
				showDataTable(filename,div,isSaved);
				getDataViewHeatmap(filename,isSaved);
		   }
	});
}
function resizeTable(){
	$("body").trigger("resize");
}
function openUploadModal(type){
	$("#fileUploadModal").modal('show');
	$("#fileUploadModalBody").html('<input type="file" id="file' + type + '" name="file" />');
	$("#fileUploadModalBody").attr("type",type);
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
	          	$("#DataViewTable_length").after('<div id="selectDataView" style="margin-left:25px;float:left;"><label style="font-weight: bold;">data</label>' +
	          			'<select onchange="changeDataView(this,\'DataView\',true)">' + optionstr + '</select></div>')
	          	//$("#heatmapDataSelect").html(optionstr);
	          	if($("#heatmapDataSelect").length > 0){
	          		$("#heatmapDataSelect").remove();
	          	}
	          	$("#heatmapDataLabel").after("<select id='heatmapDataSelect' onchange='changeDataViewHeatmap(this,true)' class='form-control' style='width:120px;float:left;'>" + optionstr + "</select>");
	          	
	          	  showHeatmapCytoScape("heatmap_of_data1.txt");
	 			  showDataTable("heatmap_of_data1.txt","DataResult");
	 			  showDataTable("NMI_rank_of_data1.txt","DataFeature");
	 			  var htmlTable = "<div style='margin-left:25px;float:left;'><label style='font-weight: bold;'>data</label><select id='selectTableResult' onchange='changeDataView(this,\"DataResult\")'>";
	 			  var htmlFeature = "<div style='margin-left:25px;float:left;'><label style='font-weight: bold;'>data</label><select id='selectTableFeature' onchange='changeDataView(this,\"DataFeature\")'>";
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
 		  alpha: $("#AlphaNew").val(),
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
 			  
 			  showNewHeatmapCytoScape("heatmap_of_data1.txt");
 			  showDataTable("heatmap_of_data1.txt","DataNew");
 			  //showDataTable("NMI_rank_of_data1.txt","DataFeature");
 			  var htmlTable = "<div style='margin-left:25px;float:left;'><label style='font-weight: bold;'>data</label><select id='selectTableNew' onchange='changeDataView(this,\"DataNew\")'>";
 			  //var htmlFeature = "<div style='margin-left:25px;float:left;'><label style='font-weight: bold;'>data</label><select id='selectTableFeature' onchange='changeDataView(this,\"DataFeature\")'>";
 			  var htmlHeatCyto = "";
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