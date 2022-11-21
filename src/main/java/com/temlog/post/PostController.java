package com.temlog.post;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.temlog.category.bo.CategoryBO;
import com.temlog.category.model.Category;
import com.temlog.image.bo.ImageBO;
import com.temlog.image.model.Image;
import com.temlog.post.bo.PostBO;
import com.temlog.post.model.Post;

@Controller
public class PostController {
	
	@Autowired
	private PostBO postBO;
	
	@Autowired
	private CategoryBO categoryBO;
	
	@Autowired
	private ImageBO imageBO;

	@RequestMapping("/post/post_list_view")
	public String postListView(
			HttpSession session,
			Model model) {
		
		List<Post> postList = postBO.getPostList();
		model.addAttribute("postList", postList);
		
		List<Category> categoryList = categoryBO.getCategoryList();
		model.addAttribute("categoryList", categoryList);
		
		model.addAttribute("viewName", "post/postList");
		return "template/layout";
	}
	
	@RequestMapping("/post/post_create_view")
	public String postCreateView(Model model) {
		
		List<Category> categoryList = categoryBO.getCategoryList();
		model.addAttribute("categoryList", categoryList);
		
		model.addAttribute("viewName", "post/postCreate");
		return "template/layout";
	}
	
	@RequestMapping("/post/post_update_view")
	public String postUpdateView(
			@RequestParam("postId") int postId,
			Model model) {
		
		Post post = postBO.getPostByPostId(postId);
		model.addAttribute("post", post);
		List<Category> categoryList = categoryBO.getCategoryList();
		model.addAttribute("categoryList", categoryList);
		List<Image> imageList = imageBO.getImageListByPostId(postId);
		model.addAttribute("imageList", imageList);
		
		model.addAttribute("viewName", "post/postUpdate");
		return "template/layout";
	}
	
	@RequestMapping("/post/post_detail_view")
	public String postDetailView(
			@RequestParam("postId") int postId,
			@RequestParam("categoryId") int categoryId,
			HttpSession session,
			Model model) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		Post post = postBO.getPostByPostIdAndUserId(postId, userId);
		model.addAttribute("post", post);
		
		Category category = categoryBO.getCategoryByCategoryId(categoryId);
		model.addAttribute("category", category);
		
		List<Image> imageList = imageBO.getImageListByPostId(postId);
		model.addAttribute("imageList", imageList);
		List<String> imagePaths = imageBO.getImageByPostId(postId).getImagePath();
		model.addAttribute("imagePaths", imagePaths);
		
		for (var i = 0; i < imageList.size(); i++) {
			List<String> imgpthlist = imageList.get(0).getImagePath();
			model.addAttribute("imgpthlist", imgpthlist);			
		}
		
		model.addAttribute("viewName", "/post/postDetail");
		return "template/layout";
	}
	
}
