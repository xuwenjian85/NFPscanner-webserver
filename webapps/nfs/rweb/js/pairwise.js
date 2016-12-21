$(document).ready(function(){
	showLibrary();
	$("a[name='LoadSample-radio']").bind('click',function(){
		loadSimpleEvent(this);
	});
/*	$("#refnetSelect").bind('click',function(){
		refnetSelectChange(this);
	});*/
});
function refnetSelectChange(obj){
	console.log(obj);
	//var aa =  $("#refnetSelect").val();
	//console.log( $("#refnetSelect").val());
//	$("#")
	//$("#refnetSelect option").attr("selected",false);
//	$(obj).attr("selected","selected");
}
function showSelectFileModal(type){
	$("#removeFileBtn").trigger("click");
	window.parent.window.MyModal('show',type);
}
function submitUploadFile(type){
	haschange = true;
	var url = "networksimilarity/uploadPairwise.form";
	ajaxFileUpload(url,type);
	window.parent.window.MyModal('hide');
}
function ajaxFileUpload(_url,type) {
	var filename = "net" + type + ".graphml"; 
	var fileObj = window.parent.document.getElementById("file").files[0]; // js 获取文件对象
	var idType = window.parent.document.getElementById("idTypeUpload").value; // js 获取文件对象
    var FileController = _url;                    // 接收上传文件的后台地址 
    // FormData 对象
    var form = new FormData();
    form.append("type", type); 
    form.append("filename", filename);                        // 可以增加表单数据
    form.append("file", fileObj); 
    form.append("idType", idType); 
    // 文件对象
    // XMLHttpRequest 对象
    var xhr = new XMLHttpRequest();
    xhr.open("post", FileController, true);
    xhr.onload = function (msg) {
    	console.log(msg);
       var result = JSON.parse(msg.currentTarget.responseText);
       var data = result.data;
       if(data == 'success'){
    	   
    	   var num = result.result;
    	   var node = result.node;
    	   if(num == -9999){
    		   showTip("The "+idType+" mistakes!");
    	   }else {
    		   $(window.parent.document.getElementById("tipXBtn")).hide();
    		   $(window.parent.document.getElementById("tipCancelBtn")).show();
    		   $(window.parent.document.getElementById("tipCancelBtn")).bind("click",function(){
    			   $("#textareaNet" + type).val("");
    			   $("#previewNet" + type).html("A preview of your query network will show here");
    			   $("#hiddenTxt" + type).val("0");
    		   });
    		   $(window.parent.document.getElementById("tipOKBtn")).bind("click",function(){
    			   showNetAllInfo(type);
    			   $("#hiddenTxt" + type).val("1");
    		   });
//    		   showTip(node+" nodes are remaining,"+num+" nodes are not matched!<br><br><font color='red'>Whether or not to continue?</font>");
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
    	   }
       }
    };
    xhr.send(form);
}

function moveLink(a){
	top.location.href = a;
}

function showNetAllInfo(type){
	var filename = "net" + type;
	$.ajax({
	 	   type: "POST",
	 	   async: false,
	 	   url: "networkconfusion/getNetPreviewDataAll.form",
	 	   data: {
	 		  filename: filename
	 	   },
	 	   success: function(msg){
	 		  console.log(msg);
	 		  $("#textareaNet" + type).val(msg.data);
	 		  var info = msg.info;
	 		  var imgsrc = msg.imgsrc;
	 		  
	 		  var htmlstr = "<div class='col-md-7' style='padding-right:0;padding-left:0;'><img src='" + imgsrc + "?time="+Math.random()+"' style='border-right:1px dotted #ccc;height:298px;width:100%;' /></div>" +
	 			"<div class='col-md-5' style='padding-right: 0;'>" +
	 				"<div class='panel panel-default' style='border:none;'>" + 
	 					"<div class='panel-body' style='height:298px;border-right: none;border-left: 0;border-bottom: 0;'>" +
	 						"<p><strong>Nodes num:</strong><span>" + info[0] + "</span></p>" +
	 						"<p><strong>Edges num:</strong><span>" + info[1] + "</span></p>" +
	 						"<p><strong>Density:</strong><span>" + info[2] + "</span></p>" +
	 						"<p><strong>Clustering coefficient:</strong><span>" + info[3] + "</span></p>" +
	 					"</div>" +	
	 				"</div>" +
	 			"</div>";
	 		$("#previewNet" + type).html(htmlstr);
	 		$("#hiddenTxt" + type).val("1");
	 	   },error:function(data){
		 		showTip("An error occurs, please contact nfs_admin@163.com");
		 	}
	});
}
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
function checkEmail(str){
	   var re = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
	   if(re.test(str)){
		   return true;
	   }else{
	       return false;
	   }
	}
function showTip(info){

	window.parent.window.MyModalTip(info);

}

