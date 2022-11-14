<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section class="category-area">
	<div class="category-top mb-4">
		<div class="subject-box d-flex justify-content-between align-items-end">
			<h2 class="form-title">카테고리 수정</h2>
			<a href="/category/category_list_view" class="btn-cancle">취소</a>
		</div>
		<div class="subtitle">수정할 카테고리를 선택해주세요.</div>
	</div>
	<ul class="category-list py-3">
		<c:forEach items="${categoryList}" var="category">
			<li class="category">
				<button type="button" class="btn-list-category" data-toggle="modal" data-target="#modal" value="${category.categoryName}">${category.categoryName}</button> <!-- 카테고리 수정 모달 팝업으로 이동 -->
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
					<div class="subject mb-3">수정할 카테고리명을 입력해주세요.</div>
					<div class="d-flex">
						<div class="input-cancle-box">						
							<input type="text" id="categoryName" class="form-control">
							<button type="button" id="inputClearBtn" class="btn-clear material-icons">clear</button>
						</div>
						<button type="button" id="updateCategoryBtn" class="btn btn-modify material-icons ml-2">edit</button>
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
	
	// 카테고리 수정 모달 버튼
	$('.btn-list-category').on('click', function(e) {
		let categoryId = $(this).data('category-id'); // getting
		$('#modal').data('category-id', categoryId); // setting
		alert(categoryId);
		let categoryName = e.target.value;
		//let categoryName = $('.btn-list-category').val();
		$('#modal #categoryName').val(categoryName);
	});
	
	// 카테고리 수정
	$('#updateCategoryBtn').on('click', function(e) {
		let categoryName = $('#modal #categoryName').val().trim();
		// 유효성 검사
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
		
		let categoryId = $(this).data('category-id'); // getting
		
		alert(categoryId);
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
					
					// 카테고리 수정 ajax
					$.ajax({
						type: 'put'
						, url: '/category/update'
						, data: {'categoryId':categoryId, 'categoryName':categoryName}
						
						, success: function(data) {
							if (data.code == 100) {
								// 성공
								alert('카테고리가 수정되었습니다.');
								location.reload();
							} else {
								// 에러
								alert(data.errorMessage);
							}
						}
						, error: function(e) {
							alert('카테고리 수정 에러');
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