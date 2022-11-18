package com.temlog.post;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.temlog.image.bo.ImageBO;
import com.temlog.image.model.Image;
import com.temlog.post.bo.PostBO;
import com.temlog.post.model.Post;

@RestController
public class PostRestController {

	@Autowired
	private PostBO postBO;
	
	@Autowired
	private ImageBO imageBO;
	
	@PostMapping("/post/create")
	public Map<String, Object> create(
			@RequestParam("categoryId") int categoryId,
			@RequestParam("subject") String subject,
			@RequestParam("content") String content,
			@RequestParam("rating") String rating,
			@RequestParam(value="purchaseNumber", required=false) Integer purchaseNumber,
			@RequestParam(value="purchaseDate", required=false) @DateTimeFormat(pattern="yyyy-MM-dd") Date purchaseDate,
			@RequestParam(value="file", required=false) List<MultipartFile> file,
			@RequestParam(value="location", required=false) String location,
			HttpSession session) {
		
		String userLoginId = (String)session.getAttribute("userLoginId");
		Integer userId = (Integer)session.getAttribute("userId");
		
		Map<String, Object> result = new HashMap<>();
		
		//List<Post> post = postBO.getPostList();
		// insert post
		//int postrow = postBO.addPost(post, userId, userLoginId, categoryId, subject, content, rating, purchaseNumber, purchaseDate, location);
		
		// useGeneratedKeys 이용해서 생성한 post id 불러오기
		//int postId = 0;
		//for (int i = 0; i < post.size(); i++) {			
		//	postId = post.get(i).getId();
		//}
		
		// insert image
		//List<Image> imageList = imageBO.getImageList();
		//int imagerow = imageBO.addImage(userLoginId, postId, userId, file, imageList);
		
		//int row = postrow + imagerow;
		
		Post post = new Post();
		post.setUserId(userId);
		post.setCategoryId(categoryId);
		post.setSubject(subject);
		post.setContent(content);
		post.setRating(rating);
		post.setPurchaseNumber(purchaseNumber);
		post.setPurchaseDate(purchaseDate);
		post.setLocation(location);
		int row = postBO.addPost(post);
		
		int postId = post.getId();
		Image image = new Image();
		image.setPostId(post.getId());
		image.setUserId(userId);
		int imagerow = imageBO.addImage(userLoginId, file, image);
		
		if (row > 0) {
			result.put("code", 100);
			result.put("result", "success");
		} else {
			result.put("code", 400);
			result.put("errorMessage", "글쓰기에 실패했습니다. 관리자에게 문의해주세요.");
		}
		
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
			@RequestParam(value="file", required=false) MultipartFile file,
			@RequestParam(value="location", required=false) String location,
			HttpSession session) {
		
		String userLoginId = (String)session.getAttribute("userLoginId");
		Integer userId = (Integer)session.getAttribute("userId");
		
		Map<String, Object> result = new HashMap<>();
		// insert
		int row = postBO.updatePost(postId, userId, userLoginId, categoryId, subject, content, rating, purchaseNumber, purchaseDate, file, location);
		if (row > 0) {
			result.put("code", 100);
			result.put("result", "success");
		} else {
			result.put("code", 400);
			result.put("errorMessage", "글 수정에 실패했습니다. 관리자에게 문의해주세요.");
		}
		
		return result;
	}
	
	@DeleteMapping("/post/delete")
	public Map<String, Object> delete(
			@RequestParam("postId") int postId) {
		
		Map<String, Object> result = new HashMap<>();
		// delete
		int row = postBO.deletePost(postId);
		if (row > 0) {
			result.put("code", 100);
			result.put("result", "success");
		} else {
			result.put("code", 400);
			result.put("errorMessage", "글 삭제에 실패했습니다. 관리자에게 문의해주세요.");
		}
		
		return result;
	}
}