var haschange = false;
var SAMPLE_ID = "";
function submitPairwise(type){
	$("#step6").attr('disabled',true);
	var email = "";
	if($("#checkEmail").prop("checked") == true){
		email = $("#notifyemail").val();
		if(email.trim()==undefined||email.trim()==""){
			showTip("Please fill in the email!");
			$("#step6").attr('disabled',false);
			return;
		}else{
			 if(!checkEmail(email.trim())){
				 showTip("Please fill in the correct email address!");
				 $("#step6").attr('disabled',false);
					return;
			 }
		}
	}
	
	var hiddenTxts = $('input[name="hiddenTxt"]');
	
	for(var i=0;i<hiddenTxts.length;i++){
		var hiddenValue = $(hiddenTxts[i]).val();
		console.log(hiddenValue);
		if(hiddenValue=='0'){
//			showTip("There are not choose Net!");
			showTip("There are no reference set selected.");
			$("#step6").attr('disabled',false);
			return;
		}
	}
	
	var inlineValue = $('input[name="inline-radios"]:checked').val();
	var cycleValue = $("#cycleValue").val();
	var idTypeValue = "";
	var idTypes = $('select[name="idType"]');
	for(var i=0;i<idTypes.length;i++){
		idTypeValue += $(idTypes[i]).val()+",";
	}
	//选择的是sample几
	var example = SAMPLE_ID;
	$('#resultNav', window.parent.document).attr("jobtitle",$("#jobTitle").val());
	$('#resultNav', window.parent.document).attr("type",type);
	var jobtitle = $("#jobTitle").text();
	var projectId = "Report" + jobtitle;

	$('#resultNav', window.parent.document).attr("saveId","Report" + jobtitle);

	$('#resultNav', window.parent.document).attr("email",email);
	var fileNameObj = $("input[name=fileName]");
	var fileName = "";
	for(var size = 0 ;size < fileNameObj.length; size++){
		fileName += $(fileNameObj[size]).val();
		if(size!= (fileNameObj.length-1)){
			fileName += ",";
		}
	}
	advancedParam();
	if(type == 1){
		var arr1 = new Array(); 
		arr1[0] = type;
		arr1[1] = email;
		arr1[2] = jobtitle;
		arr1[3] = projectId;
		arr1[4] = idTypeValue;
		arr1[5] = inlineValue;
		arr1[6] = cycleValue;
		arr1[7] = $("#fileName1").val();
		arr1[8] = $("#fileName2").val();;
		sessionStorage.setItem("pairwiseinfo",JSON.stringify(arr1));
		if(haschange){
			window.parent.location.href = "networksimilarityResult?id=" + encrypt(projectId,"nfs");
			return;
		}
		var advancedInfo = sessionStorage.getItem("advancedInfo");
		$.ajax({
		 	   type: "POST",
		 	   async: true,
		 	   url: "networkconfusion/getCacheStatus.form",
		 	   data: {inline:arr1[5],cycle:arr1[6],advancedInfo:advancedInfo,example:""},
		 	   success: function(msg){
		 		   var cacheId = msg.data;
				   if(typeof(msg.data) != 'undefined' && msg.data==''){
					 	 window.parent.location.href = "networksimilarityResult?id=" + encrypt(projectId,"nfs");
		 		   }else{
		 		   	    $("#skipbtn", parent.document).click(function(){
		 		   	    	 $.ajax({
							 	   type: "POST",
							 	   async: true,
							 	   url: "networkconfusion/submitSkipPathway.form",
							 	   data: {num:arr1[7],otherinfo:encrypt(projectId,"nfs"),email:arr1[1],title:arr1[2],id:arr1[3],idType:arr1[4],inline:arr1[5],cycle:arr1[6],advancedInfo:advancedInfo,cacheId:cacheId},
							 	   success: function(resp){
							 		  	console.log(resp);
							 		  	if(resp.data == 'success'){
							 		  		window.parent.location.href = "networksimilarityResult_2?id=" + encrypt(projectId,"nfs");
							 		  	}else{
							 		  		window.parent.location.href = "networksimilarityResult?id=" + encrypt(projectId,"nfs");
							 		  	}
							 	   },
							 	   error: function(ex){
							 	   		window.parent.location.href = "networksimilarityResult?id=" + encrypt(projectId,"nfs");
							 	   }
							});
		 		   	    });
		 		   	    $("#stillbtn", parent.document).click(function(){
		 		   	    	 window.parent.location.href = "networksimilarityResult?id=" + encrypt(projectId,"nfs");
		 		   	    });
						if(getCookie("tour2") != 'null' && getCookie("tour2") != '' && getCookie("tour2") != null){
							$("#skipbtn", parent.document).click();
						}else{
							window.parent.window.skipModalTip('Examples of cached data, whether to skip computing!');
						}
		 		   }
		 	   }
		});
		$("#step6").attr('disabled',false);
	}else if(type == 2){
		var num = $(".fieldset").length;
		var refnet = $("#refnetSelect").val();
		var refnet1 = $("#refnetSelect :selected").text();
		$('#resultNav', window.parent.document).attr("num",num);
		var arr1 = new Array(); 
		arr1[0] = type;
		arr1[1] = email;
		arr1[2] = jobtitle;
		arr1[3] = projectId;
		arr1[4] = idTypeValue;
		arr1[5] = inlineValue;
		arr1[6] = cycleValue;
		arr1[7] = num;
		arr1[8] = refnet;
		arr1[9] = example;
		arr1[10] = fileName;
		arr1[11] = refnet1;
		sessionStorage.setItem("pairwiseinfo",JSON.stringify(arr1));
		
		
		
		var advancedInfo = sessionStorage.getItem("advancedInfo");
		
		if(haschange){
			window.parent.location.href = "networksimilarityResult?id=" + encrypt(projectId,"nfs");
			$("#step6").attr('disabled',false);
			return;
		}
		
        $.ajax({
		 	   type: "POST",
		 	   async: true,
		 	   url: "networkconfusion/getCacheStatus.form",
		 	   data: {refnet:arr1[8],inline:arr1[5],cycle:arr1[6],advancedInfo:advancedInfo,example:example},
		 	   success: function(msg){
		 		   var cacheId = msg.data;
				   if(typeof(msg.data) != 'undefined' && msg.data==''){
					 	 window.parent.location.href = "networksimilarityResult?id=" + encrypt(projectId,"nfs");
		 		   }else{
		 		   	    $("#skipbtn", parent.document).click(function(){
		 		   	    	 $.ajax({
							 	   type: "POST",
							 	   async: true,
							 	   url: "networkconfusion/submitSkipPathway.form",
							 	   data: {num:arr1[7],otherinfo:encrypt(projectId,"nfs"),email:arr1[1],title:arr1[2],refnet:arr1[8],id:arr1[3],idType:arr1[4],inline:arr1[5],cycle:arr1[6],advancedInfo:advancedInfo,cacheId:cacheId},
							 	   success: function(resp){
							 		  	console.log(resp);
							 		  	if(resp.data == 'success'){
							 		  		window.parent.location.href = "networksimilarityResult_2?id=" + encrypt(projectId,"nfs");
							 		  	}else{
							 		  		window.parent.location.href = "networksimilarityResult?id=" + encrypt(projectId,"nfs");
							 		  	}
							 	   },
							 	   error: function(ex){
							 	   		window.parent.location.href = "networksimilarityResult?id=" + encrypt(projectId,"nfs");
							 	   }
							});
		 		   	    });
		 		   	    $("#stillbtn", parent.document).click(function(){
		 		   	    	 window.parent.location.href = "networksimilarityResult?id=" + encrypt(projectId,"nfs");
		 		   	    });
						if(getCookie("tour1") != 'null' && getCookie("tour1") != '' && getCookie("tour1") != null){
							$("#skipbtn", parent.document).click();
						}else{
							window.parent.window.skipModalTip('Examples of cached data, whether to skip computing!');
						}
		 		   }
		 	   },error:function(data){
			 		showTip("An error occurs, please contact nfs_admin@163.com");
			 	}
		});

		return;
	}
	 
	

}

