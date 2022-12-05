package com.temlog.post;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.temlog.category.bo.CategoryBO;
import com.temlog.category.model.Category;
import com.temlog.image.bo.ImageBO;
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
			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value="rating", required=false) String rating,
			@RequestParam(value="sort", required=false) String sort,
			HttpSession session,
			Model model) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		List<Post> postList = postBO.getPostList(userId, keyword, rating, sort);
		model.addAttribute("postList", postList);
		
		List<Category> categoryList = categoryBO.getCategoryList();
		model.addAttribute("categoryList", categoryList);

		model.addAttribute("keyword", keyword);
		
		model.addAttribute("viewName", "post/postList");
		return "template/layout";
	}
	
	@RequestMapping("/post/post_list_by_category_view/{categoryId}")
	public String postListByCategoryView(
			@PathVariable Integer categoryId, 
			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value="rating", required=false) String rating,
			@RequestParam(value="sort", required=false) String sort,
			HttpSession session,
			Model model) {

		Integer userId = (Integer)session.getAttribute("userId");
		
		List<Post> postListByCategoryId = postBO.getPostListByCategoryId(userId, categoryId, keyword, rating, sort);
		model.addAttribute("postListByCategory", postListByCategoryId);

		List<Category> categoryList = categoryBO.getCategoryList();
		model.addAttribute("categoryList", categoryList);
		
		Category category = categoryBO.getCategoryByCategoryId(categoryId);
		model.addAttribute("categoryName", category.getCategoryName());
		
		model.addAttribute("keyword", keyword);
		
		model.addAttribute("viewName", "post/postListByCategory");
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
		List<String> imagePathList = imageBO.getImagePathListByPostId(postId);
		model.addAttribute("imagePathList", imagePathList);
		
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
		List<String> imagePathList = imageBO.getImagePathListByPostId(postId);
		model.addAttribute("imagePathList", imagePathList);
		
		model.addAttribute("viewName", "/post/postDetail");
		return "template/layout";
	}
	
}
