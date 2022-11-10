package com.temlog.post;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PostController {

	@RequestMapping("/post/post_list_view")
	public String postListView(Model model) {
		model.addAttribute("viewName", "post/postList");
		return "template/layout";
	}
	
	@RequestMapping("/post/post_create_view")
	public String postCreateView(Model model) {
		model.addAttribute("viewName", "post/postCreate");
		return "template/layout";
	}
	
	@RequestMapping("/post/post_update_view")
	public String postUpdateView(Model model) {
		model.addAttribute("viewName", "post/postUpdate");
		return "template/layout";
	}
	
	@RequestMapping("/post/post_detail_view")
	public String postDetailView(Model model) {
		model.addAttribute("viewName", "/post/postDetail");
		return "template/layout";
	}
	
}
