package com.temlog.category.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.temlog.category.model.Category;

@Repository
public interface CategoryDAO {

	public boolean existCategoryName(String categoryName);
	
	public int insertCategory(String categoryName);
	
	public int updateCategoryByCategoryId(
			@Param("categoryId") int categoryId, 
			@Param("categoryName") String categoryName);
	
	public int deleteCategoryByCategoryId(int categoryId);
	
	public List<Category> selectCategoryList();
	
	public Category selectCategoryByCategoryId(int categoryId);
	
}
