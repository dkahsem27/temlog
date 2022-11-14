package com.temlog.category.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.temlog.category.dao.CategoryDAO;
import com.temlog.category.model.Category;

@Service
public class CategoryBO {

	@Autowired
	private CategoryDAO categoryDAO;
	
	public boolean existCategoryName(String categoryName) {
		return categoryDAO.existCategoryName(categoryName);
	}
	
	public int addCategory(String categoryName) {
		return categoryDAO.insertCategory(categoryName);
	}
	
	public int updateCategoryByCategoryId(int categoryId, String categoryName) {
		return categoryDAO.updateCategoryByCategoryId(categoryId, categoryName);
	}
	
	public int deleteCategoryByCategoryId(int categoryId) {
		return categoryDAO.deleteCategoryByCategoryId(categoryId);
	}
	
	public List<Category> getCategoryList() {
		return categoryDAO.selectCategoryList();
	}
}
