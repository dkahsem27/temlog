package com.temlog.category;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.temlog.category.bo.CategoryBO;

@RestController
public class CategoryRestController {

	@Autowired
	private CategoryBO categoryBO;
	
	@RequestMapping("/category/is_duplicated_category")
	public Map<String, Object> isDuplicatedCategory(
			@RequestParam("categoryName") String categoryName) {
		
		Map<String, Object> result = new HashMap<>();
		
		boolean isDuplicated = categoryBO.existCategoryName(categoryName);
		if (isDuplicated) {
			result.put("code", 100);
			result.put("result", true);
		} else {
			result.put("code", 100);
			result.put("result", false);
		}
		
		return result;
	}
	
	@PostMapping("/category/create")
	public Map<String, Object> create(
			@RequestParam("categoryName") String categoryName) {
		
		// insert
		Map<String, Object> result = new HashMap<>();
		
		int row = categoryBO.addCategory(categoryName);
		if (row > 0) {
			result.put("code", 100);
			result.put("result", "success");
		} else {
			result.put("code", 400);
			result.put("errorMessage", "카테고리 저장에 실패했습니다. 관리자에게 문의해주세요.");
		}
		
		return result;
	}
	
	@PutMapping("/category/update")
	public Map<String, Object> update(
			@RequestParam("categoryId") int categoryId,
			@RequestParam("categoryName") String categoryName) {
		
		// update
		Map<String, Object> result = new HashMap<>();
		
		int row = categoryBO.updateCategoryByCategoryId(categoryId, categoryName);
		if (row > 0) {
			result.put("code", 100);
			result.put("result", "success");
		} else {
			result.put("code", 400);
			result.put("errorMessage", "카테고리 수정에 실패했습니다. 관리자에게 문의해주세요.");
		}
		
		return result;
	}
	
	@DeleteMapping("category/delete")
	public Map<String, Object> delete(
			@RequestParam("categoryId") int categoryId) {
		
		Map<String, Object> result = new HashMap<>();
		// delete
		int row = categoryBO.deleteCategoryByCategoryId(categoryId);
		if (row > 0) {
			result.put("code", 100);
			result.put("result", "success");
		} else {
			result.put("code", 400);
			result.put("errorMessage", "카테고리 삭제에 실패했습니다. 관리자에게 문의해주세요.");
		}
		
		return result;
	}
}
