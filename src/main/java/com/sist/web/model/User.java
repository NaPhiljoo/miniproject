package com.sist.web.model;

import java.io.Serializable;

public class User implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private String userId;
	private String userPw;
	private String userName;
	private String userTel;
	private String userBirthdate;
	private String userEmail;
	private String userGender;
	private String userStatus;
	private String userCreateDate;
	  
	
	public User()
	{
		userId = "";
		userPw = "";
		userName = "";
		userTel = "";
		userBirthdate = "";
		userEmail = "";
		userGender = "";
		userStatus = "";
		userCreateDate = "";
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserTel() {
		return userTel;
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}
	public String getUserBirthdate() {
		return userBirthdate;
	}
	public void setUserBirthdate(String userBirthdate) {
		this.userBirthdate = userBirthdate;
	}
	public String getUserEmial() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}
	public String getUserCreateDate() {
		return userCreateDate;
	}
	public void setUserCreateDate(String userCreateDate) {
		this.userCreateDate = userCreateDate;
	}
	  
}
