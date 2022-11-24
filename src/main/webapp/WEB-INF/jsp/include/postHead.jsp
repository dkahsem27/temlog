<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header id="header">
	<div class="head-box d-flex justify-content-between align-items-center px-2 py-3">
		<div class="util-box d-flex align-items-center">
			<a href="/category/category_list_view" class="btn-category-menu material-icons md-36">apps</a>
			<c:choose>
			<c:when test="${not empty categoryName}">
				<div class="category-name ml-2">${categoryName}</div>
			</c:when>
			<c:otherwise>
				<div class="category-name ml-2">전체</div>
			</c:otherwise>
			</c:choose>
		</div>
		<a href="/post/post_create_view" class="btn-post-create material-icons md-32">create</a>
	</div>
</header>