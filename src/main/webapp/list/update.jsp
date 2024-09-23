<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/include/head.jsp" %>
<%@include file="/include/navigation.jsp" %>
</head>
<body>
<div class="board-list">
	<div class="sidebar-container">
		<div class="sidebar">
			<ol>
			
				<li class="sidebar-title">게시판</li>
				<li class="sidebar-content">서울</li>
				<li class="sidebar-content">경기</li>
				
			</ol>
		</div>
	</div>
	<div class="container">
		<div class="category">
		<h2>게시물 수정</h2>
		</div>
		<form name="updateForm" id="updateForm" class="form" action="/board/updateProc.jsp" method="post">
			<input type="text" name="bbsName" id="bbsName" maxlength="20" value="이름" style="ime-mode:active;" class="form-control mt-4 mb-2" placeholder="이름을 입력해주세요." readonly />
			<input type="text" name="bbsEmail" id="bbsEmail" maxlength="30" value="text.sist.co.kr"  style="ime-mode:inactive;" class="form-control mb-2" placeholder="이메일을 입력해주세요." readonly />
			<input type="text" name="bbsTitle" id="bbsTitle" maxlength="100" style="ime-mode:active;" value="제목" class="form-control mb-2" placeholder="제목을 입력해주세요." required />
			<div class="form-group">
				<textarea class="form-control" rows="10" name="bbsContent" id="bbsContent" style="ime-mode:active;" placeholder="내용을 입력해주세요" required>내용</textarea>
			</div>
			<input type="hidden" name="bbsSeq" value=">" />
			<input type="hidden" name="searchType" value="" />
			<input type="hidden" name="searchValue" value="" />
			<input type="hidden" name="curPage" value="" />
		</form>
		
		<div class="form-group">
			<div class="col-sm-12">
				<button type="button" id="btnUpdate" class="btn-3" title="수정">수정</button>
				<button type="button" id="btnList" class="btn-3" title="리스트">리스트</button>
			</div>
		</div>
	</div>
</div>





<form name="bbsForm" method="post">
	<input type="hidden" name="bbsSeq" value="" />
	<input type="hidden" name="searchType" value="" />
	<input type="hidden" name="searchValue" value="" />
	<input type="hidden" name="curPage" value="" />
</form>
</body>
</html>