<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="user-area">
	<div class="subject-box d-flex justify-content-between align-items-end mb-3">
		<h2 class="form-title">내 정보 수정</h2>
		<a href="javascript:history.back();" class="btn-cancle">취소</a>
	</div>
	<div class="form-outer py-3">
		<div class="form-group mb-4">
			<div class="noti-box d-flex mb-2">
				<label for="loginId" class="label-width-auto">내 아이디</label>
				<div class="noti-info d-flex align-items-end ml-1">
					<span class="icon-info material-icons-outlined">info</span>
					<span class="noti hover-block ml-1">아이디는 수정할 수 없습니다.</span>
				</div>
			</div>
			<div class="user-login-id">userLoginId</div>
		</div>
		<div class="form-group">
			<label for="password" class="mb-2">현재 비밀번호<span class="required">*</span></label>
			<input type="password" id="password" class="form-control" placeholder="현재 비밀번호를 입력해주세요">
		</div>
		<div class="form-group">
			<label for="changedPassword" class="mb-2">새 비밀번호<span class="required">*</span></label>
			<input type="password" id="changedPassword" class="form-control" placeholder="새 비밀번호를 입력해주세요">
		</div>
		<div class="form-group">
			<label for="checkchangedPassword" class="mb-2">새 비밀번호 확인<span class="required">*</span></label>
			<input type="password" id="checkchangedPassword" class="form-control" placeholder="새 비밀번호를 다시 입력해주세요">
		</div>
	</div>
	<div class="btn-box py-0 my-4">
		<button type="button" id="updateBtn" class="btn btn-block btn-dark">저장</button>
		<div class="d-flex justify-content-end mt-3">
			<button type="button" id="withdrawalBtn" class="btn-text withdrawal">회원탈퇴</button>
		</div>
	</div>
</section>