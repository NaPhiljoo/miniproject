<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.sist.web.util.HttpUtil" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="/include/head.jsp"%>
<script>
$(document).ready(function(){
	$("#btnReg").on("click",function(){
		
		var fn_idCheck = /^[a-zA-Z0-9]{4,15}$/;
		var fn_pwCheck = /^[a-zA-Z0-9]{4,15}$/;
		var fn_emailCheck = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,30}$/;
		var fn_nameCheck = /^[가-힣]+$/;
		var fn_telCheck = /^[0-9]{10,11}$/;
		var fn_birthCheck = /^(19[0-9][0-9]|20\d{2})+-(0[0-9]|1[0-2])+-(0[1-9]|[1-2][0-9]|3[0-1])$/;
		
		//아이디
		if($.trim($("#userId").val()).length <= 0)
		{
			alert("아이디를 입력해주세요.");
			$("#userId").val("");
			$("#userId").focus();
			return;
		}
		else
		{
			if(!fn_idCheck.test($("#userId").val()))
			{
				alert("아이디 입력 방식이 잘못되었습니다.");
				$("#userId").val("");
				$("#userId").focus();
				return;
			}
		}
		
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
		
		//아이디 중복체크
		$.ajax({
			type:"POST",
			url:"/tr_user/userIdCheckAjax.jsp",
			data:{
				userId:$("#userId").val()
			},
			datatype:"JSON",
			success:function(obj)
			{
				var data = JSON.parse(obj);
				
				if(data.flag == 0)
				{
					document.regForm.submit();
				}
				else if(data.flag == 1)
				{
					alert("중복된 아이디가 있습니다. 다시 입력하세요.");
					$("#userId").focus();
				}
				else
				{
					alert("아이디 값을 입력하세요.");
					$("#userId").focus();
				}
			},
			error : function(xhr,status,error)
			{
				alert("아이디 중복 체크 오류");
			}
		});
		
	});
});


</script>
</head>
<body>
<%@include file="/include/navigation.jsp"%>
<div class="login-wrapper">
	<div class="login-content">
		
		<form id="regForm" name="regForm" method="POST" action="userProc.jsp">
			<h1 class="login-title">회원가입</h1>
			
			<div class="input-box">
			<input type="text" id="userId" name="userId" class="form-control" maxlength="20" placeholder="아이디">
			<label for="userId">아이디</label>
			</div>
			<div class="input-box">
			<input type="password" id="userPwd1" name="userPwd1" class="form-control" maxlength="20" placeholder="비밀번호">
			<label for="userPwd1">비밀번호</label>
			</div>
			<div class="input-box">
			<input type="password" id="userPwd2" name="userPwd2" class="form-control" maxlength="20" placeholder="비밀번호 확인">
			<label for="userPwd2">비밀번호 확인</label>
			</div>
			<div class="input-box">
			<input type="text" id="userName" name="userName" class="form-control" maxlength="20" placeholder="이름">
			<label for="userName">이름</label>
			</div>
			<div class="input-box">
			<input type="date" id="userBirth" name="userBirth" class="form-control" maxlength="20" placeholder="생년월일">
			<label for="userBirth">생년월일</label> <!-- 데이터 타입이 어떻게 설정되는지 확인해보기 -->
			</div>
			<div class="input-box">
			<input type="text" id="userEmail" name="userEmail" class="form-control" maxlength="20" placeholder="이메일">
			<label for="userEmail">이메일</label>
			</div>
			<div class="input-box">
			<input type="text" id="userTel" name="userTel" class="form-control" maxlength="20" placeholder="전화번호">
			<label for="userTel">전화번호</label>
			</div>
			<div class="radio-box">

			<input type="radio" name="userGender" value="M" checked>남자
			<input type="radio" name="userGender" value="F">여자
			</div>

			
			<div class=btn-container>
			<div class="btn-box">
	    	<button type="button" id="btnReg" class="btn" type="submit">회원가입</button>
	    	</div>
			</div>
		</form>
	</div>


</div>

</body>
</html>