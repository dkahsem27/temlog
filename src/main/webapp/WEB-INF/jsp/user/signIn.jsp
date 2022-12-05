<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="user-area">
	<h1 class="logo text-center py-4"><a href="/main_view"><img src="/static/logo.svg" alt="로고"></a></h1>
	<div class="form-outer">
		<div class="form-box">
			<div class="form-group d-flex align-items-center">
				<label for="loginId">아이디</label>
				<input type="text" id="loginId" class="form-control" placeholder="아이디를 입력해주세요">
			</div>
			<div class="form-group d-flex align-items-center">
				<label for="password">비밀번호</label>
				<input type="password" id="password" class="form-control" placeholder="비밀번호를 입력해주세요">
			</div>
			<div class="noti-box text-center mb-3">
		      	<div id="idPwCheck" class="noti text-danger d-none">아이디/비밀번호가 일치하지 않습니다.</div>
			</div>
		</div>
		<div class="btn-box mt-5">
			<button type="button" id="signInBtn" class="btn btn-block btn-dark">로그인</button>
			<a href="/user/sign_up_view" class="btn btn-block btn-outline-secondary">회원가입</a>
		</div>
	</div>
</section>

<script>
$(document).ready(function() {
	// 엔터로 로그인
	let password = document.getElementById('password');
	password.addEventListener('keyup', function(event) {
		if (event.keyCode === 13) {
			event.preventDefault();
			$('#signInBtn').click();
		}
	});
	// 로그인
	$('#signInBtn').on('click', function() {
		let loginId = $('#loginId').val().trim();
		let password = $('#password').val().trim();
		
		// 유효성 검사
		if (loginId == '') {
			alert('아이디를 입력해주세요.');
			$('#loginId').focus();
			return;
		}
		if (password == '') {
			alert('비밀번호를 입력해주세요.');
			$('#password').focus();
			return;
		}
		
		// ajax
		$.ajax({
			url: '/user/sign_in'
			, type: 'post'
			, data: {'loginId':loginId, 'password':password}
		
		, success: function(data) {
			if (data.code == 100) {
				// 성공
				location.href='/main_view';
			} else if (data.code == 400) {
				// 에러
				$('#idPwCheck').removeClass('d-none'); // 알림문구 노출
				//$('#loginId').val('');
				//$('#password').val('');
			} else {
				alert(data.errorMessage);
			}
		}
		, error: function(e) {
			alert('로그인 에러');
		}
		});
	});
});
</script>