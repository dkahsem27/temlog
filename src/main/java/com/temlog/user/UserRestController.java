package com.temlog.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.temlog.common.EncryptUtils;
import com.temlog.user.bo.UserBO;
import com.temlog.user.model.User;

@RestController
public class UserRestController {

	@Autowired
	private UserBO userBO;
	
	@PostMapping("/user/sign_in")
	public Map<String, Object> signIn(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpSession session) {
		
		// password 해싱
		String encryptPassword = EncryptUtils.md5(password);
		User user = userBO.getUserByLoginIdAndPassword(loginId, encryptPassword);
		
		Map<String, Object> result = new HashMap<>();
		
		if (user != null) {
			// 로그인 성공
			result.put("code", 100);
			result.put("result", "success");
			
			// 세션에 유저 정보 담기 (로그인 상태 유지)
			session.setAttribute("userLoginId", user.getLoginId());
			session.setAttribute("userId", user.getId());
		} else {
			// 로그인 실패
			result.put("code", 400);
			result.put("errorMessage", "로그인에 실패했습니다. 존재하지 않는 사용자입니다.");
		}
		
		return result;
	}
	
	@RequestMapping("/user/is_duplicated_id")
	public Map<String, Object> isDuplicatedId(
			@RequestParam("loginId") String loginId) {
		
		Map<String, Object> result = new HashMap<>();
		
		boolean isDuplicated = userBO.existLoginId(loginId);
		if (isDuplicated) {
			result.put("code", 100);
			result.put("result", true);
		} else {
			result.put("code", 400);
			result.put("result", false);
		}
		
		return result;
	}
	
	@PostMapping("/user/sign_up")
	public Map<String, Object> signUp(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password) {
		
		// 암호화(해싱)
		String encryptPassword = EncryptUtils.md5(password);
		
		// insert
		int row = userBO.addUser(loginId, encryptPassword);
		
		Map<String, Object> result = new HashMap<>();
		if (row > 0) {
			result.put("code", 100);
			result.put("result", "success");
		} else {
			result.put("errorMessage", "회원가입에 실패했습니다. 관리자에게 문의해주세요.");
		}
		
		return result;
	}
}
