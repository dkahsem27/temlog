package com.temlog.image;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.temlog.image.bo.ImageBO;

@RestController
public class ImageRestController {

	@Autowired
	private ImageBO imageBO;
	
	@DeleteMapping("/image/delete")
	public Map<String, Object> delete(
			@RequestParam("postId") int postId,
			@RequestParam("deleteImagePath") String deleteImagePath) {
		
		Map<String, Object> result = new HashMap<>();
		imageBO.deleteImageByPostIdAndImagePath(postId, deleteImagePath);
		
		result.put("code", 100);
		result.put("errorMessage", "이미지 삭제에 실패했습니다. 관리자에게 문의해주세요.");
		
		return result;
	}
}
