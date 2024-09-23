<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "org.apache.logging.log4j.LogManager" %>
<%@ page import = "org.apache.logging.log4j.Logger" %>
<%@ page import = "com.sist.common.util.StringUtil" %>
<%@ page import = "com.sist.web.dao.UserDao" %>
<%@ page import = "com.sist.web.util.HttpUtil" %>
<%
	//여기서 하려는게 아이디 중복 검사
	Logger logger = LogManager.getLogger("userIdCheckAjax.jsp");
	HttpUtil.requestLogString(request, logger);

	UserDao userDao = null;
	
	String userId = HttpUtil.get(request, "userId");
	
	if(!StringUtil.isEmpty(userId))
	{
		userDao = new UserDao();
		if(userDao.userCheck(userId) == 0)
		{
			response.getWriter().write("{\"flag\":0}");
		}
		else
		{
			response.getWriter().write("{\"flag\":1}");
		}
	}
	else
	{
		response.getWriter().write("{\"flag\":-1}");
	}
	
%>