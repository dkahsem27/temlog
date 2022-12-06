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
	
	public boolean existCategoryName(int userId, String categoryName) {
		return categoryDAO.existCategoryName(userId, categoryName);
	}
	
	public int addCategory(int userId, String categoryName) {
		return categoryDAO.insertCategory(userId, categoryName);
	}
	
	public int updateCategoryByCategoryId(int categoryId, String categoryName) {
		return categoryDAO.updateCategoryByCategoryId(categoryId, categoryName);
	}
	
	public int deleteCategoryByCategoryId(int categoryId) {
		return categoryDAO.deleteCategoryByCategoryId(categoryId);
	}
	
	public List<Category> getCategoryList(int userId) {
		return categoryDAO.selectCategoryList(userId);
	}
	
	public Category getCategoryByCategoryId(int categoryId, int userId) {
		return categoryDAO.selectCategoryByCategoryId(categoryId, userId);
	}
	
	public Category getCategory() {
		return categoryDAO.selectCategory();
	}
	
}
