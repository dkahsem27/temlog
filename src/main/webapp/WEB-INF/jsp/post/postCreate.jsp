<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section class="post-area">
	<div class="subject-box d-flex justify-content-between align-items-end mb-3">
		<h2 class="form-title">기록하기</h2>
		<a href="/post/post_list_view" class="btn-cancle">취소</a>
	</div>
	<div class="form-outer py-3">
		<!-- 카테고리 선택 -->
		<div class="form-box">
			<div class="form-group">
				<div class="d-flex justify-content-between align-items-center">
					<div class="d-flex">
						<label for="category">카테고리<span class="required">*</span></label>
						<a href="/category/category_list_view" class="material-icons md-18 ml-2">add_circle_outline</a>
					</div>
					<select id="category" class="form-control form-select col-6">
						<option value="" selected>카테고리 선택</option>
						<c:forEach items="${categoryList}" var="category">
							<option value="${category.id}">${category.categoryName}</option>
						</c:forEach>
					</select>
				</div>
			</div>
		</div>
		<!-- 글 제목 -->
		<div class="form-group">
			<div class="d-flex justify-content-between">
				<label for="subject" class="mb-2">제목<span class="required">*</span></label>
				<div class="text-length-box d-flex">
					<span class="text-count subject">0</span>
					<span class="text-max subject">/20자</span>
				</div>
			</div>
			<input type="text" id="subject" class="form-control" placeholder="기록하고 싶은 항목을 입력해주세요(최대 20자)" maxlength="20">
		</div>
		<div class="noti-box mb-3">
			<div class="text-count-noti subject noti text-danger d-none">제목은 20자까지 입력할 수 있습니다.</div>
		</div>
		<!-- 글 내용 -->
		<div class="form-group">
			<div class="d-flex justify-content-between">
				<label for="content" class="mb-2">내용<span class="required">*</span></label>
				<div class="text-length-box d-flex">
					<span class="text-count content">0</span>
					<span class="text-max content">/150자</span>
				</div>
			</div>
			<textarea id="content" class="form-control" rows="8" placeholder="기록하고 싶은 내용을 입력해주세요(최대 150자)" maxlength="150"></textarea>
		</div>
		<div class="noti-box mb-3">
			<div class="text-count-noti content noti text-danger d-none">내용은 150자까지 입력할 수 있습니다.</div>
		</div>
		<hr>
		<!-- 평가 -->
		<div class="form-group d-flex justify-content-between align-items-center">
			<label>평가<span class="required">*</span></label>
			<div class="rating-box d-flex align-items-center">
				<label for="good" title="좋음" class="d-flex align-items-center">
					<input type="radio" value="좋음" name="rating" id="good" class="rating">
					<span class="rating-icon good material-icons ml-1">sentiment_satisfied_alt</span>
				</label>
				<label for="normal" title="보통" class="d-flex align-items-center ml-2">
					<input type="radio" value="보통" name="rating" id="normal" class="rating">
					<span class="rating-icon normal material-icons ml-1">sentiment_neutral</span>
				</label>
				<label for="bad" title="별로" class="d-flex align-items-center ml-2">
					<input type="radio" value="별로" name="rating" id="bad" class="rating">
					<span class="rating-icon bad material-icons ml-1">sentiment_very_dissatisfied</span>
				</label>
			</div>
		</div>
		<!-- 구매횟수 -->
		<div class="form-group d-flex justify-content-between align-items-center">
			<div class="noti-box d-flex">
				<label for="purchaseCount">구매횟수</label>
				<div class="noti-info d-flex align-items-end ml-1">
					<span class="icon-info material-icons-outlined">info</span>
					<span class="noti hover-block ml-1">0 ~ 999회</span>
				</div>
			</div>
			<input type="number" id="purchaseCount" class="form-control col-5">
		</div>
		<div class="noti-box mb-3">
			<div class="number-count-noti noti text-danger d-none">0회부터 999회까지만 입력할 수 있습니다.</div>
		</div>
		<!-- 구매일 -->
		<div class="form-group d-flex justify-content-between align-items-center">
			<div class="noti-box d-flex">
				<label for="purchaseDate">구매일</label>
				<div class="noti-info d-flex align-items-end ml-1">
					<span class="icon-info material-icons-outlined">info</span>
					<span class="noti hover-block ml-1">yyyy-mm-dd</span>
				</div>
			</div>
			<input type="text" id="purchaseDate" class="form-control col-5" placeholder="날짜 선택">
		</div>
		<!-- 사진 -->
		<div class="form-group d-flex justify-content-between align-items-center">
			<div class="file-upload d-flex align-items-center">
				<label for="file">사진</label>
				<!-- 파일 첨부 -->
				<button type="button" id="fileUploadBtn" class="btn-add-photo material-icons-outlined">add_photo_alternate</button>
				<input type="file" id="fileInput" class="d-none" multiple="multiple" accept=".gif, .jpg, .jpeg, .png">
			</div>
			<div class="noti">최대 2개 (jpg, jpeg, png, gif)</div>
		</div>
		<div id="fileName" class="upload-file-name mt-1"><!-- 업로드된 파일명 노출 --></div>
		<!-- 첨부 이미지 미리보기 -->
		<div id="preview" class="image-box d-flex justify-content-between my-3"><!-- 첨부된 이미지 노출 영역 --></div>
		<!-- 위치 -->
		<div class="form-group d-flex justify-content-between align-items-center">
			<div class="d-flex align-items-center mb-2">
				<label for="location">위치</label>
				<button type="button" onclick="execDaumPostcode()" class="btn-location material-icons-outlined">add_location_alt</button>
			</div>
		</div>
		<div class="d-flex align-items-center">
			<div id="address" class="location-address"><!-- 지도에 뿌릴 주소명 노출 --></div>
			<button type="button" id="addressClearBtn" class="btn-clear material-icons ml-2 d-none">clear</button>
		</div>
	</div>
	<div class="btn-box my-4">
		<button type="button" id="createBtn" class="btn btn-block btn-dark">저장</button>
	</div>
