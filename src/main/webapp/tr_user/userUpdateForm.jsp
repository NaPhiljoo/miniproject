<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.sist.web.model.User" %>
<%@ page import = "com.sist.web.dao.UserDao" %>
<%@ page import = "com.sist.web.util.CookieUtil" %>
<%@ page import = "org.apache.logging.log4j.Logger" %>
<%@ page import = "org.apache.logging.log4j.LogManager" %>
<%@ page import = "com.sist.common.util.StringUtil" %>
<%@ page import = "com.sist.web.util.HttpUtil" %>

<%
	Logger logger = LogManager.getLogger("userUpdateFrom.jsp");
	HttpUtil.requestLogString(request, logger);
	
	User user = null;
	
	String cookieUserId = CookieUtil.getValue(request, "USER_ID");
	
	if(!StringUtil.isEmpty(cookieUserId))
	{
		UserDao userDao = new UserDao();
		
		user = userDao.userSelect(cookieUserId);
		
		if(user == null)
		{
			CookieUtil.deleteCookie(request, response, "/index.jsp", "User_Id");
			response.sendRedirect("/index.jsp");
		}
		else
		{
			if(StringUtil.equals(user.getUserStatus(), "N"))
			{
				CookieUtil.deleteCookie(request, response, "/index.jsp", "USER_ID");
				user = null;
				response.sendRedirect("/index.jsp");
			}
		}
		
	}
	
	if(user != null)
	{
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/include/head.jsp"%>
<script>
$(document).ready(function(){
	$("#btnUpdate").on("click",function(){
		
		
		var fn_pwCheck = /^[a-zA-Z0-9]{4,15}$/;
		var fn_emailCheck = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,30}$/;
		var fn_nameCheck = /^[가-힣]+$/;
		var fn_telCheck = /^[0-9]{10,11}$/;
		var fn_birthCheck = /^(19[0-9][0-9]|20\d{2})+-(0[0-9]|1[0-2])+-(0[1-9]|[1-2][0-9]|3[0-1])$/;
		
		
		//비밀번호
		if($.trim($("#userPwd1").val()).length <= 0)
		{
			alert("비밀번호를 입력해주세요.");
			$("#userPwd1").val("");
			$("#userPwd1").focus();
			return;
		}
		else
		{
			if(!fn_pwCheck.test($("#userPwd1").val()))
			{
				alert("비밀번호 입력방식이 잘못되었습니다.");
				$("#userPwd1").val("");
				$("#userPwd1").focus();
				return;
			}
		}
		
		//비밀번호 확인
		if($("#userPwd1").val() != $("#userPwd2").val())
		{
			alert("비밀번호가 일치하지 않습니다.");
			$("#userPwd2").val("");
			$("#userPwd2").focus();
			return;
		}
		
		//이름
		if($.trim($("#userName").val()).length <= 0)
		{
			alert("이름을 입력하시지 않았습니다.");
			$("#userName").val("");
			$("#userName").focus();
			return;
		}
		else
		{
			if(!fn_nameCheck.test($("#userName").val()))
			{
				alert("이름은 한글만 입력할 수 있습니다");
				$("#userName").val("");
				$("#userName").focus();
				return;
			}
		}
		
		//생일
		if($.trim($("#userBirth").val()).length <= 0)
		{
			alert("생년월일을 입력해주세요.");
			$("#userBirth").val("");
			$("#userBirth").focus();
			return;
		}
		
		if(!fn_birthCheck.test($("#userBirth").val()))
		{
			alert("생년월일이 올바르지 않습니다.");
			$("#userBirth").val("");
			$("#userBirth").focus();
			return;
		}
		
		//이메일
		if($.trim($("#userEmail").val()).length <= 0)
		{
			alert("이메일을 입력하지 않았습니다.");
			$("#userEmail").val("");
			$("#userEmail").focus();
			return;
		}
		else
		{
			if(!fn_emailCheck.test($("#userEmail").val()))
			{
				alert("이메일 표현식이 적합하지 않습니다.");
				$("#userEmail").focus();
				return;
			}
		}
		
		//전화번호
		if($.trim($("#userTel").val()).length <= 0 )
		{
			alert("전화번호를 입력해주세요.");
			$("#userTel").val("");
			$("#userTel").focus();
			return;
		}
		else
		{
			if(!fn_telCheck.test($("#userTel").val()))
			{
				alert("전화번호 입력방식이 올바르지 않습니다.");
				$("#userTel").val("");
				$("#userTel").focus();
				return;
			}
		}
		
		document.updateForm.submit();
	});
});


</script>
</head>
<body>
<%@include file="/include/navigation.jsp"%>
<div class="login-wrapper">
	<div class="login-content">	
		<form id="updateForm" name="updateForm" method="POST" action="userProc.jsp">
			<h1 class="login-title">회원정보수정</h1>
			
			<div class="updateId">
				<p>아이디 : <a><%= CookieUtil.getValue(request, "USER_ID") %></a></p>
				
			</div>
			<div class="input-box">
				<input type="password" id="userPwd1" name="userPwd1" class="form-control" maxlength="20" placeholder="비밀번호" value = "<%= user.getUserPw()%>">
				<label for="userPwd1">비밀번호</label>
			</div>
			<div class="input-box">
				<input type="password" id="userPwd2" name="userPwd2" class="form-control" maxlength="20" placeholder="비밀번호 확인" value = "<%= user.getUserPw()%>">
				<label for="userPwd2">비밀번호 확인</label>
			</div>
			<div class="input-box">
				<input type="text" id="userName" name="userName" class="form-control" maxlength="20" placeholder="이름" value = "<%= user.getUserName()%>">
				<label for="userName">이름</label>
			</div>
			<div class="input-box">
				<input type="date" id="userBirth" name="userBirth" class="form-control" maxlength="20" placeholder=" 생년월일 " value = "<%= user.getUserBirthdate()%>">
				<label for="userBirth">생년월일</label>
			</div>
			<div class="input-box">
				<input type="text" id="userEmail" name="userEmail" class="form-control" maxlength="20" placeholder="이메일" value ="<%= user.getUserEmial() %>">
				<label for="userAddr">이메일</label>
			</div>
			<div class="input-box">
				<input type="text" id="userTel" name="userTel" class="form-control" maxlength="20" placeholder="전화번호" value = "<%= user.getUserTel() %>">
				<label for="userTel">전화번호</label>
			</div>
			<div class="radio-box">

			<input type="radio" name="userGender" value="M" <%if(StringUtil.equals(user.getUserGender(), "M")){%>checked<%}%>>남자
			<input type="radio" name="userGender" value="F" <%if(StringUtil.equals(user.getUserGender(), "F")){%>checked<%}%>>여자

			</div>

			<div class=btn-container>
			<div class="btn-box">
	    	<button type="button" id="btnUpdate" class="btn" type="submit">수정</button>
	    	</div>
			</div>
		</form>
	</div>


</div>
<%
	}
%>

</body>
</html>