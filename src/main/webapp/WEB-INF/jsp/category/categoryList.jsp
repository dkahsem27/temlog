<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section class="category-area">
	<div class="category-top mb-5">
		<div class="subject-box d-flex justify-content-between align-items-end">
			<h2 class="form-title">카테고리</h2>
			<a href="/post/post_list_view" class="btn-cancle">취소</a>
		</div>
		<div class="subtitle">카테고리를 선택하면 해당 목록으로 이동합니다.</div>
	</div>
	<button type="button" class="btn btn-dark btn-block" data-toggle="modal" data-target="#modal">추가</button>
	<div class="util-box d-flex justify-content-end align-items-center my-3">
		<a href="/category/category_update_view" class="btn-category modify d-flex align-items-center"><span class="material-icons md-18">edit</span>수정</a>
		<span class="line">&nbsp;|&nbsp;</span>
		<a href="/category/category_delete_view" class="btn-category delete d-flex align-items-center"><span class="material-icons md-18">delete</span>삭제</a>
	</div>
	<ul class="category-list py-3">
		<c:forEach items="${categoryList}" var="category">
			<li class="category">
				<a href="/post/post_list_view" class="btn-list-category">${category.categoryName}</a> <!-- 카테고리명과 일치하는 목록 리스트 화면으로 이동 -->
			</li>
		</c:forEach>
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
					<div class="subject mb-3">추가할 카테고리명을 입력해주세요.</div>
					<div class="d-flex">
						<div class="input-cancle-box">						
							<input type="text" id="categoryName" class="form-control">
							<button type="button" id="inputClearBtn" class="btn-clear material-icons">clear</button>
						</div>
						<button type="button" id="addCategoryBtn" class="btn btn-add ml-2">+</button>
					</div>
					<div class="noti-box mt-2">
				      	<div id="categoryCheckDuplicated" class="noti text-danger d-none">이미 존재하는 카테고리명입니다.</div>
				      	<div id="categoryCheckLength" class="noti text-danger d-none">카테고리명은 10자까지 입력할 수 있습니다.</div>
				      	<div id="categoryCheckInputValue" class="noti text-danger d-none">카테고리명을 입력해주세요.</div>
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
	
	// 카테고리 추가
	$('#addCategoryBtn').on('click', function() {
		// 유효성 검사
		let categoryName = $('#categoryName').val().trim();
		if (categoryName == '') {
			$('#categoryCheckInputValue').removeClass('d-none');
			$('#categoryCheckLength').addClass('d-none');
			$('#categoryCheckDuplicated').addClass('d-none');
			$('#categoryName').focus();
			return;
		} else {
			$('#categoryCheckInputValue').addClass('d-none');
		}
		
		if (categoryName.length > 10) {
			$('#categoryCheckLength').removeClass('d-none');
			$('#categoryCheckInputValue').addClass('d-none');
			$('#categoryCheckDuplicated').addClass('d-none');
			return;
		} else {
			$('#categoryCheckLength').addClass('d-none');
		}
		
		// ajax
		// 카테고리 중복 확인 ajax
		$.ajax({
			url: '/category/is_duplicated_category'
			, data: {'categoryName':categoryName}
		
			, success: function(data) {
				if (data.result == true) {
					// 중복일 때
					$('#categoryCheckDuplicated').removeClass('d-none');
					$('#categoryCheckLength').addClass('d-none');
					$('#categoryCheckInputValue').addClass('d-none');
				} else if (data.result == false) {
					// 중복 아닐 때
					$('#categoryCheckDuplicated').addClass('d-none');
					
					// 카테고리 추가 ajax
					$.ajax({
						url: '/category/create'
						, type: 'post'
						, data: {'categoryName':categoryName}
						
						, success: function(data) {
							if (data.code == 100) {
								// 성공
								alert('카테고리가 추가되었습니다.');
								location.reload();
							} else {
								// 에러
								alert(data.errorMessage);
							}
						}
						, error: function(e) {
							alert('카테고리 추가 에러');
						}
					});
				}
			}
			, error: function(e) {
				alert('카테고리 중복확인 에러');
			}
		});
	});
});
</script>