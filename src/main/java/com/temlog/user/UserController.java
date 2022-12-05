package com.temlog.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.temlog.user.bo.UserBO;
import com.temlog.user.model.User;

@Controller
public class UserController {

	@Autowired UserBO userBO;
	
	@RequestMapping("/user/sign_in_view")
	public String signInView(Model model) {
		model.addAttribute("viewName", "user/signIn");
		return "template/layout";
	}
	
	@RequestMapping("/user/sign_up_view")
	public String signUpView(Model model) {
		model.addAttribute("viewName", "user/signUp");
		return "template/layout";
	}
	
	@RequestMapping("/user/sign_out")
	public String signOut(HttpSession session) {
		session.removeAttribute("userLoginId");
		session.removeAttribute("userId");
		return "redirect:/user/sign_in_view";
	}
	
	@RequestMapping("/main_view")
	public String mainView(Model model) {
		model.addAttribute("viewName", "user/main");
		return "template/layout";
	}
	
	@RequestMapping("/account_view")
	public String accountView(
			HttpSession session,
			Model model) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		User user = userBO.getUserByUserId(userId);
		model.addAttribute("user", user);
		
		model.addAttribute("viewName", "user/account");
		return "template/layout";
	}
}