function advancedParam(){
	var advancedParam = "";
	
	var inlineValue = $('input[name="inline-radios"]:checked').val();
	var similarityValue = $('input[name="similarity-radio"]:checked').val();
	if(inlineValue!=null&&inlineValue!=undefined&&inlineValue!=""){
			var arr2 = new Array();
			if(inlineValue=="APCLUSTER"){
				advancedParam = $("#apclusterForm").serialize();
			}
			if(inlineValue=="ISORANK"){
				advancedParam = $("#isorankForm").serialize();
			}
			if(inlineValue=="SPINAL"){
				advancedParam = $("#spinalForm").serialize();
			}
			if(inlineValue=="GHOST"){
				advancedParam = $("#ghostForm").serialize();
			}
			arr2[0]=inlineValue;
			arr2[1]=advancedParam;
			arr2[2]=similarityValue;
			sessionStorage.setItem("advancedInfo",JSON.stringify(arr2));
	}
}

function dbFile(id){
	$.ajax({
	 	   type: "POST",
	 	   async: false,
	 	   url: "networkconfusion/dbResultFile.form",
	 	   data: {saveId:id},
	 	   success: function(msg){
	 	   }
	});
}
function removeNet(count){
	$("#pariwiseIframe",parent.document).css("height",($("#pariwiseIframe",parent.document).height()-550)+"px");
	$("#row"+count).remove();
}
function addMoreNet1(){
/*	$("#pariwiseIframe",parent.document).css("height",($("#pariwiseIframe",parent.document).height()+550)+"px");
*/	var count = $(".fieldset").length + 1;
		if(count>5) {
				showTip('Input network limits reached: at most five input networks are supported.');
				return;
			}
			$("#pariwiseIframe",parent.document).css("height",($("#pariwiseIframe",parent.document).height()+550)+"px");
	var p2 = "<p style='margin-left: 5px;margin-top: 0px;'>The query network uploaded will be parsed, convert IDs to gene symbol, and see the preview below.</p>	";
	var p1 = "<p style='margin-left: 5px;margin-top: 0px;    '>Enter or upload one network.. Learn . <a href='javascript:void(0);' onclick=\"moveLink('networksimilarityHelp#UploadbodyA');\">more</a><br><br></p>";
	var  html =  "<div class='row' id='row" + count + "' name='addMoreNet'>	"
	+"	<div class='col-lg-12 col-md-12'>"
	+"		<div class='panel panel-info fieldset'>"
	+"			<div class='panel-heading' style='background: #337ab7;'>"
	+"				<h2><strong><font color='white'>Input network #" + count + "</font></strong></h2>"	
	+"				<div class='panel-actions'>"
	+"					<a class='btn-minimize'style='cursor: pointer;border-left:0px;' onclick='removeNet(\""+count+"\")'> <i class='glyphicon glyphicon-trash' style='color: white;' aria-hidden='true'></i> </a>"
	+"				</div>"			
	+"			</div>"
	+"		<div class='panel-body' style='padding-left: 5px;padding-bottom: 0;'><input type='hidden' id='fileName"+count+"' name='fileName'/>" 

	+"			<div class='row'>	"
	+"				<div class='col-lg-6 col-md-6'>" +p1
	+"					<div  style='height: 300px;    margin-top: -3px;'><textarea rows='3' cols='5' id='textareaNet" + count + "' name='textarea' placeholder='Enter edge list,adjustim,igraph etc.' class='countable form-control' data-limit='100' style='margin: 0px -0.5px 0px 0px; height: 300px; '></textarea></div>"
	+"					<form class='form-horizontal ' action='#' style='margin-top:10px;'>										  " 
	+"					  <div class='form-group' style='margin-bottom:0;'>"
	+"			<div class='row'><div style='margin-left: 40px;'>	"							  
	+"				<a class='btn btn-default btn-primary' href='javascript:void(0);'  name='clearBtn' id='clearBtn" + count + "'>clear</a>&nbsp;&nbsp;&nbsp;"
	+"									<a class='btn btn-default btn-primary'  href='javascript:void(0);'  name='okBtn' id='OKBtn" + count + "'>OK</a>"
	+"								</div>		"
	+"							</div>"
	+"						<div style='margin-left: 15px;margin-top: 5px;'> <label class='col-md-3 control-label' style='width:85px;'>or Upload:</label> "
	+"						 <div class='col-md-4'>"
	+"							<div class='fileupload fileupload-new' onclick='showSelectFileModal(" + count + ")' style='margin-bottom:0;' data-provides='fileupload'>"
	+"								<div class='input-group'>"
	+"									<div class='input-group-btn'>"
	+"										<a class='btn btn-default btn-file'  id='selectFileWidth"+count+"'>"
	+"											<span class='fileupload-new' id='selectFile"+count+"'>Select file</span>"
	+"											<span class='fileupload-exists'>Change</span>"
	+"										</a><a href='#' class='btn btn-danger fileupload-exists' data-dismiss='fileupload'>Remove</a>"
	+"									</div>"
	+"								</div>"
	+"							</div></div>"
	+"						 </div>												<input type='hidden' id='hiddenTxt" + count + "' value='0' name='hiddenTxt'/>"
	+"					  </div>"
	+"					</form>"
	+"				</div>"+p2 
	+"				<div class='col-lg-6 col-md-6' style='height:300px; border:1px dotted #ccc;padding-right:0;' id='previewNet" + count + "'>"
	+"					<span style='margin-top:5px;display:inline-block;font-size:14px;'>A preview of your query network will show here</span> "
	+"				</div>"
	+"			</div></div>"
	+"		</div>"
	+"	</div>"
	+"</div>";
	$("#selectFileContent").append(html);
	window.parent.iFrameHeight('pariwiseIframe');
	$("a[name=clearBtn]").unbind("click");
	$("a[name=okBtn]").unbind("click");
	$("a[name=clearBtn]").bind("click",clearTxt);
	$("a[name=okBtn]").bind("click",textareaChange);


}

