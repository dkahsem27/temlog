<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="user-area">
	<h1 class="logo text-center"><a href="/post/post_list_view">LOGO HERE</a></h1>
	<div class="search-box d-flex align-items-center">
		<input type="search" class="form-control" placeholder="검색어를 입력해주세요">
		<button type="button" class="btn-search"><span class="material-icons-outlined">search</span></button>
	</div>
	<div class="btn-box py-5 d-flex justify-content-around align-items-center">
		<a href="/post/post_create_view" class="btn-create post">
			<div class="btn-create-inner">
				<div class="btn-create-icon material-icons-outlined">edit_note</div>
				<div class="btn-create-text">기록하기</div>
			</div>
		</a>
		<a href="/schedule/schedule_create_view" class="btn-create schedule">
			<div class="btn-create-inner">
				<div class="btn-create-icon material-icons-outlined">edit_calendar</div>
				<div class="btn-create-text">일정등록</div>
			</div>
		</a>
	</div>
	<div class="util-box text-center mt-3">
		<a href="/user/sign_out" class="btn-text sign-out">로그아웃</a>
	</div>
</section>