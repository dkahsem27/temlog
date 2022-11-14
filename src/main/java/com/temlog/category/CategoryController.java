package com.temlog.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.temlog.category.bo.CategoryBO;
import com.temlog.category.model.Category;

@Controller
public class CategoryController {

	@Autowired
	private CategoryBO categoryBO;
	
	@RequestMapping("/category/category_list_view")
	public String categoryListView(Model model) {
		
		List<Category> categoryList = categoryBO.getCategoryList();
		model.addAttribute("categoryList", categoryList);
		
		model.addAttribute("viewName", "category/categoryList");
		return "template/layout";
	}
	
	@RequestMapping("/category/category_update_view")
	public String categoryUpdateView(Model model) {
		
		List<Category> categoryList = categoryBO.getCategoryList();
		model.addAttribute("categoryList", categoryList);
		
		model.addAttribute("viewName", "category/categoryUpdate");
		return "template/layout";
	}
	
	@RequestMapping("/category/category_delete_view")
	public String categoryDeleteView(Model model) {

		List<Category> categoryList = categoryBO.getCategoryList();
		model.addAttribute("categoryList", categoryList);
		//Category category = categoryBO.getCategoryByCategoryId(categoryId);
		//model.addAttribute("categoryId", categoryList.getId());
		
		model.addAttribute("viewName", "category/categoryDelete");
		return "template/layout";
	}
}