function addMoreNet(){
	$("#pariwiseIframe",parent.document).css("height",($("#pariwiseIframe",parent.document).height()+550)+"px");
	var count = $(".fieldset").length + 1;
	
	var  html = "<div class='row' id='row" + count + "' name='addMoreNet'>"+
	"<div class='col-lg-12 col-md-12' >"+
	"<div class='panel panel-info fieldset'>"+
		/*"<h3> Step 2: Upload network (<a href='javascript:void(0);' onclick='moveLink('networksimilarityHelp#UploadbodyA');'>Learn more</a>)</h3>"+
		"<p>Input one or more networks for network fingerprints.</p>"+*/
		"<div class='panel-heading' style='background: #337ab7;'>"+
			"<h2><strong><font color='white'>Input Network #" + count + "</font></strong></h2>"+
			"<div class='panel-actions'>"+
			"					<a class='btn-minimize'style='cursor: pointer;border-left:0px;' onclick='removeNet(\""+count+"\")'> <i class='glyphicon glyphicon-trash' style='color: white;' aria-hidden='true'></i> </a>"+
			"</div>"+
		"</div>"+
		"<div class='panel-body' style='padding-left: 5px;padding-bottom: 0;' id='step2'>"+
			"<div class='row'>"+
				"<div class='col-lg-6 col-md-6'>"+
					"<div style='height:6em'>"+
					"<p style='margin-left: 5px;margin-top: 0px;'> <a class='btn btn-success' onclick='showSelectFileModal(" + count + ")' href='javascript:void(0);'><span class='glyphicon glyphicon-upload' aria-hidden='true'></span>&nbsp;Upload a network</a> GraphML(*.graphml) and edge list(*.edgelist) are supported."+
					"<br>"+
					"Otherwise, enter a network below directly."+
					"</p></div>"+
					"<div class='row'>"+
					"<div class='form-group' style='margin-bottom:3;width: 100%;'>"+
					"<div style='margin-left: 30px;margin-top: 5px;'>"+
								" <div style='display:none'>"+
									"<div class='fileupload fileupload-new' onclick='showSelectFileModal(" + count + ")' style='margin-bottom:0;' data-provides='fileupload'>"+
										"<div class='input-group'>"+
											"<div class='input-group-btn' >"+
												"<a class='btn btn-default btn-file' style='width: 90px;'  id='selectFileWidth" + count + "'>"+
												"	<span class='fileupload-new' data-step='1' data-intro='select a file!' id='selectFile" + count + "' >Select file</span>"+
												"	<span class='fileupload-exists'>Change</span>"+
												"</a><a href='#' class='btn btn-danger fileupload-exists' data-dismiss='fileupload'>Remove</a>"+
										"	</div>"+
										"</div>"+
									"</div>"+
									"<input type='hidden' id='hiddenTxt" + count + "' name='hiddenTxt' value='0'/>"+
								" </div>"+
							  "</div>"+
							"</div>"+
					"</div>"+
					"<div  style='height: 300px;'>"+
					"	<input type='hidden' id='fileName" + count + "' name='fileName'/>"+
				"		<textarea rows='3' cols='5' id='textareaNet" + count + "'  name='textarea' placeholder='Enter edge list or graphml. ' class='countable form-control' data-limit='100' style='margin: 0px -0.5px 0px 0px; height: 300px; '></textarea>"+
				"	</div>"+
				"</div>"+
				"<div class='col-lg-6 col-md-6'>"+
				"<div style='height:6em' id='networkOutputTip'>"+
				"	<p style='margin-left: 5px;margin-top: 0px; '>The query network uploaded, parsed and visualized. </p>"+
				"</div>"+
				"<div  style='height:300px; border:1px dotted #ccc;padding-right:0;' id='previewNet" + count + "'>"+
				"	<span style='margin-top:5px;display:inline-block;font-size:14px;'>A preview of your query network will show here</span>"+
				"</div>"+
				"</div>"+
				"<form class='form-horizontal ' action='#' style='margin-top:10px;'>"+
				"<div class='row'>"+
				"	<div style='float:right;'>"+
						"<a class='btn btn-default btn-primary' href='javascript:void(0);' style='margin-right: 5px;' name='okBtn' id='OKBtn" + count + "'>Update Network View</a>"+
						"<a class='btn btn-default btn-primary' href='javascript:void(0);'  name='clearBtn' id='clearBtn" + count + "'>Clear</a>&nbsp;&nbsp;&nbsp;"+
					"</div>"+
				"</div>"+
				"</form>"+
			"</div>"+
		"</div>"+
	"</div>"+
"</div>"+
"</div>";
	$("#selectFileContent").append(html);
	window.parent.iFrameHeight('pariwiseIframe');
	$("a[name=clearBtn]").unbind("click");
	$("a[name=okBtn]").unbind("click");
	$("a[name=clearBtn]").bind("click",clearTxt);
	$("a[name=okBtn]").bind("click",textareaChange);


}
function showLibrary(){
	$.ajax({
	 	   type: "POST",
	 	   url: "networkconfusion/getAllLibrary.form",
	 	   success: function(msg){
	 		   console.log(msg)
	 		   var usrlib = msg.user;
	 		   var syslib = msg.system;
	 		   var usrstr = "";
	 		   var sysstr = "";
	 		   for(var i=0;i<usrlib.length;i++){
	 			  usrstr += "<option title='" + usrlib[i][2] + " net'   value='" + usrlib[i][1] + "'>" + usrlib[i][0] + "</option>";
	 		   }
	 		   for(var i=0;i<syslib.length;i++){
	 			  sysstr += "<option title='" + syslib[i][2] + "' Description='"+syslib[i][3]+"' value='" + syslib[i][1] + "'>" + syslib[i][0] + "</option>";
	 		   }
	 		   $("#userLibOpt").html(usrstr);
	 		   $("#systemLibOpt").html(sysstr);
	 		   $("#refnetSelect").bind("click",sysLibClickEvent);
//				 $("option[value='"+window.parent.document.getElementById("libraryHidden").value+"']").attr('selected','selected');
	 		  if(window.parent.document.getElementById("libraryHidden").value){
					 				 	$("option[value='"+window.parent.document.getElementById("libraryHidden").value+"']").attr('selected','selected')
					 				}else{
					 					$("#refnetSelect option[value='nci_regulatory_refnet60']").attr('selected',true);
					 				}
				 sysLibClickEvent();
	 	   },error:function(data){
		 		showTip("An error occurs, please contact nfs_admin@163.com");
		 	}
	});
}
function sysLibClickEvent(){
	var obj = $("#refnetSelect").find("option:selected").attr('Description');
	$("#refNetDescription").text(obj);
	$("#refNetDescription").append("&nbsp;&nbsp;<a href='javascript:void(0);' onclick='skipResource();'>learn more</a>");
}

