package com.temlog.post.bo;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.temlog.image.bo.ImageBO;
import com.temlog.image.model.Image;
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
		Post post = getPostByPostId(postId);
		if (post == null) { // 수정할 글이 존재하지 않는 경우
			log.warn("[update post] 수정할 글이 존재하지 않습니다. postId:{} userId:{}", postId, userId);
			//return 0;
		}
		
		// update post
		postDAO.updatePost(postId, userId, categoryId, subject, content, rating, purchaseNumber, purchaseDate, location);
		
		Image image = imageBO.getImageByPostId(postId);
		int imageId = image.getId();
		// update image
		imageBO.updateImage(imageId, postId, userId, userLoginId, fileList);
	}
	
	public void deletePost(int postId) {
		
		// 기존 글과 이미지 가져오기
		Post post = getPostByPostId(postId);
		if (post == null) { // 포스트가 없는 경우
			log.warn("[delete post] 삭제할 글이 존재하지 않습니다. postId:{}", postId);
			//return 0;
		}
		
		// delete image
		imageBO.deleteImage(postId);
		// delete post
		postDAO.deletePost(postId);
	}
	
	public Post getPostByPostId(int postId) {
		return postDAO.selectPostByPostId(postId);
	}
	public Post getPostByPostIdAndUserId(int postId, int userId) {
		return postDAO.selectPostByPostIdAndUserId(postId, userId);
	}
	
	public List<Post> getPostList() {
		return postDAO.selectPostList();
	}
	
	public Post getPost() {
		return postDAO.selectPost();
	}
	
	public Post getPostListByKeyword(String keyword) {
		return postDAO.selectPostListByKeyword(keyword);
	}
}
