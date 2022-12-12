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
			<div class="d-flex justify-content-between">
				<div id="userLoginId" class="user-login-id">${user.loginId}</div>
				<div class="util-box">
					<a href="/user/sign_out" class="btn-text sign-out">로그아웃</a>
				</div>
			</div>
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
			<button type="button" id="withdrawalBtn" class="btn-text withdrawal px-0" data-user-id="${user.id}">회원탈퇴</button>
		</div>
	</div>
</section>

<script>
$(document).ready(function() {
	// 회원정보 수정
	$('#updateBtn').on('click', function(){
		let password = $('#password').val().trim();
		let changedPassword = $('#changedPassword').val().trim();
		let checkchangedPassword = $('#checkchangedPassword').val().trim();
		
		// 유효성 검사
		if (password == '') {
			alert('현재 비밀번호를 입력해주세요.');
			$('#password').focus();
			return;
		}
		if (changedPassword == '') {
			alert('새 비밀번호를 입력해주세요.');
			$('#changedPassword').focus();
			return;
		}
		if (checkchangedPassword == '') {
			alert('새 비밀번호 확인을 입력해주세요.');
			$('#checkchangedPassword').focus();
			return;
		}
		
		// 비밀번호 정규표현식 : 숫자&문자&허용된특수문자만/6~20자
		let pwReg = /^[a-zA-Z\\d`~!@#$%^&*()-_=+]{6,20}$/;
		if (!pwReg.test(changedPassword)) {
			alert('비밀번호는 6자 이상, 영문 또는 숫자로 구성되어야 합니다.');
			$('#password').focus();
			return;
		}
		
		if (password == changedPassword) {
			alert('현재 비밀번호와 동일한 비밀번호입니다. 다시 입력해주세요.');
			$('#changedPassword').val('');
			$('#checkchangedPassword').val('');
			$('#changedPassword').focus();
			return;
		}
		if (changedPassword != checkchangedPassword) {
			alert('새 비밀번호가 일치하지 않습니다. 다시 확인해주세요.');
			$('#checkchangedPassword').focus();
			return;
		}
		
		// ajax
		$.ajax({
			type: "GET"
			, url: "/account/update"
			, data: {"password":password, "changedPassword":changedPassword}
			, success: function(data){
				if (data.result == true) {
					// 현재 비밀번호 일치
					if (data.code == 100) {
						// 성공
						alert('비밀번호가 수정되었습니다.');
						location.reload();
					} else {
						// 에러
						alert(data.errorMessage);
					}
				} else if (data.result == false) {
					// 현재 비밀번호 불일치
					alert('현재 비밀번호가 일치하지 않습니다.');
					$('#password').focus();
				}
			}
			, error: function(e) {
				alert('회원정보 수정 에러');
			}
		});
	})
	
	// 회원탈퇴
	$('#withdrawalBtn').on('click', function() {
		let userId = $(this).data('user-id');
		if (confirm('탈퇴되면 기록한 내용은 복구되지 않습니다.\n정말로 탈퇴하시겠습니까?')) {
			$.ajax({
				type: 'delete'
				, url: '/account/delete'
				, data: {'userId':userId}
			
				, success: function(data) {
					if (data.code == 100) {
						alert('정상적으로 탈퇴되었습니다.');
						location.href='/user/sign_in_view';
					} else {
						alert(data.errorMessage);
					}
				}
				, error: function(e) {
					alert('회원 탈퇴 실패');
				}
			});
		}
	});
});
</script>