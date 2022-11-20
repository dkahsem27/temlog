package com.temlog.post.bo;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.temlog.post.dao.PostDAO;
import com.temlog.post.model.Post;

@Service
public class PostBO {
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private PostDAO postDAO;
	
	//public int addPost(List<Post> post,
	//		int userId, String userLoginId, 
	//		int categoryId, String subject, 
	//		String content, String rating, 
	//		Integer purchaseNumber, Date purchaseDate, 
	//		String location) {
	//	
	//	return postDAO.insertPost(post, userId, categoryId, subject, content, rating, purchaseNumber, purchaseDate, location);
	//}
	
	public int addPost(Post post) {
		return postDAO.insertPost(post);
	}
	
	public int updatePost(int postId, int userId, 
			int categoryId, String subject, 
			String content, String rating, 
			Integer purchaseNumber, Date purchaseDate, 
			String location) {
		
		// 기존 글과 이미지를 가지고 온다.(post 존재 유무 확인, 이미지가 교체될 때 기존 이미지를 제거하기 위해)
		Post post = getPostByPostId(postId);
		
		if (post == null) { // 수정할 글이 존재하지 않는 경우
			log.warn("[update post] 수정할 글이 존재하지 않습니다. postId:{} userId:{}", postId, userId);
			return 0;
		}
		
		// update
		return postDAO.updatePost(postId, userId, categoryId, subject, content, rating, purchaseNumber, purchaseDate, location);
	}
	
	public int deletePost(int postId) {
		
		// 기존 글과 이미지 가져오기
		Post post = getPostByPostId(postId);
		if (post == null) { // 포스트가 없는 경우
			log.warn("[delete post] 삭제할 글이 존재하지 않습니다. postId:{}", postId);
			return 0;
		}
		
		// 업로드 되었던 이미지패스가 존재하면 이미지 삭제
		/*
		 * Image image = imageBO.getImageByPostId(postId); if (image.getImagePath() !=
		 * null) { fileManagerService.deleteFile(image.getImagePath()); }
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
	
	public Post getPost() {
		return postDAO.selectPost();
	}
}
