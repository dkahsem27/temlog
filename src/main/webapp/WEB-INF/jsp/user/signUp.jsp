<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="user-area">
	<div class="subject-box d-flex justify-content-between align-items-end mb-3">
		<h2 class="form-title">회원가입</h2>
		<a href="/user/sign_in_view" class="btn-cancle">취소</a>
	</div>
	<div class="form-outer py-3">
		<div class="form-box">
			<div class="form-group mb-2">
				<label for="loginId" class="mb-2">아이디<span class="required">*</span></label>
				<div class="d-flex align-items-center">
					<input type="text" id="loginId" class="form-control" placeholder="아이디를 입력해주세요">
					<button type="button" id="idCheckBtn" class="btn btn-outline-secondary ml-2">중복확인</button>
				</div>
			</div>
			<div class="noti-box mb-3">
				<div id="idCheckLength" class="noti text-danger d-none">아이디는 4자 이상 입력해주세요.</div>
		      	<div id="idCheckDuplicated" class="noti text-danger d-none">중복된 아이디입니다.</div>
		     	<div id="idCheckOk" class="noti text-success d-none">사용 가능한 아이디입니다.</div>
			</div>
		</div>
		<div class="form-group">
			<label for="password" class="mb-2">비밀번호<span class="required">*</span></label>
			<input type="password" id="password" class="form-control" placeholder="비밀번호를 입력해주세요">
		</div>
		<div class="form-group">
			<label for="checkPassword" class="mb-2">비밀번호 확인<span class="required">*</span></label>
			<input type="password" id="checkPassword" class="form-control" placeholder="비밀번호를 다시 입력해주세요">
		</div>
	</div>
	<div class="btn-box my-4">
		<button type="button" id="signUpBtn" class="btn btn-block btn-dark">가입하기</button>
	</div>
</section>

<script>
$(document).ready(function() {
	// 아이디 중복확인
	$('#idCheckBtn').on('click', function() {
		let loginId = $('#loginId').val().trim();
		
		// 입력한 아이디가 4자 이하일 때
		if (loginId.length < 4) {
			$('#idCheckLength').removeClass('d-none'); // 알림문구 노출
			$('#idCheckDuplicated').addClass('d-none') // 숨김
			$('#idCheckOk').addClass('d-none'); // 숨김
			return;
		}
		
		// ajax
		$.ajax({
			url: '/user/is_duplicated_id'
			, data: {'loginId':loginId}
		
			, success: function(data) {
				if (data.result) {
					// 중복일 때
					$('#idCheckDuplicated').removeClass('d-none'); // 알림문구 노출
					$('#idCheckLength').addClass('d-none') // 숨김
					$('#idCheckOk').addClass('d-none'); // 숨김
				} else {
					// 중복 아닐 때
					$('#idCheckOk').removeClass('d-none'); // 알림문구 노출
					$('#idCheckLength').addClass('d-none') // 숨김
					$('#idCheckDuplicated').addClass('d-none'); // 숨김
				}
			}
			, error: function(e) {
				alert('아이디 중복확인 에러');
			}
		});
	});
	
	// 회원가입
	$('#signUpBtn').on('click', function() {
		let loginId = $('#loginId').val().trim();
		let password = $('#password').val().trim();
		let checkPassword = $('#checkPassword').val().trim();
		
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
		if (checkPassword == '') {
			alert('비밀번호 확인을 입력해주세요');
			$('#checkPassword').focus();
			return;
		}
		if (password != checkPassword) {
			alert('비밀번호가 일치하지 않습니다.');
			return;
		}
		
		// 아이디 중복확인 완료 되었는지 확인
		if ($('#idCheckOk').hasClass('d-none')) {
			alert('아이디 중복확인을 완료해 주세요.');
			return;
		}
		
		// ajax
		$.ajax({
			url: '/user/sign_up'
			, type: 'post'
			, data: {'loginId':loginId, 'password':password}
		
			, success: function(data) {
				if (data.code == 100) {
					// 성공
					alert('가입되었습니다. 로그인 해주세요.');
					location.href='/user/sign_in_view';
				} else {
					// 에러
					alert(data.errorMessage);
				}
			}
			, error: function(e) {
				alert('회원가입 에러');
			}
		});
	});
});
</script>