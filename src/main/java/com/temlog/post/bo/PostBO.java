package com.temlog.post.bo;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.temlog.image.bo.ImageBO;
import com.temlog.post.dao.PostDAO;
import com.temlog.post.model.Post;

@Service
public class PostBO {
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private ImageBO imageBO;
	
	public void addPost(int userId, String userLoginId, int categoryId, 
			String subject, String content, String rating, 
			Integer purchaseNumber, Date purchaseDate, String location, 
			List<MultipartFile> fileList) {
		
		Post post = new Post();
		// insert post
		post.setUserId(userId);
		post.setCategoryId(categoryId);
		post.setSubject(subject);
		post.setContent(content);
		post.setRating(rating);
		post.setPurchaseNumber(purchaseNumber);
		post.setPurchaseDate(purchaseDate);
		post.setLocation(location);
		postDAO.insertPost(post);
		
		// 생성된 postId 가져오기
		int postId = post.getId();
		
		// insert image
		imageBO.addImage(postId, userId, userLoginId, fileList);
	}
	
	public void updatePost(int postId, 
			int userId, String userLoginId, int categoryId, 
			String subject, String content, String rating, 
			Integer purchaseNumber, Date purchaseDate, String location, 
			List<MultipartFile> fileList) {

		// 기존 글과 이미지를 가지고 온다.(post 존재 유무 확인, 이미지가 교체될 때 기존 이미지를 제거하기 위해)
		Post post = getPostByPostId(postId, userId);
		if (post == null) { // 수정할 글이 존재하지 않는 경우
			log.warn("[update post] 수정할 글이 존재하지 않습니다. postId:{} userId:{}", postId, userId);
			//return 0;
		}
		
		// input[file]에서 추가된 새로운 이미지 insert
		imageBO.addImage(postId, userId, userLoginId, fileList);
		
		// update post
		postDAO.updatePost(postId, userId, categoryId, subject, content, rating, purchaseNumber, purchaseDate, location);
		
	}
	
	public void deletePost(int postId, int userId) {
		
		// 기존 글과 이미지 가져오기
		Post post = getPostByPostId(postId, userId);
		if (post == null) { // 포스트가 없는 경우
			log.warn("[delete post] 삭제할 글이 존재하지 않습니다. postId:{}", postId);
			//return 0;
		}
		
		// delete image
		imageBO.deleteImageByPostId(postId);
		
		// delete post
		postDAO.deletePost(postId);
	}

	public Post getPost(int userId) {
		return postDAO.selectPost(userId);
	}
	
	public Post getPostByPostId(int postId, int userId) {
		return postDAO.selectPostByPostId(postId, userId);
	}
	public Post getPostByPostIdAndUserId(int postId, int userId) {
		return postDAO.selectPostByPostIdAndUserId(postId, userId);
	}
	
	public List<Post> getPostList(int userId) {
		return postDAO.selectPostList(userId);
	}
	
	public List<Post> getPostListByCategoryId(int userId, int categoryId) {
		return postDAO.selectPostListByCategoryId(userId, categoryId);
	}
	
	public List<Post> getPostList(int userId, String keyword, String rating, String sort) {
		
		if (keyword != null) {	
			return postDAO.selectPostListByKeyword(userId, keyword);
		} else if (rating != null) {
			return postDAO.selectPostListByRating(userId, rating);
		}
		
		if (sort != null) {
			if (sort.equals("등록일")) {
				return postDAO.selectPostListByCreatedAt(userId);
			} else if (sort.equals("구매일")) {
				return postDAO.selectPostListByPurchaseDate(userId);
			} else if (sort.equals("구매횟수")) {
				return postDAO.selectPostListByPurchaseNumber(userId);
			} 
		}
		
		return postDAO.selectPostList(userId);
	}
	
	public List<Post> getPostListByCategoryId(int userId, int categoryId, String keyword, String rating, String sort) {
		
		if (keyword != null) {
			return postDAO.selectPostListByCategoryIdAndKeyword(userId, categoryId, keyword);
		} else if (rating != null) {
			return postDAO.selectPostListByCategoryIdAndRating(userId, categoryId, rating);
		}
		
		if (sort != null) {
			if (sort.equals("등록일")) {
				return postDAO.selectPostListByCategoryIdAndCreatedAt(userId, categoryId);
			} else if (sort.equals("구매일")) {
				return postDAO.selectPostListByCategoryIdAndPurchaseDate(userId, categoryId);
			} else if (sort.equals("구매횟수")) {
				return postDAO.selectPostListByCategoryIdAndPurchaseNumber(userId, categoryId);
			}
		}
		
		return postDAO.selectPostListByCategoryId(userId, categoryId);
	}
}
