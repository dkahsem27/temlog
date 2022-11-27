package com.temlog.post.bo;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;
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
		Post post = getPostByPostId(postId);
		if (post == null) { // 수정할 글이 존재하지 않는 경우
			log.warn("[update post] 수정할 글이 존재하지 않습니다. postId:{} userId:{}", postId, userId);
			//return 0;
		}
		
		// update image -> 이미지 모두 삭제 후 새로 DB에 저장
		List<Image> imageList = imageBO.getImageListByPostId(postId);
		// 이미지가 존재할 때 이미지 삭제
		if (ObjectUtils.isEmpty(imageList) == false) {
			for (int i = 0; i < imageList.size(); i++) {
				int imageId = imageList.get(i).getId();
					 
					// 기존 이미지가 1개일 때
					// 기존 이미지가 1개이고 기존 이미지를 삭제하고 새로 추가할 때 => 
					// 기존 이미지가 2개일 때 =>
//					if (imageList.size() > 2) { // 3
//						imageBO.deleteImage(imageId, postId); 
//					}
					
					// or 프론트단에서 삭제버튼 누르면 전부 삭제된다는 alert 띄우고 삭제 후 새로 추가하는 방법 (imageId 필요 없음)
					// 문제 -> 이미지 건드리지 않고 저장해도 이미지가 다 삭제되어버림
					imageBO.deleteImageByPostId(postId);
			}
		}
		imageBO.addImage(postId, userId, userLoginId, fileList);
		
		
		// update post
		postDAO.updatePost(postId, userId, categoryId, subject, content, rating, purchaseNumber, purchaseDate, location);
		
		
		
		
		// update image
		//Image image = imageBO.getImageByPostId(postId);
		//int imageId = image.getId();
		//imageBO.updateImage(imageId, postId, userId, userLoginId, fileList);
		
		/*
		 * List<Image> imageList = imageBO.getImageListByPostId(postId); for (int i = 0;
		 * i < imageList.size(); i++) { int imageId = imageList.get(i).getId(); if
		 * (ObjectUtils.isEmpty(imageList) == false) { imageBO.updateImage(imageId,
		 * postId, userId, userLoginId, fileList); } }
		 */
		
		/*
		 * if (ObjectUtils.isEmpty(imageList)) { // 기존 이미지가 존재하지 않을 경우 -> insert image
		 * imageBO.addImage(postId, userId, userLoginId, fileList); } else { // 이미지가 존재할
		 * 경우 -> update image for (int i = 0; i < imageList.size(); i++) { int imageId =
		 * imageList.get(i).getId(); if (ObjectUtils.isEmpty(imageList) == false) {
		 * imageBO.updateImage(imageId, postId, userId, userLoginId, fileList); } } }
		 */
	}
	
	public void deletePost(int postId) {
		
		// 기존 글과 이미지 가져오기
		Post post = getPostByPostId(postId);
		if (post == null) { // 포스트가 없는 경우
			log.warn("[delete post] 삭제할 글이 존재하지 않습니다. postId:{}", postId);
			//return 0;
		}
		
		// delete image
		List<Image> imageList = imageBO.getImageListByPostId(postId);
		for (int i = 0; i < imageList.size(); i++) {
			int imageId = imageList.get(i).getId();
			if (ObjectUtils.isEmpty(imageList) == false) {			
				imageBO.deleteImage(imageId, postId);
			}
		}
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
	
	public List<Post> getPostList(String keyword) {
		if (keyword != null) {	
			return getPostListByKeyword(keyword);
		} else {
			return postDAO.selectPostList();
		}
	}
	
	public Post getPost() {
		return postDAO.selectPost();
	}
	
	public List<Post> getPostListByCategoryId(int categoryId) {
		return postDAO.selectPostListByCategoryId(categoryId);
	}
	
	public List<Post> getPostListByCategoryId(int categoryId, String keyword) {
		if (keyword != null) {
			return getPostListByCategoryIdAndKeyword(categoryId, keyword);
		} else {
			return postDAO.selectPostListByCategoryId(categoryId);
		}
	}
	
	public List<Post> getPostListByKeyword(String keyword) {
		return postDAO.selectPostListByKeyword(keyword);
	}
	
	public List<Post> getPostListByCategoryIdAndKeyword(int categoryId, String keyword) {
		return postDAO.selectPostListByCategoryIdAndKeyword(categoryId, keyword);
	}
}
