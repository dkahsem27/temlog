package com.temlog.post.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.temlog.post.model.Post;

@Repository
public interface PostDAO {

	//public int insertPost(
	//		@Param("post") List<Post> post,
	//		@Param("userId") int UserId,
	//		@Param("categoryId") int categoryId, 
	//		@Param("subject") String subject, 
	//		@Param("content") String content, 
	//		@Param("rating") String rating, 
	//		@Param("purchaseNumber") Integer purchaseNumber, 
	//		@Param("purchaseDate") Date purchaseDate, 
	//		@Param("location") String location);
	
	public int insertPost(Post post);
	
	public int updatePost(
			@Param("postId") int postId,
			@Param("userId") int UserId,
			@Param("categoryId") int categoryId, 
			@Param("subject") String subject, 
			@Param("content") String content, 
			@Param("rating") String rating, 
			@Param("purchaseNumber") Integer purchaseNumber, 
			@Param("purchaseDate") Date purchaseDate, 
			@Param("location") String location);
	
	public int deletePost(int postId);
	
	public Post selectPostByPostId(int postId);
	
	public Post selectPostByPostIdAndUserId(
			@Param("postId") int postId, 
			@Param("userId") int userId);
	
	public List<Post> selectPostList(int userId);
	
	public Post selectPost();
	
	public List<Post> selectPostListByCategoryId(
			@Param("userId") int userId, 
			@Param("categoryId") int categoryId);
	
	public List<Post> selectPostListByKeyword(
			@Param("userId") int userId, 
			@Param("keyword") String keyword);
	
	public List<Post> selectPostListByRating(
			@Param("userId") int userId, 
			@Param("rating") String rating);
	
	public List<Post> selectPostListByCategoryIdAndKeyword(
			@Param("userId") int userId,
			@Param("categoryId") int categoryId, 
			@Param("keyword") String keyword);
	
	public List<Post> selectPostListByCategoryIdAndRating(
			@Param("userId") int userId,
			@Param("categoryId") int categoryId, 
			@Param("rating") String rating);
	
	public List<Post> selectPostListByCreatedAt(int userId);
	public List<Post> selectPostListByPurchaseDate(int userId);
	public List<Post> selectPostListByPurchaseNumber(int userId);
	
	public List<Post> selectPostListByCategoryIdAndCreatedAt(
			@Param("userId") int userId, 
			@Param("categoryId") int categoryId);
	public List<Post> selectPostListByCategoryIdAndPurchaseDate(
			@Param("userId") int userId, 
			@Param("categoryId") int categoryId);
	public List<Post> selectPostListByCategoryIdAndPurchaseNumber(
			@Param("userId") int userId, 
			@Param("categoryId") int categoryId);
	
}
