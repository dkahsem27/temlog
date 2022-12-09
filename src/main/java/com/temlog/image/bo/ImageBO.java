package com.temlog.image.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;
import org.springframework.web.multipart.MultipartFile;

import com.temlog.common.FileManagerService;
import com.temlog.image.dao.ImageDAO;
import com.temlog.image.model.Image;

@Service
public class ImageBO {

	@Autowired
	private ImageDAO imageDAO;
	
	@Autowired
	private FileManagerService fileManagerService;

	public void addImage(int postId, int userId, String userLoginId, List<MultipartFile> fileList) {
		String imagePath = null;
		if (ObjectUtils.isEmpty(fileList) == false) {
			// 파일이 있을 때만 업로드
			for (int i = 0; i < fileList.size(); i++) {
				imagePath = fileManagerService.saveFile(userLoginId, fileList.get(i));
				
				imageDAO.insertImage(postId, userId, imagePath);
			}
		}
	}
	
	public void deleteImageByPostId(int postId) {
		List<String> imagePathList = imageDAO.selectImagePathListByPostId(postId);
		for (int i = 0; i < imagePathList.size(); i++) {
			String imagePath = imagePathList.get(i);
			if (imagePath != null) {				
				fileManagerService.deleteFile(imagePath);
			}
		}
		imageDAO.deleteImageByPostId(postId);
	}
	
	public void deleteImageByPostIdAndImagePath(int postId, String deleteImagePath) {
		if (deleteImagePath != null) {
			fileManagerService.deleteFile(deleteImagePath);
		}
		imageDAO.deleteImageByPostIdAndImagePath(postId, deleteImagePath);
	}
	
	public List<Image> getImageList() {
		return imageDAO.selectImageList();
	}
	
	public List<Image> getImageListByPostId(int postId) {
		return imageDAO.selectImageListByPostId(postId);
	}
	
	public Image getImage() {
		return imageDAO.selectImage();
	}
	
	public Image getImageByPostId(int postId) {
		return imageDAO.selectImageByPostId(postId);
	}
	
	public List<String> getImagePathListByPostId(int postId) {
		return imageDAO.selectImagePathListByPostId(postId);
	}
}
