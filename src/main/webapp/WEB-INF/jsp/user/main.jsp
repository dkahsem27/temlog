<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="user-area">
	<h1 class="logo text-center"><a href="/user/main_view">LOGO HERE</a></h1>
	<div class="search-box d-flex align-items-center">
		<input type="search" class="form-control" placeholder="검색어를 입력해주세요">
		<button type="button" class="btn-search"><span class="material-icons-outlined">search</span></button>
	</div>
	<div class="btn-box d-flex justify-content-around align-items-center">
		<a href="/post/post_create_view" class="btn-create post">
			<span class="material-icons-outlined">edit_note</span>
			<div class="btn-create-text">기록하기</div>
		</a>
		<a href="/schedule/schedule_create_view" class="btn-create schedule">
			<span class="material-icons-outlined">edit_calendar</span>
			<div class="btn-create-text">일정등록</div>
		</a>
	</div>
	<div class="util-box text-center">
		<a href="/user/sign_out" class="btn-text sign-out">로그아웃</a>
	</div>
</section>