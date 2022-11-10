<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<li class="category">
			<a href="/post/post_list_view" class="btn-list-category">카테고리명</a> <!-- 카테고리명과 일치하는 목록 리스트 화면으로 이동 -->
		</li>
		<li class="category">
			<a href="/post/post_list_view" class="btn-list-category">카테고리명</a> <!-- 카테고리명과 일치하는 목록 리스트 화면으로 이동 -->
		</li>
		<li class="category">
			<a href="/post/post_list_view" class="btn-list-category">카테고리명</a> <!-- 카테고리명과 일치하는 목록 리스트 화면으로 이동 -->
		</li>
	</ul>
</section>

<!-- Modal -->
<div class="modal fade" id="modal">
	<div class="modal-dialog modal-dialog-centered modal-sm">
		<div class="modal-content">
			<!-- 모달 내용 -->
			<div class="modal-box p-4">
				<div class="d-flex justify-content-center mb-4">
					<button type="button" class="btn-close material-icons" data-dismiss="modal">close</button>
				</div>
				<div class="content mb-4">
					<div class="subject mb-3">추가할 카테고리명을 입력해주세요.</div>
					<div class="d-flex">
						<input type="text" id="categoryName" class="form-control">
						<button type="button" id="addCategory" class="btn btn-add ml-2">+</button>
					</div>
					<div class="noti-box mt-2">
				      	<div id="categoryCheckDuplicated" class="noti text-danger d-none">이미 존재하는 카테고리명입니다.</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>