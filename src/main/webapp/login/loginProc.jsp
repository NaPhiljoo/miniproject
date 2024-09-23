<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ page import ="org.apache.logging.log4j.LogManager"%>
<%@ page import ="org.apache.logging.log4j.Logger"%>
<%@ page import ="com.sist.web.dao.UserDao"%>
<%@ page import ="com.sist.web.model.User"%>
<%@ page import ="com.sist.common.util.StringUtil"%>
<%@ page import ="com.sist.web.util.CookieUtil"%>
<%@ page import ="com.sist.web.util.HttpUtil"%>

<!DOCTYPE html>
<%
	Logger logger = LogManager.getLogger();
	String userId = HttpUtil.get(request, "userId");
	String userPw = HttpUtil.get(request, "userPwd");
	
	String redirectUrl ="";
	String msg = "";
	
	User user = null;
	UserDao userDao = new UserDao();
	logger.debug("userId : " + userId);
	logger.debug("userPw : " + userPw);
	
	if(!StringUtil.isEmpty(userId) && !StringUtil.isEmpty(userPw))
	{
		user = userDao.userSelect(userId);
		
		if(user != null)
		{
			if(StringUtil.equals(userPw, user.getUserPw()))
			{
				CookieUtil.addCookie(response,"/", "USER_ID", userId);
				msg = "로그인 성공";
				
				redirectUrl = "/index.jsp";
			}
			else
			{
				msg = "비밀번호가 일치하지 않습니다.";
				redirectUrl = "/login/loginForm.jsp";
			}
		}
		else
		{
			msg = "등록된 정보가 없습니다.";
			redirectUrl = "/login/loginForm.jsp";
		}
	}
	else
	{
		msg = "아이디나 비밀번호가 입력되지 않았습니다.";
		redirectUrl = "/login/loginForm.jsp";
	}
%>
<html>
<title>Insert title here</title>
</head>
<body>
<script>
	alert("<%=msg%>");
	location.href = "<%=redirectUrl%>";	
</script>
</body>
</html>