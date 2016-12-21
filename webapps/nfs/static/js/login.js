$(function(){  
	$("#registerBtn").bind("click",checkRegisterInfo);
}); 

function signUp(){
	$("#loginModal").modal('hide');
	$("#signupModal").modal('show');
}

function forgotPassword(){
	$("#loginModal").modal('hide');
	$("#forgotPasswordModal").modal('show');
}

function logins(){
		jQuery.ajax({
		url:'networksimilarity/loginAction.form',
		data:$('#loginForm').serialize(),
		type:"POST",
		success:function(data){
			console.log("==========================");
			console.log(data);
				if(data.state=="succeed"){
					$("#loginModal").modal("hide");
					 location.reload();
				}else{
					$("#loginModal").modal("hide");
					showTip("Login failed, please login again!");
				}
			}
		});
}
function showTip(info){
	$("#tipInfo").html(info);
	$("#tipModal").modal('show');
}

function checkRegisterInfo(){
	var signpassword = $("#signpassword").val().trim();
	var signcomfirmpassword = $("#signcomfirmpassword").val().trim();
//	var url= window.location.href;
//	var index = url.substring(url.lastIndexOf('?') + 1);
	
	if(signpassword == signcomfirmpassword){
//		$("#registerForm").attr("action","networksimilarity/signup.form?url="+index);
//		$("#registerForm").submit();
		login();
	}else{
		showTip("<font color='red'>The two passwords don't match!!</font>");
	}
}

function login(){
	jQuery.ajax({
		url:'networksimilarity/signup.form',
		data:$('#registerForm').serialize(),
		type:"POST",
		success:function(data){
			console.log("-=-=-=-=-=AAASDS");
			console.log(data);
				if(data=="succeed"){
					$("#signupModal").modal("hide");
					 location.reload();
				}else{
					showTip("<font color='red'>Sign up failed!!</font>");
				}
			}
		});
}