function skipResource(){
	top.location.href = 'networksimilaritystatistical';
}


function loadSampleAll(type){
	window.parent.window.ModalTipLoading('show');  
	//loadSample(1);
	 $("#fileName1").val("net1.graphml");
	 $("#fileName2").val("net2.graphml");
	if(type=="one"){
		
		loadSample(1);
		$("#cycleValue option[value='100']").attr("selected",true);
		$("input[name=inline-radios]:eq(0)").attr("checked",'checked');
		 $("#hiddenTxt1").val("1");
	}else{
		loadSample(1);
		setTimeout(function(){  
			loadSample(2);
			$("#pariwiseIframe",parent.document).css("height",($("#pariwiseIframe",parent.document).height()+200)+"px");
		}, 3000);  
		
		//xuanzhong zhi
		$("#hiddenTxt1").val("1");
		$("#hiddenTxt2").val("1");
		$("#cycleValue option[value='100']").attr("selected",true);
		$("input[name=inline-radios]:eq(0)").attr("checked",'checked');

	}
	
}

function loadSample(type){
	
	//getNetPreviewDataSample
	$("#loadSampleOption").attr("selected",true);
	$("#loadSampleOption2").attr("selected",true);
	$("option:contains(nci_signaling_refnet)").attr("selected",true);
	var filename = "net" + type;
	 if(type==1){
		 $("#selectFile1",window.frames['pariwiseIframe']).text("net1")
	 }else if(type==2){
		 $("#selectFile2",window.frames['pariwiseIframe']).text("net2")
	 }
	 $("#textareaNet" + type).val("");
	$.ajax({
		type: "POST",
		   url: "networkconfusion/getNetPreviewDataSample.form",
		   data: {
			   filename: filename,type:type
		   }, beforeSend: function () {
				          
           },
		   success: function(msg){
			   $("#textareaNet" + type).val(msg.data);
			   var txt1 = $("#textareaNet1").val();
			   var txt2 = $("#textareaNet2").val()
			   if(txt1!=""&&txt2!=""){
				   window.parent.window.ModalTipLoading('hide');   
			   }
				  var info = msg.info;
				  var imgsrc = msg.imgsrc;
				  var htmlstr = "<div class='col-md-7' style='padding-right:0;padding-left:0;'><img src='" + imgsrc + "?time="+Math.random()+ "' style='border-right:1px dotted #ccc;height:298px;width:100%;' /></div>" +
					"<div class='col-md-5' style='padding-right: 0;'>" +
						"<div class='panel panel-default' style='border:none;'>" + 
							"<div class='panel-body' style='height:298px;border-right: none;border-left: 0;border-bottom: 0;'>" +
								"<p><strong>Nodes num:</strong><span>" + info[0] + "</span></p>" +
								"<p><strong>Edges num:</strong><span>" + info[1] + "</span></p>" +
								"<p><strong>Density:</strong><span>" + info[2] + "</span></p>" +
								"<p><strong>Clustering coefficient:</strong><span>" + info[3] + "</span></p>" +
							"</div>" +	
						"</div>" +
					"</div>";
				$("#previewNet" + type).html(htmlstr);
		   },error:function(data){
		 		showTip("An error occurs, please contact nfs_admin@163.com");
		 	}
	});
}

