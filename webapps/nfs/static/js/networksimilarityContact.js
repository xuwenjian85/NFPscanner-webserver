$(document).ready(function(){
	$("input,select,textarea").not("[type=submit]").jqBootstrapValidation();
		$("#doSubmit").bind("click",doContact);
});

function doContact(){
//	$("#doForm").submit();
	if($("#id_title").val().trim()==undefined||$("#id_title").val().trim()==""){
		showTip("Please fill in the title!");
		return;
	}
	if($("#id_content").val().trim()==undefined||$("#id_content").val().trim()==""){
		showTip("Please fill in the content!");
		return;
	}
	if($("#id_email").val().trim()==undefined||$("#id_email").val().trim()==""){
		showTip("Please fill in the email!");
		return;
	}else{
		 if(!checkEmail($("#id_email").val().trim())){
			 showTip("Please fill in the correct email address!");
				return;
		 }
	}
	$.ajax({
		   type: "POST",
		   url: "contactController/doContact.form",
		   data: $("#doForm").serialize(),
		   success: function(msg){
			   if(msg.result=="1"){
				   showTip("succeed!");
			   }else{
				   showTip("failed!");
			   }
		   },error:function(){
			   showTip("failed!");
		   }
		});
	
}

function showTip(info){
	$("#tipInfo").html(info);
	$("#tipModal").modal('show');

}


function checkEmail(str){
   var re = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
   if(re.test(str)){
	   return true;
   }else{
       return false;
   }
}
