<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/include/head.jsp"%>
<script>
	$(document).ready(function(){
		$("#btnWrite").on("click", function(){
			location.href="/write.jsp";
		});
	});
</script>

</head>
<body>
<%@include file="/include/navigation.jsp"%>

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
		<div class="flex">
			<div style="width:30%"><h2>게시판</h2></div>
			<div style="width:70%;" class="custom-select">
				<select name="_searchType" id="_searchType" class="searchType">
					<option value="">조회항목</option>
					
					<option value="1">작성자</option>
					
				</select>
				<input type="text" name="_searchValue" id="_searchValue" class="form-control search" value="" maxlength="20" placeholder="조회값을 입력하세요">
				<button type="button" id="btnSearch" class="btn-3 btn-search">조회</button>				
			</div>
		</div>
		
		<table style="margin-top:40px; margin-left:20px; width:90%">
			<thead>
				<tr>
					<td scope="col" class="text-center" style="width:10%">번호</td>
					<td scope="col" class="text-center" style="width:45%">제목</td>
					<td scope="col" class="text-center" style="width:10%">작성자</td>
					<td scope="col" class="text-center" style="width:25%">날짜</td>
					<td scope="col" class="text-center" style="width:10%">조회수</td>
				</tr>
			</thead>

		
		<tbody>
   
      	<tr>
			<td class="text-center">번호</td>
			<td><a href="javascript:void(0)" onclick="fn_view()">제목</a></td>
			<td class="text-center">작성자</td>
			<td class="text-center">등록일</td>
			<td class="text-center">조회수</td>
		</tr>	

		</tbody>
		<tfoot>
		<tr>
			<td colspan="5"></td>
        </tr>
      </tfoot>
	</table>
	
	<nav>
      <ul class="pagination justify-content-center">

         <!-- li class="page-item"><a class="page-link" href="">처음</a></li -->         
         <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_list(1)">이전블럭</a></li>
         
   
         <li class="page-item active"><a class="page-link" href="javascript:void(0)" onclick="fn_list(1)">1</a></li>

         <li class="page-item"><a class="page-link" href="javascript:void(0)" style="cursor:default;">1</a></li>

         <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_list()">다음블럭</a></li>

      </ul>
   </nav>
	   <button type="button" id="btnWrite" class="btn-3">글쓰기</button>
	
	</div>
</div>



</body>
</html>