package com.temlog.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.temlog.post.bo.PostBO;
import com.temlog.post.model.Post;

@Controller
public class UserController {
	
	@Autowired
	private PostBO postBO;

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
	public String accountView(Model model) {
		model.addAttribute("viewName", "user/account");
		return "template/layout";
	}
}
