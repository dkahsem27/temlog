package com.temlog.image.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.temlog.image.model.Image;

@Repository
public interface ImageDAO {

	public int insertImage(
			@Param("postId") int postId, 
			@Param("userId") int userId, 
			@Param("imagePath") String imagePath);
	
	public void updateImage(
			@Param("imageId") int imageId, 
			@Param("postId") int postId, 
			@Param("userId") int userId, 
			@Param("imagePath") String imagePath);
	
	public void deleteImage(int postId);
	
	public List<Image> selectImageList();
	
	public Image selectImage();
	
	public Image selectImageByPostId(int postId);
	
	public List<String> selectImagePathListByPostId(int postId);
}
