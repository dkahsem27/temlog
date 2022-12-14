package com.temlog.image.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.temlog.image.model.Image;

@Repository
public interface ImageDAO {

	public void insertImage(
			@Param("postId") int postId, 
			@Param("userId") int userId, 
			@Param("imagePath") String imagePath);
	
	public void deleteImageByPostId(int postId);
	
	public void deleteImageByPostIdAndImagePath(
			@Param("postId") int postId, 
			@Param("deleteImagePath") String deleteImagePath);
	
	public List<Image> selectImageList();
	
	public List<Image> selectImageListByPostId(int postId);
	
	public Image selectImage();
	
	public Image selectImageByPostId(int postId);
	
	public List<String> selectImagePathListByPostId(int postId);
}
