<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.sist.web.util.CookieUtil" %>
<%
	if(CookieUtil.getValue(request, "USER_ID").isEmpty()){
%>
 <nav class="navbar"> 
 	<a href="/">MiniProject</a>
	<ul class="nav"> 
		<li><a href="/">홈</a></li>
		<li class="border-category"><a href="/list/list.jsp">게시판</a>
			<div class="border-list">
				<a>서울</a>
				<a>시흥</a>
			</div>
		</li>
  	</ul> 
  	<ul class="nav-user">
  		<li><a href="/tr_user/userRegForm.jsp">회원가입</a></li>
  		<li><a href="/login/loginForm.jsp">로그인</a></li>
  		<li style="width:200px;"><a href="/login/searchForm.jsp">아이디/비밀번호 찾기</a></li>
  		
  	</ul>
</nav>
<%
	}
	else{
%>

 <nav class="navbar"> 
 	<a href="/">MiniProject</a>
	<ul class="nav"> 
		<li><a href="/">홈</a></li>
		<li class="border-category"><a href="/list/list.jsp">게시판</a>
			<div class="border-list">
				<a>서울</a>
				<a>시흥</a>
			</div>
		</li>
  	</ul> 
  	<ul class="nav-user">
  		<li><a href="/login/loginOut.jsp">로그아웃</a></li>
  		<li style="width:150px;"><a href="/tr_user/userUpdateForm.jsp">회원정보수정</a></li>
  		
  	</ul>
</nav>
<%
	}
%>
