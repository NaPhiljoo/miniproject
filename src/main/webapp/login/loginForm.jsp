<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/include/head.jsp"%>
<script>
$(document).ready(function(){
	$("#btnLogin").on("click",function(){
		fn_loginCheck();
	});
});

function fn_loginCheck()
{
	if($.trim($("#userId").val()).length <= 0)
	{
		alert("아이디를 입력해주세요.")
		$("#userId").val("");
		$("#userId").focus();
		return;
	}
	
	if($.trim($("#userPwd").val()).length <= 0)
	{
		alert("비밀번호를 입력해주세요.");
		$("#userPwd").val("");
		$("#userPwd").focus();
		return;
	}
	
	document.loginForm.submit();
}

$(document).ready(function(){
	$("#btnReg").on("click",function(){
		location.href = "/tr_user/userRegForm.jsp";
	});
});

</script>
</head>
<body>
<%@include file= "/include/navigation.jsp" %>
<div class="login-wrapper">
	<div class="login-content">
		
		<form id="loginForm" name="loginForm" method="POST" action="/login/loginProc.jsp">
			<h1 class="login-title">로그인</h1>
			
			<div class="input-box">
			<input type="text" id="userId" name="userId" class="form-control" maxlength="20" placeholder="아이디">
			<label for="userId">아이디</label>
			</div>
			<div class="input-box">
			<input type="password" id="userPwd" name="userPwd" class="form-control" maxlength="20" placeholder="비밀번호">
			<label for="userPwd">비밀번호</label>
			</div>
			<div class=btn-container>
			<div class="btn-box">
			<button type="button" id="btnLogin" class="btn">로그인</button>
			</div>
			<div class="btn-box">
	    	<button type="button" id="btnReg" class="btn" type="submit">회원가입</button>
	    	</div>
			</div>
		</form>
	</div>


</div>

</body>
</html>