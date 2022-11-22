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
	
	public void updateImage(int imageId, int postId, int userId, String userLoginId, List<MultipartFile> fileList) {
		
		// file이 있으면 이미지 수정 => 업로드 (실패시 기존 이미지는 그대로 둔다) => 성공시 기존이미지 제거
		String imagePath = null;
		if (ObjectUtils.isEmpty(fileList) == false) {
			// 파일이 있을 때만 업로드
			for (int i = 0; i < fileList.size(); i++) {
				imagePath = fileManagerService.saveFile(userLoginId, fileList.get(i));
				
				imageDAO.updateImage(imageId, postId, userId, imagePath);
			}
			
			// 업로드 성공하면 기존 이미지 제거
			/*
			 * if (imagePath != null && image.getImagePath() != null) { // 기존 이미지 있는 경우 //
			 * 업로드가 실패할 수 있으므로 업로드가 된 후 제거
			 * fileManagerService.deleteFile(image.getImagePath()); }
			 */
		}
		
		List<Image> imageList = getImageListByPostId(postId);
		for (int i = 0; i < imageList.size(); i++) {
			List<String> imagePathList = imageList.get(i).getImagePath();
			// 업로드 되었던 이미지패스가 존재하면 이미지 삭제
			if (ObjectUtils.isEmpty(imagePathList) == false) {
				fileManagerService.deleteFile(imagePathList);
				imageDAO.deleteImage(imageId, postId);
			}
		}
	}
	
	public void deleteImage(int imageId, int postId) {

		List<Image> imageList = getImageListByPostId(postId);
		for (int i = 0; i < imageList.size(); i++) {
			List<String> imagePathList = imageList.get(i).getImagePath();
			// 업로드 되었던 이미지패스가 존재하면 이미지 삭제
			if (ObjectUtils.isEmpty(imagePathList) == false) {
				fileManagerService.deleteFile(imagePathList);
			}
			imageDAO.deleteImage(imageId, postId);
		}
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