</section>

<!-- 다음지도 주소검색 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=39a4fdf39fcdea33b96f40e1d8522d02&libraries=services"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("address").innerText = addr;
                // 주소 삭제버튼 노출
                document.getElementById("addressClearBtn").className+="d-block";
            }
        }).open();
    }
</script>

<script>
$(document).ready(function() {
	
	// datepicker
	$('#purchaseDate').datepicker({
		dateFormat: 'yy-mm-dd'
		, prevText: '이전 달'
		, nextText: '다음 달'
		, monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
		, monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
		, dayNames: ['일', '월', '화', '수', '목', '금', '토']
		, dayNamesShort: ['일', '월', '화', '수', '목', '금', '토']
		, dayNamesMin: ['일', '월', '화', '수', '목', '금', '토']
		, showMonthAfterYear: true
		, yearSuffix: '년'
	});

	// 글자수 제한
	$('#subject').keyup(function(e) {
		let subject = $('#subject').val();
		
		// 글자수 세기
		if (subject.length == 0 || subject == '') {
			$('.text-count.subject').text('0');
		} else {
			$('.text-count.subject').text(subject.length);
		}
		
		// 글자수 제한
		if (subject.length > 20) {
			// 20자부터 타이핑 막기
			$(this).val($(this).val().substring(0, 21));
			// 20자 이상 알림
			$('.text-count-noti.subject').removeClass('d-none');
		} else {
			$('.text-count-noti.subject').addClass('d-none');
		}
	});
	$('#content').keyup(function(e) {
		let content = $(this).val();
		
		// 글자수 세기
		if (content.length == 0 || content == '') {
			$('.text-count.content').text('0');
		} else {
			$('.text-count.content').text(content.length);
		}
		
		// 글자수 제한
		if (content.length > 150) {
			// 150자부터 타이핑 막기
			$(this).val($(this).val().substring(0, 151));
			// 150자 이상 알림
			$('.text-count-noti.content').removeClass('d-none');
		} else {
			$('.text-count-noti.content').addClass('d-none');
		}
	});
	// 구매횟수 숫자 제한
	$('#purchaseCount').keyup(function(e) {
		let purchaseNumber = $(this).val();
		if (purchaseNumber < 0 || purchaseNumber > 999) {
			$('.number-count-noti').removeClass('d-none');
		} else {
			$('.number-count-noti').addClass('d-none');
		}
	});

	// 주소 삭제
	$('#addressClearBtn').on('click', function() {
		$('#address').text('');
		$(this).addClass('d-none');
	});
	
	// 파일 업로드 버튼 대체
	$('#fileUploadBtn').on('click', function(e) {
		e.preventDefault();
		$('#fileInput').click();
	});
	// 파일 업로드 유효성 검사
	$('#fileInput').on('change', function(e) {
		let fileName = e.target.files[0].name;
		let ext = fileName.split('.').pop().toLowerCase();
		
		// 확장자 유효성 확인
		if (fileName.split('.').length < 2 || 
				(ext != 'gif' 
						&& ext != 'jpg' 
						&& ext != 'jpeg' 
						&& ext != 'png')) {
			alert("이미지 파일만 업로드 할 수 있습니다.");
			$(this).val(''); // 파일 태그의 실제 파일 제거
			$('#fileName').text(''); // 파일 이름 비우기
			return;
		}
		
		// 업로드 된 파일명 노출
		$('#fileName').text(fileName);
	});

	// 파일 이미지 미리보기
	var sel_files = [];
	$('#fileInput').on('change', handleImgsFilesSelect);
	function handleImgsFilesSelect(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f) {
			sel_files.push(f);
			// 파일 2개 초과해서 첨부하려 할 때
			if (sel_files.length > 2) {
				alert('파일은 2개까지만 첨부할 수 있습니다.');
				return false;
			}
			// 첨부 이미지 태그 생성
			var reader = new FileReader();
			reader.onload = function(e) {
				var img_html = "<div class='image'><img src=\'" + e.target.result + "\' /></div>";
				$('#preview').append(img_html);
			}
			reader.readAsDataURL(f);
		});
	}
	
	// 글쓰기 저장
	$('#createBtn').on('click', function() {
		// 필수
		let categoryId = $('#category').val();
		let subject = $('#subject').val().trim();
		let content = $('#content').val();
		let rating = $('input[name=rating]:checked').val();
		// 필수아님
		let purchaseNumber = $('#purchaseCount').val();
		let purchaseDate = $('#purchaseDate').val();
		let file = $('#fileInput').val();
		let location = $('#address').text();
		
		// 유효성 검사
		if (categoryId == '') {
			alert('카테고리를 선택해주세요.');
			$('#category').focus();
			return;
		}
		if (subject == '') {
			alert('제목을 입력해주세요.');
			$('#subject').focus();
			return;
		}
		if (content == '') {
			alert('내용을 입력해주세요.');
			$('#content').focus();
			return;
		}
		if (rating == null) {
			alert('평가 항목을 선택해주세요.');
			return;
		}

		let formData = new FormData();
		formData.append("categoryId", categoryId);
		formData.append("subject", subject);
		formData.append("content", content);
		formData.append("rating", rating);
		formData.append("purchaseNumber", purchaseNumber);
		formData.append("purchaseDate", purchaseDate);
		formData.append("location", location);
		for (var i = 0; i < sel_files.length; i++) {
			formData.append("file", sel_files[i]);
		}
		
		// ajax
		$.ajax({
			type: 'post'
			, url: '/post/create'
			, data: formData
			// 파일 업로드를 위한 필수 설정 3가지
			, enctype: "multipart/form-data"
			, processData: false
			, contentType: false
		
			, success: function(data) {
				if (data.code == 100) {
					// 성공
					alert('저장되었습니다.');
					document.location.href='/post/post_list_view';
				} else {
					// 에러
					alert(data.errorMessage);
				}
			}
			, error: function(e) {
				alert('글쓰기 에러');
			}
		});
	});
});
</script>