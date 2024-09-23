<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader("Expires",(long)0);
	if(request.getProtocol().equals("HTTP/1.1"));
	{
		response.setHeader("Cache-Control", "no-cache");
	}
%>

<meta charset="UTF-8">
<title>미니프로젝트</title>
<link rel="stylesheet" href="/resources/css/mp.css" type="text/css">
<script type="text/javascript" src="/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/resources/js/icia.common.js"></script>