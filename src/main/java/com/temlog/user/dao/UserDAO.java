package com.temlog.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.temlog.user.model.User;

@Repository
public interface UserDAO {
	
	public User selectUserByLoginIdAndPassword(
			@Param("loginId") String loginId, 
			@Param("password") String password);
	
	public boolean existLoginId(String loginId);
	
	public boolean matchedPassword(String password);

	public int insertUser(
			@Param("loginId") String loginId, 
			@Param("password") String password);
	
	public User selectUserByUserId(int userId);
	
	public void updateUserPassword(
			@Param("userId") int userId, 
			@Param("password") String password);
	
	public int deleteUser(int userId);
}
