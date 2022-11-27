package com.temlog.post;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.temlog.post.bo.PostBO;
import com.temlog.post.model.Post;

@RestController
public class PostRestController {

	@Autowired
	private PostBO postBO;
	
	@PostMapping("/post/create")
	public Map<String, Object> create(
			@RequestParam("categoryId") int categoryId,
			@RequestParam("subject") String subject,
			@RequestParam("content") String content,
			@RequestParam("rating") String rating,
			@RequestParam(value="purchaseNumber", required=false) Integer purchaseNumber,
			@RequestParam(value="purchaseDate", required=false) @DateTimeFormat(pattern="yyyy-MM-dd") Date purchaseDate,
			@RequestParam(value="file", required=false) List<MultipartFile> fileList,
			@RequestParam(value="location", required=false) String location,
			HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		String userLoginId = (String)session.getAttribute("userLoginId");
		
		Map<String, Object> result = new HashMap<>();
		
		// insert post
		postBO.addPost(userId, userLoginId, categoryId, subject, content, rating, purchaseNumber, purchaseDate, location, fileList);
		
		result.put("code", 100);
		result.put("result", "success");
		result.put("errorMessage", "글쓰기에 실패했습니다. 관리자에게 문의해주세요.");
		
		return result;
	}
	
	@PutMapping("/post/update")
	public Map<String, Object> update(
			@RequestParam("postId") int postId,
			@RequestParam("categoryId") int categoryId,
			@RequestParam("subject") String subject,
			@RequestParam("content") String content,
			@RequestParam("rating") String rating,
			@RequestParam(value="purchaseNumber", required=false) Integer purchaseNumber,
			@RequestParam(value="purchaseDate", required=false) @DateTimeFormat(pattern="yyyy-MM-dd") Date purchaseDate,
			@RequestParam(value="file", required=false) List<MultipartFile> fileList,
			@RequestParam(value="location", required=false) String location,
			HttpSession session) {
		
		String userLoginId = (String)session.getAttribute("userLoginId");
		Integer userId = (Integer)session.getAttribute("userId");
		
		Map<String, Object> result = new HashMap<>();
		
		// update post
		postBO.updatePost(postId, userId, userLoginId, categoryId, subject, content, rating, purchaseNumber, purchaseDate, location, fileList);
		
		result.put("code", 100);
		result.put("result", "success");
		result.put("errorMessage", "글 수정에 실패했습니다. 관리자에게 문의해주세요.");
		
		return result;
	}
	
	@DeleteMapping("/post/delete")
	public Map<String, Object> delete(
			@RequestParam("postId") int postId) {
		
		Map<String, Object> result = new HashMap<>();
		
		// delete post
		postBO.deletePost(postId);
		
		result.put("code", 100);
		result.put("result", "success");
		result.put("errorMessage", "글 삭제에 실패했습니다. 관리자에게 문의해주세요.");
		
		return result;
	}
	
//	@GetMapping("/post/search")
//	public Map<String, Object> search(
//			@RequestParam("keyword") String keyword) {
//		Map<String, Object> result = new HashMap<>();
//		
//		// search
//		postBO.getPostListByKeyword(keyword);
//		
//		result.put("code", 100);
//		result.put("result", "success");
//		result.put("errorMessage", "검색에 실패했습니다. 관리자에게 문의해주세요.");
//		
//		return result;
//	}
	
}
