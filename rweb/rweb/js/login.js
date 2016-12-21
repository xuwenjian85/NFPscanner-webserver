$(document).ready(function() {
	$("input,select,textarea").not("[type=submit]").jqBootstrapValidation();
});
function login(){
	var username = $("#loginusername").val();
	var password = $("#loginpassword").val();
	if(username == '' || password == ''){
		return;
	}
	$.ajax({
	   type: "POST",
	   url: "networksimilarity/loginAction.form",
	   data: {username:username,password:password},
	   success: function(msg){
		   var status = JSON.parse(msg);
		   $("#loginModal").modal('hide');
		     if(status.data == 'success'){
		    	 $("#btn-login,#btn-signup").hide();
		    	 $("#btn-user,#btn-out").show();
		     }else{
		    	 $("#loginfoModal").modal('show') ;
		     }
	   }
	});
}
function signUp(){
	var username = $("#signusername").val();
	var password = $("#signpassword").val();
	var email =  $("#signemail").val();
	var comfirmpassword =  $("#signcomfirmpassword").val();
	if(username == '' || password == '' || email=='' || comfirmpassword == '' || password != comfirmpassword || 
								username.length < 6 || password.length < 6 || comfirmpassword.length < 6 || email.indexOf("@") < 0){
		return;
	}
	$.ajax({
	   type: "POST",
	   url: "networksimilarity/signup.form",
	   data: {username:username,password:password,email:email,comfirmpassword:comfirmpassword},
	   success: function(msg){
		   var status = JSON.parse(msg);
		   $("#signupModal").modal('hide');
		   if(status.data == 'success'){
			   window.location.reload() ;
		   }else{
			   $("#myinfoModal").modal('show'); 
		   }
	   }
	});
}
function logout(){
	$.ajax({
	   type: "GET",
	   url: "networksimilarity/logout.form",
	   success: function(msg){
		  // location.href = location.href.split("?")[0];
		   location.reload();
	   }
	});
}