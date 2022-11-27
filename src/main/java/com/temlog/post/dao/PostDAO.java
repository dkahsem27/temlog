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
	
	public List<Post> selectPostList();
	
	public Post selectPost();
	
	public List<Post> selectPostListByCategoryId(int categoryId);
	
	public List<Post> selectPostListByKeyword(String keyword);
	
	public List<Post> selectPostListByRating(String rating);
	
	public List<Post> selectPostListByCategoryIdAndKeyword(
			@Param("categoryId") int categoryId, 
			@Param("keyword") String keyword);
	
	public List<Post> selectPostListByCategoryIdAndRating(
			@Param("categoryId") int categoryId, 
			@Param("rating") String rating);
	
	public List<Post> selectPostListByCreatedAt();
	public List<Post> selectPostListByPurchaseDate();
	public List<Post> selectPostListByPurchaseNumber();
	
	public List<Post> selectPostListByCategoryIdAndCreatedAt(int categoryId);
	public List<Post> selectPostListByCategoryIdAndPurchaseDate(int categoryId);
	public List<Post> selectPostListByCategoryIdAndPurchaseNumber(int categoryId);
	
}
