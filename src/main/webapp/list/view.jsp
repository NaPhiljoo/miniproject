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
		<h2>게시물 보기</h2>
		</div>

		<div class="row" style="margin-top:40px; margin-left:20px;">
			<table class="table">
				<thead>
					<tr class="table-active">
						<th scope="col" style="width:60%">
							제목<br/>
							이름&nbsp;&nbsp;&nbsp;
							<a href="mailto:" style="color:#828282;">이메일</a>
								
						</th>
						<th scope="col" style="width:40%" class="text-right">
							조회 : 조회수<br/> 
							날짜
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="2" style="padding-top:10px;"><pre>내용dy</pre></td>
					</tr>
				</tbody>
				<tfoot>
				<tr>
		            <td colspan="2"></td>
		        </tr>
				</tfoot>
			</table>
		</div>
		
		<button type="button" id="btnList" class="btn-3">리스트</button>
	
	
		<button type="button" id="btnUpdate" class="btn-3">수정</button>
		<button type="button" id="btnDelete" class="btn-3">삭제</button>
	
		<br/>
		<br/>
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