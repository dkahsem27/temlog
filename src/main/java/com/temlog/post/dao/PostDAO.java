package com.temlog.post.dao;

import java.util.Date;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

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
}
