$(document).ready(function(){
	showLibrary();
});
function showSelectFileModal(type){
	$("#removeFileBtn").trigger("click");
	//$("#file").attr("flag",type);
	//$("#selectFileModal").modal('show');
	window.parent.window.MyModal('show',type);
}
function submitUploadFile(type){
	//var type = $("#file").attr("flag");
	var url = "networksimilarity/uploadPairwise.form";
	ajaxFileUpload(url,type);
	//$("#selectFileModal").modal('hide');
	window.parent.window.MyModal('hide');
}
function ajaxFileUpload(_url,type) {
	var filename = "net" + type + ".graphml"; 
	var fileObj = window.parent.document.getElementById("file").files[0]; // js 获取文件对象
    var FileController = _url;                    // 接收上传文件的后台地址 
    // FormData 对象
    var form = new FormData();
    form.append("type", type); 
    form.append("filename", filename);                        // 可以增加表单数据
    form.append("file", fileObj);                           // 文件对象
    // XMLHttpRequest 对象
    var xhr = new XMLHttpRequest();
    xhr.open("post", FileController, true);
    xhr.onload = function (msg) {
       var data = JSON.parse(msg.currentTarget.responseText).data;
       if(data == 'success'){
    	   showNetAllInfo(type);
       }
    };
    //xhr.upload.addEventListener("progress", progressFunction, false);
    xhr.send(form);
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
	 		  var htmlstr = "<div class='col-md-7' style='padding-right:0;padding-left:0;'><img src='" + imgsrc + "' style='border-right:1px dotted #ccc;height:298px;width:100%;' /></div>" +
	 			"<div class='col-md-5' style='padding-right: 0;'>" +
	 				"<div class='panel panel-default' style='border:none;'>" + 
	 					//"<div class='panel-heading' style='border-right:none;border-left: 1px dotted #ccc;'>" +
	 					//	"Net" + type + " Info:" +
	 					//"</div>" +	
	 					"<div class='panel-body' style='height:298px;border-right: none;border-left: 0;border-bottom: 0;'>" +
	 						"<p><strong>Nodes num:</strong><span>" + info[0] + "</span></p>" +
	 						"<p><strong>Edges num:</strong><span>" + info[1] + "</span></p>" +
	 						"<p><strong>Density:</strong><span>" + info[2] + "</span></p>" +
	 						"<p><strong>Clustering coefficient:</strong><span>" + info[3] + "</span></p>" +
	 					"</div>" +	
	 				"</div>" +
	 			"</div>";
	 		$("#previewNet" + type).html(htmlstr);
	 	   }
	});
}
function generateId(){
	var d = new Date(),str = '';
	str += d.getFullYear();
	/*str  += d.getMonth() + 1;*/
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
function submitPairwise(type){
	//checkEmail
	
	var email = "";
	if($("#checkEmail").prop("checked") == true){
		email = $("#notifyemail").val();
			if(email.trim()==undefined||email.trim()==""){
		showTip("Please fill in the email!");
		return;
		}else{
			 if(!checkEmail(email.trim())){
				 showTip("Please fill in the correct email address!");
					return;
			 }
		}
	}
	var inlineValue = $('input[name="inline-radios"]:checked').val();
	var cycleValue = $("#cycleValue").val();
	var idTypeValue = "";
	var idTypes = $('select[name="idType"]');
	for(var i=0;i<idTypes.length;i++){
		idTypeValue += $(idTypes[i]).val()+",";
	}


	//$('#resultNav', window.parent.document).trigger("click");
	$('#resultNav', window.parent.document).attr("jobtitle",$("#jobTitle").val());
	$('#resultNav', window.parent.document).attr("type",type);
	var jobtitle = $("#jobTitle").val();
	var projectId = "Report" + jobtitle;

	$('#resultNav', window.parent.document).attr("saveId","Report" + jobtitle);

	$('#resultNav', window.parent.document).attr("email",email);
	if(type == 1){
		$.ajax({
		 	   type: "POST",
		 	   async: true,
		 	   url: "networkconfusion/submitPairwise.form",
		 	   data: {email:email,title:jobtitle,id:projectId,idType:idTypeValue,inline:inlineValue,cycle:cycleValue},
		 	   success: function(msg){
		 		   console.log("=============");
		 		   console.log(msg);
		 		//  dbFile(projectId);
		 	   }
		});
	}else if(type == 2){
		var num = $(".fieldset").length;
		var refnet = $("#refnetSelect").val();
		$('#resultNav', window.parent.document).attr("num",num);
		$.ajax({
		 	   type: "POST",
		 	   async: true,
		 	   url: "networkconfusion/submitPathway.form",
		 	   data: {num:num,email:email,title:jobtitle,refnet:refnet[0],id:projectId,idType:idTypeValue,inline:inlineValue,cycle:cycleValue},
		 	   success: function(msg){
		 		  console.log("=====-=-=-=-=-=");
		 		   console.log(msg);
		 		//  dbFile(projectId);
		 		   //$('#resultNav', window.parent.document).attr("saveId",msg.saveId);
		 	   }
		});
	}
	window.parent.location.href = "networksimilarityResult?id=" + projectId;
}

function dbFile(id){
	alert("1111111111");
	$.ajax({
	 	   type: "POST",
	 	   async: false,
	 	   url: "networkconfusion/dbResultFile.form",
	 	   data: {saveId:id},
	 	   success: function(msg){
	 		   console.log("======11111=======");
	 		   console.log(msg);
	 	   }
	});
}
function addMoreNet(){
	var count = $(".fieldset").length + 1;
	
	var p1 = "<p style='margin-left: 5px;margin-top: 0px;'>&nbsp;&nbsp;&nbsp;Enter query sequence(s) in the text area. " +
			"It automatically determines the format of the input. Upload a network of interest in the format of edge-list, xgmml, xml, " +
			"or igraph,.etc. acceptable IDs are ENSEMBL/REFSEQ/UNIPROT/HGNC/Entrez id.</p>";
	var p2 = "<p style='margin-left: 5px;margin-top: 0px;'>&nbsp;&nbsp;&nbsp;After query network are uploaed," +
			" the server parse its format, convert IDs to gene name(links to Entrenz ID), draw a preview graph and " +
			"return values of important network attributes</p></br>";
	
	
	var  html =  "<div class='row'>	"
	+"	<div class='col-lg-12 col-md-12'>"
	+"		<div class='panel panel-info fieldset'>"
	+"			<div class='panel-heading'>"
	+"				<i class='fa fa-refresh red'></i><h2><strong>Query Net" + count + "</strong></h2>"	
	+"				<div class='panel-actions'>"
	+"					<a class='btn-minimize'><i class='fa fa-chevron-up'></i></a>"
	+"				</div>"			
	+"			</div>"
	+"		<div class='panel-body' style='padding-left: 5px;padding-bottom: 0;'>" 
	+"			<div class='row'>	"
	+"				<div class='col-lg-6 col-md-6'>" +p1
	+"					<textarea rows='3' cols='5' id='textareaNet" + count + "' name='textarea' placeholder='Enter edge list,adjustim,igraph etc.' class='countable form-control' data-limit='100' style='margin: 0px -0.5px 0px 0px; height: 300px; '></textarea>"
	+"					<form class='form-horizontal ' action='#' style='margin-top:10px;'>										  " 
	+"					  <div class='form-group' style='margin-bottom:0;'>"
	+"						 <label class='col-md-3 control-label'>or Upload</label> "
	+"						 <div class='col-md-4'>"
	+"							<div class='fileupload fileupload-new' onclick='showSelectFileModal(" + count + ")' style='margin-bottom:0;' data-provides='fileupload'>"
	+"								<div class='input-group'>"
	+"									<div class='input-group-btn'>"
	+"										<a class='btn btn-default btn-file'>"
	+"											<span class='fileupload-new'>Select file</span>"
	+"											<span class='fileupload-exists'>Change</span>"
	+"										</a><a href='#' class='btn btn-danger fileupload-exists' data-dismiss='fileupload'>Remove</a>"
	+"									</div>"
	+"								</div>"
	+"							</div>"
	+"						 </div>"
	+"						 <div class='col-md-5'>"
	+"								<div class='form-group'>"
	+"									<label class='control-label' for='input-small'>ID Type : </label>"
	+"									<div style='display:inline-block;'>"
	+"										<select class='form-control select2'> "
	+"												<option value='AL'>A1BG</option>"
	+"										</select>"
	+"									</div>"
	+"								</div>"
	+"						 </div>"
	+"					  </div>"
	+"					</form>"
	+"				</div>"+p2 
	+"				<div class='col-lg-6 col-md-6' style='height:300px; border:1px dotted #ccc;padding-right:0;' id='previewNet" + count + "'>"
	+"					<span style='margin-top:5px;display:inline-block;font-size:14px;'>Preview network Area</span> "
	+"				</div>"
	+"			</div></div>"
	+"		</div>"
	+"	</div>"
	+"</div>";
	$("#selectFileContent").append(html);
	window.parent.iFrameHeight('pariwiseIframe');
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
	 			  usrstr += "<option title='" + usrlib[i][2] + " net' value='" + usrlib[i][1] + "'>" + usrlib[i][0] + "</option>";
	 		   }
	 		   for(var i=0;i<syslib.length;i++){
	 			  sysstr += "<option title='" + syslib[i][2] + "' value='" + syslib[i][1] + "'>" + syslib[i][0] + "</option>";
	 		   }
	 		   $("#userLibOpt").html(usrstr);
	 		   $("#systemLibOpt").html(sysstr);
	 	   }
	});
}
function loadSampleAll(type){
	loadSample(1);
	if(type=="one"){
		
		loadSample(1);
		$("#cycleValue option[value='100']").attr("selected",true);
		$("input[name=inline-radios]:eq(0)").attr("checked",'checked');
	}else{
		loadSample(1);
		loadSample(2);
		//xuanzhong zhi
		$("#cycleValue option[value='100']").attr("selected",true);
		$("input[name=inline-radios]:eq(0)").attr("checked",'checked');

	}
	
}

