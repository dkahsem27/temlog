<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="user-sign-area">
	<h1 class="logo text-center"><a href="#">LOGO HERE</a></h1>
	<div class="form-outer">
		<div class="form-group d-flex align-items-center">
			<label for="loginId">아이디</label>
			<input type="text" id="loginId" class="form-control" placeholder="아이디를 입력해주세요">
		</div>
		<div class="form-group d-flex align-items-center">
			<label for="password">비밀번호</label>
			<input type="text" id="password" class="form-control" placeholder="비밀번호를 입력해주세요">
		</div>
		<div class="btn-box mt-5">
			<button type="button" class="btn btn-block btn-dark">로그인</button>
			<a href="/user/sign_up_view" class="btn btn-block btn-outline-secondary">회원가입</a>
		</div>
	</div>
</section>