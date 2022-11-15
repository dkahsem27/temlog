package com.temlog.post.bo;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.temlog.common.FileManagerService;
import com.temlog.post.dao.PostDAO;

@Service
public class PostBO {
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private FileManagerService fileManagerService;
	
	public int addPost(int userId, String userLoginId, 
			int categoryId, String subject, 
			String content, String rating, 
			Integer purchaseNumber, Date purchaseDate, 
			MultipartFile file, String location) {
		
		String imagePath = null;
		if (file != null) {
			// 파일이 있을 때만 업로드
			imagePath = fileManagerService.saveFile(userLoginId, file);
		}
		
		return postDAO.insertPost(userId, categoryId, subject, content, rating, purchaseNumber, purchaseDate, imagePath, location);
	}
}
