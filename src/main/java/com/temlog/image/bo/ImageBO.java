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

	public int addImage(String userLoginId, List<MultipartFile> file, Image image) {
		
		String imagePath = null;
		if (file != null) {
			// 파일이 있을 때만 업로드
			List<String> pathUrl = new ArrayList<>();
			for (int i = 0; i < file.size(); i++) {
				imagePath = fileManagerService.saveFile(userLoginId, file.get(i));
				pathUrl.add(imagePath);
			}
			
			image.setImagePath(pathUrl);
		}
		
		return imageDAO.insertImage(image);
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
}
