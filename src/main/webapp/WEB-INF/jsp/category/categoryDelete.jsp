<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section class="category-area">
	<div class="category-top mb-4">
		<div class="subject-box d-flex justify-content-between align-items-end">
			<h2 class="form-title">카테고리 삭제</h2>
			<a href="/category/category_list_view" class="btn-cancle">취소</a>
		</div>
		<div class="subtitle">삭제할 카테고리를 선택해주세요.</div>
	</div>
	<ul class="category-list py-3">
		<c:forEach items="${categoryList}" var="category">
			<li class="category">
				<button type="button" class="btn-delete-category btn-list-category" data-category-id="${category.id}">${category.categoryName}</button> <!-- 삭제 confirm 노출 -->
			</li>
		</c:forEach>
	</ul>
</section>

<script>
$(document).ready(function() {
	$('.btn-delete-category').on('click', function() {
		let categoryId = $(this).data('category-id');
		
		if (confirm('삭제하시겠습니까?')) {
			$.ajax({
				type: 'delete'
				, url: '/category/delete'
				, data: {'categoryId':categoryId}
			
				, success: function(data) {
					if (data.code == 100) {
						alert('삭제되었습니다.');
						location.reload();
					} else {
						alert(data.errorMessage);
					}
				}
				, error: function(e) {
					alert('카테고리 삭제 실패');
				}
			});
		}
	});
});
</script>