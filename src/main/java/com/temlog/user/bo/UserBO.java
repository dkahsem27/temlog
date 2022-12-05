package com.temlog.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.temlog.user.dao.UserDAO;
import com.temlog.user.model.User;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	public User getUserByLoginIdAndPassword(String loginId, String password) {
		return userDAO.selectUserByLoginIdAndPassword(loginId, password);
	}
	
	public boolean existLoginId(String loginId) {
		return userDAO.existLoginId(loginId);
	}

	public int addUser(String loginId, String password) {
		return userDAO.insertUser(loginId, password);
	}
	
	public User getUserByUserId(int userId) {
		return userDAO.selectUserByUserId(userId);
	}
}