//==============================格式转换
function textareaChange(){
	var id = $(this).attr("id");
	haschange = true;
	window.parent.window.MyModalFormatTip(id.substring(5));
}
//advanced event
function advancedEvent(type){
	
	if(type==1){
		var advancedText = $("#advancedBtn").text();
		if(advancedText=="Show Advanced Parameters"){
			$("#advancedBtn").text("Hide Advanced Parameters");
			//$("#pariwiseIframe",parent.document).css("min-height","1800px");
			$("#advancedDiv").show();
			$("#pariwiseIframe",parent.document).css("height",($("#pariwiseIframe",parent.document).height()+500)+"px");
		}else {
			$("#advancedBtn").text("Show Advanced Parameters");
			$("#advancedDiv").hide();
			$("#pariwiseIframe",parent.document).css("height",($("#pariwiseIframe",parent.document).height()-500)+"px");
		}
	}

	var inlineValue = $('input[name="inline-radios"]:checked').val();
	if(inlineValue!=null&&inlineValue!=undefined&&inlineValue!=""){
		
		if(inlineValue=="APCLUSTER"){
			$("#apclusterDiv").show();
			$("#isorankDiv").hide();
			$("#spinalDiv").hide();
			$("#ghostDiv").hide();
		}
		if(inlineValue=="ISORANK"){
			$("#apclusterDiv").hide();
			$("#isorankDiv").show();
			$("#spinalDiv").hide();
			$("#ghostDiv").hide();
		}
		if(inlineValue=="SPINAL"){
			$("#apclusterDiv").hide();
			$("#isorankDiv").hide();
			$("#spinalDiv").show();
			$("#ghostDiv").hide();
		}
		if(inlineValue=="GHOST"){
			$("#apclusterDiv").hide();
			$("#isorankDiv").hide();
			$("#spinalDiv").hide();
			$("#ghostDiv").show();
		}
	}else{
		showTip("Please select Alignmet algorithm!!!");
	}
	
}

