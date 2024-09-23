<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<%@include file="/include/head.jsp"%>

</head>
<body>
<%@include file="/include/navigation.jsp"%>
<div class="search-wrapper">
	<div class="search-content">
		<form id="idSearchForm" name="idSearchForm" method="POST" action="searchProc.jsp">
			<h1 class="login-title">아이디 찾기</h1>
			<div class="input-box">
			<input type="text" id="userName" name="userName" class="form-control" maxlength="20" placeholder="이름">
			<label for="userName">이름</label>
			</div>
			<div class="input-box">
			<input type="text" id="userEmail" name="userEmail" class="form-control" maxlength="20" placeholder="이메일">
			<label for="userPwd">이메일</label>
			</div>
			<div class=btn-container>
			<div class="btn-box">
			<button type="button" id="btnFnId" class="btn">아이디 찾기</button>
			</div>
			</div>
		</form>
	</div>

	<div class="search-content">
		
		<form id="pwSearchForm" name="pwSearchForm" method="POST" action="searchProc.jsp">
			<h1 class="login-title">비밀번호 찾기</h1>
			<div class="input-box">
			<input type="text" id="userId" name="userId" class="form-control" maxlength="20" placeholder="아이디">
			<label for="userId">아이디</label>
			</div>
			<div class="input-box">
			<input type="text" id="userEmail" name="userEmail" class="form-control" maxlength="20" placeholder="이메일">
			<label for="userEmail">이메일</label>
			</div>
			<div class=btn-container>
			<div class="btn-box">
			<button type="button" id="btnFnPwd" class="btn">비밀번호 찾기</button>
			</div>
			</div>
		</form>
	</div>
</div>
</body>
</html>