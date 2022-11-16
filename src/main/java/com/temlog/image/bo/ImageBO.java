package com.temlog.image.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.temlog.image.dao.ImageDAO;
import com.temlog.image.model.Image;

@Service
public class ImageBO {

	@Autowired
	private ImageDAO imageDAO;
	
	public Image getImageByPostId(int postId) {
		return imageDAO.selectImageByPostId(postId);
	}
}
