package com.temlog.image.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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

	public int addImage(int postId, int userId, String userLoginId, List<MultipartFile> file, Image image) {
		
		String imagePath = null;
		if (file != null) {
			// 파일이 있을 때만 업로드
			List<String> pathUrl = new ArrayList<>();
			for (int i = 0; i < file.size(); i++) {
				imagePath = fileManagerService.saveFile(userLoginId, file.get(i));
				pathUrl.add(imagePath);
			}
			image.setImagePath(pathUrl);
			image.setPostId(postId);
			image.setUserId(userId);
		}
		
		return imageDAO.insertImage(image);
	}
	
	public int updateImage(int imageId, int postId, int userId, String userLoginId, List<MultipartFile> file, Image image) {
		
		// file이 있으면 이미지 수정 => 업로드 (실패시 기존 이미지는 그대로 둔다) => 성공시 기존이미지 제거
		String imagePath = null;
		if (file != null) {
			// 파일이 있을 때만 업로드
			List<String> pathUrl = new ArrayList<>();
			for (int i = 0; i < file.size(); i++) {
				imagePath = fileManagerService.saveFile(userLoginId, file.get(i));
				pathUrl.add(imagePath);
			}
			
			image.setImagePath(pathUrl);
			image.setPostId(postId);
			image.setUserId(userId);
			
			// 업로드 성공하면 기존 이미지 제거
			if (imagePath != null && image.getImagePath() != null) { // 기존 이미지 있는 경우
				// 업로드가 실패할 수 있으므로 업로드가 된 후 제거
				fileManagerService.deleteFile(image.getImagePath());
			}
		}
		
		// update => imagePath가 없으면 mybatis에서 업데이트 하지 않도록 처리
		return imageDAO.updateImage(image);
	}
	
	public List<Image> getImageList() {
		return imageDAO.selectImageList();
	}
	
	public Image getImage() {
		return imageDAO.selectImage();
	}
	
	public Image getImageByPostId(int postId) {
		return imageDAO.selectImageByPostId(postId);
	}
	
	public List<Image> getImageListByPostId(int postId) {
		return imageDAO.selectImageListByPostId(postId);
	}
}
