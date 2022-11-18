package com.temlog.image.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.temlog.image.model.Image;

@Repository
public interface ImageDAO {

	//public int insertImage(
	//		@Param("postId") int postId, 
	//		@Param("userId") int userId, 
	//		@Param("imagePath") String imagePath);
	
	public int insertImage(Image image);
	
	public List<Image> selectImageList();
	
	public Image selectImage();
	
	public Image selectImageByPostId(int postId);
}
