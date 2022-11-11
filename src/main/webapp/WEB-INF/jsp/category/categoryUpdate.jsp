<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="category-area">
	<div class="category-top mb-4">
		<div class="subject-box d-flex justify-content-between align-items-end">
			<h2 class="form-title">카테고리 수정</h2>
			<a href="/category/category_list_view" class="btn-cancle">취소</a>
		</div>
		<div class="subtitle">수정할 카테고리를 선택해주세요.</div>
	</div>
	<ul class="category-list py-3">
		<li class="category">
			<button type="button" class="btn-list-category" data-toggle="modal" data-target="#modal">카테고리명</button> <!-- 카테고리 수정 모달 팝업으로 이동 -->
		</li>
	</ul>
</section>

<!-- Modal -->
<div class="modal fade" id="modal">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<!-- 모달 내용 -->
			<div class="modal-box p-4">
				<div class="d-flex justify-content-center mb-4">
					<button type="button" class="btn-close material-icons" data-dismiss="modal">close</button>
				</div>
				<div class="content mb-4">
					<div class="subject mb-3">수정할 카테고리명을 입력해주세요.</div>
					<div class="d-flex">
						<div class="input-cancle-box">						
							<input type="text" id="categoryName" class="form-control">
							<button type="button" id="inputClearBtn" class="btn-clear material-icons">clear</button>
						</div>
						<button type="button" id="updateCategory" class="btn btn-modify material-icons ml-2">edit</button>
					</div>
					<div class="noti-box mt-2">
				      	<div id="categoryCheckDuplicated" class="noti text-danger d-none">이미 존재하는 카테고리명입니다.</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
$(document).ready(function() {
	// 모달 인풋 내용 지우기
	$('#inputClearBtn').on('click', function() {
		$('#categoryName').val('');
	});
});
</script>