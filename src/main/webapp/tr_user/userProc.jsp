<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "org.apache.logging.log4j.LogManager" %>
<%@ page import = "org.apache.logging.log4j.Logger" %>
<%@ page import = "com.sist.web.util.HttpUtil" %>
<%@ page import = "com.sist.common.util.StringUtil" %>
<%@ page import = "com.sist.web.dao.UserDao" %>
<%@ page import = "com.sist.web.model.User" %>
<%@ page import = "com.sist.web.util.CookieUtil" %>

<!DOCTYPE html>
<%
	//중복 검사랑 회원가입 확인
	Logger logger = LogManager.getLogger();
	HttpUtil.requestLogString(request, logger);
	
	String userId = HttpUtil.get(request, "userId");
	String userPwd = HttpUtil.get(request, "userPwd1");
	String userName = HttpUtil.get(request, "userName");
	String userBirth = HttpUtil.get(request, "userBirth");
	String userEmail = HttpUtil.get(request, "userEmail");
	String userTel = HttpUtil.get(request, "userTel");
	String userGender = HttpUtil.get(request, "userGender");
	
	String msg = null;
	String redirectUrl = null;
	
	User user = null;
	UserDao userDao = null;
	
	String cookieUserId = CookieUtil.getValue(request, "USER_ID");
	
	if( cookieUserId == null )
	{
		if(!StringUtil.isEmpty(userId) && !StringUtil.isEmpty(userPwd) && !StringUtil.isEmpty(userName)
				&& !StringUtil.isEmpty(userBirth) && !StringUtil.isEmpty(userEmail) && !StringUtil.isEmpty(userTel))
		{
			userDao = new UserDao();
			if(userDao.userCheck(userId) == 0)
			{
				user = new User();
				
				user.setUserId(userId);
				user.setUserPw(userPwd);
				user.setUserName(userName);
				user.setUserBirthdate(userBirth);
				user.setUserEmail(userEmail);
				user.setUserTel(userTel);
				user.setUserStatus("Y");
				user.setUserGender(userGender);
				
				if(userDao.userInsert(user) == 1)
				{
					msg = "회원가입에 성공하셨습니다.";
					redirectUrl = "/index.jsp";
				}
				else
				{
					msg = "회원가입이 정상적으로 처리되지 않았습니다.";
					redirectUrl = "/tr_user/userRegForm.jsp";
				}
			}
			else
			{
				msg = "중복 아이디가 존재합니다.";
				redirectUrl = "/tr_user/userRegForm.jsp";
			}
			
		}
		else
		{
			msg = "회원가입시 빈칸이 있으면 안됩니다.";
			redirectUrl = "/tr_user/userRegForm.jsp";
		}
	}
	else
	{
		userDao = new UserDao();
		user = userDao.userSelect(cookieUserId);
			
		if(user != null)
		{
			if(StringUtil.equals(user.getUserStatus(), "Y"))
			{
				if( !StringUtil.isEmpty(userPwd) && !StringUtil.isEmpty(userName) && !StringUtil.isEmpty(userBirth)
						&& !StringUtil.isEmpty(userEmail) && !StringUtil.isEmpty(userTel))
				{
					user.setUserPw(userPwd);
					user.setUserName(userName);
					user.setUserBirthdate(userBirth);
					user.setUserEmail(userEmail);
					user.setUserTel(userTel);
					user.setUserGender(userGender);
					
					if(userDao.userUpdate(user) > 0)
					{
						msg = "업데이트에 성공하셨습니다.";
						redirectUrl = "/index.jsp";
					}
					else
					{
						msg = "업데이트 중 오류가 발생하였습니다.";
						redirectUrl = "/tr_user/userUpdateForm.jsp";
					}
				}
				else
				{
					msg = "수정 사항에 빈칸이 있으면 안됩니다.";
					redirectUrl = "/tr_user/userUpdateForm.jsp";
				}
			}
			else
			{
				msg = "회원님의 계정은 정지 상태입니다.";
				redirectUrl = "/index.jsp";
				user = null;
				CookieUtil.deleteCookie(request, response, "/", "USER_ID");
			}
		}
		else
		{
			msg = "회원 정보가 존재 하지 않습니다.";
			redirectUrl = "/index.jsp";
			CookieUtil.deleteCookie(request, response, "/", "USER_ID");
		}
	}
%>
<html>
<head>

</head>
<body>
<script>
	alert("<%=msg%>");
	location.href = "<%=redirectUrl%>";
</script>
</body>
</html>