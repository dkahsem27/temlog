package com.temlog.post.bo;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.temlog.common.FileManagerService;
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
	
	@Autowired
	private FileManagerService fileManagerService;
	
	public int addPost(int userId, String userLoginId, 
			int categoryId, String subject, 
			String content, String rating, 
			Integer purchaseNumber, Date purchaseDate, 
			MultipartFile file, String location) {
		
		String imagePath = null;
		if (file != null) {
			// 파일이 있을 때만 업로드
			imagePath = fileManagerService.saveFile(userLoginId, file);
		}
		
		return postDAO.insertPost(userId, categoryId, subject, content, rating, purchaseNumber, purchaseDate, imagePath, location);
	}
	
	public int updatePost(int postId,
			int userId, String userLoginId, 
			int categoryId, String subject, 
			String content, String rating, 
			Integer purchaseNumber, Date purchaseDate, 
			MultipartFile file, String location) {
		
		// 기존 글과 이미지를 가지고 온다.(post 존재 유무 확인, 이미지가 교체될 때 기존 이미지를 제거하기 위해)
		Post post = getPostByPostId(postId);
		Image image = imageBO.getImageByPostId(postId);
		
		if (post == null) { // 수정할 글이 존재하지 않는 경우
			log.warn("[update post] 수정할 글이 존재하지 않습니다. postId:{} userId:{}", postId, userId);
			return 0;
		}
		
		// file이 있으면 이미지 수정 => 업로드 (실패시 기존 이미지는 그대로 둔다) => 성공시 기존이미지 제거
		String imagePath = null;
		if (file != null) {
			// 파일이 있을 때만 업로드
			imagePath = fileManagerService.saveFile(userLoginId, file);
			
			// 업로드 성공하면 기존 이미지 제거
			if (imagePath != null && image.getImagePath() != null) { // 기존 이미지 있는 경우
				// 업로드가 실패할 수 있으므로 업로드가 된 후 제거
				fileManagerService.deleteFile(image.getImagePath());
			}
		}
		
		// update => imagePath가 없으면 mybatis에서 업데이트 하지 않도록 처리
		return postDAO.updatePost(postId, userId, categoryId, subject, content, rating, purchaseNumber, purchaseDate, imagePath, location);
	}
	
	public int deletePost(int postId) {
		
		// 기존 글과 이미지 가져오기
		Post post = getPostByPostId(postId);
		Image image = imageBO.getImageByPostId(postId);
		if (post == null) { // 포스트가 없는 경우
			log.warn("[delete post] 삭제할 글이 존재하지 않습니다. postId:{}", postId);
			return 0;
		}
		
		// 업로드 되었던 이미지패스가 존재하면 이미지 삭제
		/*
		 * if (image.getImagePath() != null) {
		 * fileManagerService.deleteFile(image.getImagePath()); }
		 */
		
		return postDAO.deletePost(postId);
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
}
