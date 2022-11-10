package com.temlog.category;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CategoryController {

	@RequestMapping("/category/category_list_view")
	public String categoryListView(Model model) {
		model.addAttribute("viewName", "category/categoryList");
		return "template/layout";
	}
	
	@RequestMapping("/category/category_update_view")
	public String categoryUpdateView(Model model) {
		model.addAttribute("viewName", "category/categoryUpdate");
		return "template/layout";
	}
	
	@RequestMapping("/category/category_delete_view")
	public String categoryDeleteView(Model model) {
		model.addAttribute("viewName", "category/categoryDelete");
		return "template/layout";
	}
}
