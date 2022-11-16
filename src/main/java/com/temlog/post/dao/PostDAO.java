package com.temlog.post.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.temlog.post.model.Post;

@Repository
public interface PostDAO {

	public int insertPost(
			@Param("userId") int UserId,
			@Param("categoryId") int categoryId, 
			@Param("subject") String subject, 
			@Param("content") String content, 
			@Param("rating") String rating, 
			@Param("purchaseNumber") Integer purchaseNumber, 
			@Param("purchaseDate") Date purchaseDate, 
			@Param("imagePath") String imagePath, 
			@Param("location") String location);
	
	public int updatePost(
			@Param("postId") int postId,
			@Param("userId") int UserId,
			@Param("categoryId") int categoryId, 
			@Param("subject") String subject, 
			@Param("content") String content, 
			@Param("rating") String rating, 
			@Param("purchaseNumber") Integer purchaseNumber, 
			@Param("purchaseDate") Date purchaseDate, 
			@Param("imagePath") String imagePath, 
			@Param("location") String location);
	
	public int deletePost(int postId);
	
	public Post selectPostByPostId(int postId);
	
	public Post selectPostByPostIdAndUserId(
			@Param("postId") int postId, 
			@Param("userId") int userId);
	
	public List<Post> selectPostList();
}
