package com.temlog.post;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.temlog.post.bo.PostBO;

@RestController
public class PostRestController {

	@Autowired
	private PostBO postBO;
	
	@RequestMapping("/post/create")
	public Map<String, Object> create(
			@RequestParam("categoryId") int categoryId,
			@RequestParam("subject") String subject,
			@RequestParam("content") String content,
			@RequestParam("rating") String rating,
			@RequestParam(value="purchaseNumber", required=false) Integer purchaseNumber,
			@RequestParam(value="purchaseDate", required=false) @DateTimeFormat(pattern="yyyy-MM-dd") Date purchaseDate,
			@RequestParam(value="file", required=false) MultipartFile file,
			@RequestParam(value="location", required=false) String location,
			HttpSession session) {
		
		String userLoginId = (String)session.getAttribute("userLoginId");
		Integer userId = (Integer)session.getAttribute("userId");
		
		Map<String, Object> result = new HashMap<>();
		// insert
		int row = postBO.addPost(userId, userLoginId, categoryId, subject, content, rating, purchaseNumber, purchaseDate, file, location);
		if (row > 0) {
			result.put("code", 100);
			result.put("result", "success");
		} else {
			result.put("code", 400);
			result.put("errorMessage", "글쓰기에 실패했습니다. 관리자에게 문의해주세요.");
		}
		
		return result;
	}
	
}
