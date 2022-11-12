<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="category-area">
	<div class="category-top mb-4">
		<div class="subject-box d-flex justify-content-between align-items-end">
			<h2 class="form-title">카테고리 삭제</h2>
			<a href="/category/category_list_view" class="btn-cancle">취소</a>
		</div>
		<div class="subtitle">삭제할 카테고리를 선택해주세요.</div>
	</div>
	<ul class="category-list py-3">
		<li class="category">
			<button type="button" id="deleteCategoryBtn" class="btn-list-category">카테고리명</button> <!-- 삭제 confirm 노출 -->
		</li>
	</ul>
</section>

<script>
$(document).ready(function() {
	$('#deleteCategoryBtn').on('click', function() {
		if (confirm('삭제하시겠습니까?')) {
			alert('삭제되었습니다.');
		}
	});
});
</script>