function deleteFile(){
	
	$.ajax({
		type: "POST",
		   url: "networkconfusion/deleteFile",
		   data: {
			   jobId:$("#jobTitle").html()
		   },
		   success: function(data){
			   
		   }
	
	});
}

function loadSimpleEvent(obj){
	
	$("a[name='LoadSample-radio']").css('text-decoration','none');
	$("a[name='LoadSample-radio']").css('font-size','1.5em');
	//$("a[name='LoadSample-radio']").css('font-size','15px');
	$(obj).css('text-decoration','underline');   
	$(obj).css('font-size','30px');
	SAMPLE_ID = $(obj).attr('value');
	if($(obj).attr('value')=='not'){
		$("div[name='addMoreNet']").remove();
		$("#textareaNet1").val("");
		$("#previewNet1").html("A preview of your query network will show here");
		$("#hiddenTxt1").val("0");
		$("#selectFile1").html("Select file");
		
		window.parent.location.reload();
	}else{
		$("div[name='addMoreNet']").remove();
		 $("#pariwiseIframe",parent.document).css("height",(2650)+"px");
		$("#textareaNet1").val("");
		$("#previewNet1").html("A preview of your query network will show here");
		$("#hiddenTxt1").val("0");
		window.parent.window.ModalTipLoading('show');    

		$.ajax({
			type: "POST",
			   url: "networkconfusion/getNetDataSamplePairwaseAlignment.form",
			   data: {
				   type:$(obj).attr('value')
			   }, beforeSend: function () {
					        
               },
			   success: function(data){
				   $("#refnetSelect").val("");
				   $("option[value='nci_regulatory_refnet60']").attr('selected','selected');
				   setTimeout(function(){
					  
					   if(getCookie("tour1") == 1){
							openintrojs(1);
						}
					   for(var i =0 ; i<data.length ; i++){
						   if(i>0){
							   addMoreNet();
							   //$("#pariwiseIframe",parent.document).css("height",($("#pariwiseIframe",parent.document).height()+370)+"px");
						   }else{
							   $("#pariwiseIframe",parent.document).css("height",($("#pariwiseIframe",parent.document).height()+50)+"px");
						   }
						   var msg = data[i];
							   $("#textareaNet"+(i+1)).val(msg.data);
								  var info = msg.info;
								  var imgsrc = msg.imgsrc;
								  var sss = new Date().getTime();
								  console.log(sss);
								  var htmlstr = "<div class='col-md-7' style='padding-right:0;padding-left:0;'><img src='" + imgsrc + "?time="+sss+"&aaa="+Math.random()+"' style='border-right:1px dotted #ccc;height:298px;width:100%;' /></div>" +
									"<div class='col-md-5' style='padding-right: 0;'>" +
										"<div class='panel panel-default' style='border:none;'>" + 
											"<div class='panel-body' style='height:298px;border-right: none;border-left: 0;border-bottom: 0;'>" +
												"<p><strong>Nodes num:</strong><span>" + info[0] + "</span></p>" +
												"<p><strong>Edges num:</strong><span>" + info[1] + "</span></p>" +
												"<p><strong>Density:</strong><span>" + info[2] + "</span></p>" +
												"<p><strong>Clustering coefficient:</strong><span>" + info[3] + "</span></p>" +
											"</div>" +	
										"</div>" +
									"</div>";
								$("#previewNet"+(i+1)).html(htmlstr);
								$("#hiddenTxt" + (i+1)).val("1");
								
								
								$("#selectFile"+(i+1)).html(msg.net[i]);
								$("#fileName"+(i+1)).val(msg.net[i]);
					   }
					   window.parent.window.ModalTipLoading('hide');
				   }, 3000);  
				   
	
			   }
		
		});
	}
}

