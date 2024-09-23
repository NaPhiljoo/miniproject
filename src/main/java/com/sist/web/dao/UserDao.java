package com.sist.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.sist.web.db.DBManager;
import com.sist.web.model.User;

public class UserDao 
{
	private static Logger logger =  LogManager.getLogger(UserDao.class);
	
	public User userSelect(String userId)
	{
		User user = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sql = new StringBuilder();
		
		sql.append(" SELECT USER_ID, ");
		sql.append("        USER_PW, ");
		sql.append("        USER_NAME, ");
		sql.append("        USER_TEL, ");
		sql.append("        USER_BIRTHDATE, ");
		sql.append("        USER_EMAIL, ");
		sql.append("        USER_GENDER, ");
		sql.append("        USER_STATUS, ");
		sql.append("        USER_CREATE_DATE "); 	
		sql.append("   FROM TR_USER ");
		sql.append("  WHERE USER_ID = ? ");
		
		
		try
		{
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				user = new User();

				user.setUserId(rs.getString("USER_ID"));
				user.setUserPw(rs.getString("USER_PW"));
				user.setUserName(rs.getString("USER_NAME"));
				user.setUserTel(rs.getString("USER_TEL"));
				user.setUserBirthdate(rs.getString("USER_BIRTHDATE"));
				user.setUserEmail(rs.getString("USER_EMAIL"));
				user.setUserGender(rs.getString("USER_GENDER"));
				user.setUserStatus(rs.getString("USER_STATUS"));
				user.setUserCreateDate(rs.getString("USER_CREATE_DATE"));
			}
		}
		catch(Exception e)
		{
			logger.error("[UserDao]userSelect SQLException", e);
			
		}
		finally
		{
			DBManager.close(rs, pstmt, conn);
		}
		return user;
	}
	
	public int userInsert(User user)
	{
		int count = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		StringBuilder sql = new StringBuilder();
		
		sql.append(" INSERT INTO TR_USER ");
		sql.append(" VALUES(?, ?, ?, ?, ?, ?, ?, ?, SYSDATE) ");
		
		
		try
		{
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			
			int idx = 0;
			pstmt.setString(++idx, user.getUserId());
			pstmt.setString(++idx, user.getUserPw());
			pstmt.setString(++idx, user.getUserName());
			pstmt.setString(++idx, user.getUserTel());
			pstmt.setString(++idx, user.getUserBirthdate());
			pstmt.setString(++idx, user.getUserEmial());
			pstmt.setString(++idx, user.getUserGender());
			pstmt.setString(++idx, user.getUserStatus());
			
			count = pstmt.executeUpdate();
		}
	
		catch(Exception e)
		{
			logger.error("[UserInsert]SQLEXemption)",e);
		}
		finally
		{
			DBManager.close(pstmt, conn);
		}
		
		return count;
	}
	
	public int userCheck(String userId)
	{
		int count = 0;
		
		Connection conn = null;
		PreparedStatement pstmt =null;
		StringBuilder sql = new StringBuilder();
		
		sql.append(" SELECT USER_ID ");
		sql.append("   FROM TR_USER ");
		sql.append("  WHERE USER_ID LIKE ? ");
		
		try
		{
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setString(1, userId);
			
			count = pstmt.executeUpdate();
		}
		catch(Exception e)
		{
			logger.error("[UserCheck]SQLException",e);
		}
		finally
		{
			DBManager.close(pstmt, conn);
		}
		return count;
	}
	public int userUpdate(User user)
	{
		int count = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		StringBuilder sql = new StringBuilder();
			
		sql.append("UPDATE TR_USER ");
		sql.append("   SET USER_PW = ?, ");
		sql.append("       USER_NAME = ?, ");
		sql.append("       USER_TEL = ?, ");
		sql.append("       USER_BIRTHDATE = ?, ");
		sql.append("       USER_EMAIL = ?, ");
		sql.append("       USER_GENDER = ? ");
		sql.append(" WHERE USER_ID = ? ");
		
		try
		{
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			
			int idx = 0;
			pstmt.setString(++idx, user.getUserPw());
			pstmt.setString(++idx, user.getUserName());
			pstmt.setString(++idx, user.getUserTel());
			pstmt.setString(++idx, user.getUserBirthdate());
			pstmt.setString(++idx, user.getUserEmial());
			pstmt.setString(++idx, user.getUserGender());
			pstmt.setString(++idx, user.getUserId());
			logger.debug(sql);
			count = pstmt.executeUpdate();
		}
		catch(Exception e)
		{
			logger.error("[userUpdate]SQLException",e);
		}
		finally
		{
			DBManager.close(pstmt, conn);
		}
		
		return count;
	}
	
}