function loadSample(type){
	//getNetPreviewDataSample
	$("#loadSampleOption").attr("selected",true);
	$("#loadSampleOption2").attr("selected",true);
	$("option:contains(RefGraph)").attr("selected",true);
	console.log($("#refnetSelect option :contains(RefGraph)"));
	var filename = "net" + type;
	 if(type==1){
		 console.log( $("#selectFile1",window.frames['pariwiseIframe']));
		 $("#selectFile1",window.frames['pariwiseIframe']).text("net1")
	 }else if(type==2){
		 $("#selectFile2",window.frames['pariwiseIframe']).text("net2")
	 }
	$.ajax({
		type: "POST",
		   url: "networkconfusion/getNetPreviewDataSample.form",
		   data: {
			   filename: filename,type:type
		   },
		   success: function(msg){
			   $("#textareaNet" + type).val(msg.data);
				  var info = msg.info;
				  var imgsrc = msg.imgsrc;
				  var htmlstr = "<div class='col-md-7' style='padding-right:0;padding-left:0;'><img src='" + imgsrc + "' style='border-right:1px dotted #ccc;height:298px;width:100%;' /></div>" +
					"<div class='col-md-5' style='padding-right: 0;'>" +
						"<div class='panel panel-default' style='border:none;'>" + 
							//"<div class='panel-heading' style='border-right:none;border-left: 1px dotNew window openNew window openNew windowNew windowted #ccc;'>" +
							//	"Net" + type + " Info:" +
							//"</div>" +	
							"<div class='panel-body' style='height:298px;border-right: none;border-left: 0;border-bottom: 0;'>" +
								"<p><strong>Nodes num:</strong><span>" + info[0] + "</span></p>" +
								"<p><strong>Edges num:</strong><span>" + info[1] + "</span></p>" +
								"<p><strong>Density:</strong><span>" + info[2] + "</span></p>" +
								"<p><strong>Clustering coefficient:</strong><span>" + info[3] + "</span></p>" +
							"</div>" +	
						"</div>" +
					"</div>";
				$("#previewNet" + type).html(htmlstr);
		   }
	});
}