function encrypt(str, pwd) {
  if(pwd == null || pwd.length <= 0) {
    console.log("Please enter a password with which to encrypt the message.");
    return null;
  }
  var prand = "";
  for(var i=0; i<pwd.length; i++) {
    prand += pwd.charCodeAt(i).toString();
  }
  var sPos = Math.floor(prand.length / 5);
  var mult = parseInt(prand.charAt(sPos) + prand.charAt(sPos*2) + prand.charAt(sPos*3) + prand.charAt(sPos*4) + prand.charAt(sPos*5));
  var incr = Math.ceil(pwd.length / 2);
  var modu = Math.pow(2, 31) - 1;
  if(mult < 2) {
    console.log("Algorithm cannot find a suitable hash. Please choose a different password. \nPossible considerations are to choose a more complex or longer password.");
    return null;
  }
  var salt = Math.round(Math.random() * 1000000000) % 100000000;
  prand += salt;
  while(prand.length > 10) {
    prand = (parseInt(prand.substring(0, 10)) + parseInt(prand.substring(10, prand.length))).toString();
  }
  prand = (mult * prand + incr) % modu;
  var enc_chr = "";
  var enc_str = "";
  for(var i=0; i<str.length; i++) {
    enc_chr = parseInt(str.charCodeAt(i) ^ Math.floor((prand / modu) * 255));
    if(enc_chr < 16) {
      enc_str += "0" + enc_chr.toString(16);
    } else enc_str += enc_chr.toString(16);
    prand = (mult * prand + incr) % modu;
  }
  salt = salt.toString(16);
  while(salt.length < 8)salt = "0" + salt;
  enc_str += salt;
  return enc_str;
}


function decrypt(str, pwd) {
  if(str == null || str.length < 8) {
    console.log("A salt value could not be extracted from the encrypted message because it's length is too short. The message cannot be decrypted.");
    return;
  }
  if(pwd == null || pwd.length <= 0) {
    console.log("Please enter a password with which to decrypt the message.");
    return;
  }
  var prand = "";
  for(var i=0; i<pwd.length; i++) {
    prand += pwd.charCodeAt(i).toString();
  }
  var sPos = Math.floor(prand.length / 5);
  var mult = parseInt(prand.charAt(sPos) + prand.charAt(sPos*2) + prand.charAt(sPos*3) + prand.charAt(sPos*4) + prand.charAt(sPos*5));
  var incr = Math.round(pwd.length / 2);
  var modu = Math.pow(2, 31) - 1;
  var salt = parseInt(str.substring(str.length - 8, str.length), 16);
  str = str.substring(0, str.length - 8);
  prand += salt;
  while(prand.length > 10) {
    prand = (parseInt(prand.substring(0, 10)) + parseInt(prand.substring(10, prand.length))).toString();
  }
  prand = (mult * prand + incr) % modu;
  var enc_chr = "";
  var enc_str = "";
  for(var i=0; i<str.length; i+=2) {
    enc_chr = parseInt(parseInt(str.substring(i, i+2), 16) ^ Math.floor((prand / modu) * 255));
    enc_str += String.fromCharCode(enc_chr);
    prand = (mult * prand + incr) % modu;
  }
  return enc_str;
}

function clearTxt(){
	var id = $(this).attr("id");
	$("#textareaNet"+id.substring(8)).val("");
	$("#previewNet"+id.substring(8)).html("A preview of your query network will show here");
	$("#hiddenTxt"+id.substring(8)).val("0");
	$("#selectFile"+id.substring(8)).html("Select file");
}
/*var opts = {            
        lines: 13, // 花瓣数目
        length: 20, // 花瓣长度
        width: 10, // 花瓣宽度
        radius: 30, // 花瓣距中心半径
        corners: 1, // 花瓣圆滑度 (0-1)
        rotate: 0, // 花瓣旋转角度
        direction: 1, // 花瓣旋转方向 1: 顺时针, -1: 逆时针
        color: '#5882FA', // 花瓣颜色
        speed: 1, // 花瓣旋转速度
        trail: 60, // 花瓣旋转时的拖影(百分比)
        shadow: false, // 花瓣是否显示阴影
        hwaccel: false, //spinner 是否启用硬件加速及高速旋转            
        className: 'spinner', // spinner css 样式名称
        zIndex: 2e9, // spinner的z轴 (默认是2000000000)
        top: 'auto', // spinner 相对父容器Top定位 单位 px
        left: 'auto'// spinner 相对父容器Left定位 单位 px
    };
*/
//    var spinner = new Spinner(opts);

function myscroll(div){
	parent.document.body.scrollTop = $(div).offset().top + $(div).height();
}

//写cookies 

function setCookie(name,value) 
{ 
    var Days = 30; 
    var exp = new Date(); 
    exp.setTime(exp.getTime() + Days*24*60*60*1000); 
    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString(); 
} 

//读取cookies 
function getCookie(name) 
{ 
    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
 
    if(arr=document.cookie.match(reg))
 
        return unescape(arr[2]); 
    else 
        return null; 
} 

//删除cookies 
function delCookie(name) 
{ 
    var exp = new Date(); 
    exp.setTime(exp.getTime() - 1); 
    var cval=getCookie(name); 
    if(cval!=null) 
        document.cookie= name + "="+cval+";expires="+exp.toGMTString(); 
}
