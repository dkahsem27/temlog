<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						<option selected>카테고리 선택</option>
						<option value="1">카테고리명1</option>
						<option value="2">카테고리명카테고리명</option>
						<option value="3">카테고리명33</option>
					</select>
				</div>
			</div>
		</div>
		<!-- 글 제목 -->
		<div class="form-group">
			<label for="subject" class="mb-2">제목<span class="required">*</span></label>
			<input type="text" id="subject" class="form-control" placeholder="기록하고 싶은 항목을 입력해주세요(최대 20자)">
		</div>
		<!-- 글 내용 -->
		<div class="form-group">
			<label for="content" class="mb-2">내용<span class="required">*</span></label>
			<textarea id="content" class="form-control" rows="8" placeholder="기록하고 싶은 내용을 입력해주세요(최대 150자)"></textarea>
		</div>
		<hr>
		<!-- 평가 -->
		<div class="form-group d-flex justify-content-between align-items-center">
			<label for="rating">평가<span class="required">*</span></label>
			<div class="rating-box d-flex align-items-center">
				<button type="button" id="goodBtn" class="rating"><span class="rating-icon good material-icons">sentiment_satisfied_alt</span></button> <!-- 좋음 -->
				<button type="button" id="normalBtn" class="rating"><span class="rating-icon normal material-icons">sentiment_neutral</span></button> <!-- 보통 -->
				<button type="button" id="badBtn" class="rating"><span class="rating-icon bad material-icons">sentiment_very_dissatisfied</span></button> <!-- 별로 -->
			</div>
		</div>
		<!-- 구매횟수 -->
		<div class="form-group d-flex justify-content-between align-items-center">
			<div class="noti-box d-flex">
				<label for="purchaseCount">구매횟수</label>
				<div class="noti-info d-flex align-items-end ml-1">
					<span class="icon-info material-icons-outlined">info</span>
					<span class="noti hover-block ml-1">0회 ~ 999회</span>
				</div>
			</div>
			<input type="number" id="purchaseCount" class="form-control col-5">
		</div>
		<!-- 구매일 -->
		<div class="form-group d-flex justify-content-between align-items-center">
			<div class="noti-box d-flex">
				<label for="purchaseDate">구매일</label>
				<div class="noti-info d-flex align-items-end ml-1">
					<span class="icon-info material-icons-outlined">info</span>
					<span class="noti hover-block ml-1">최초 구매일</span>
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
				<input type="file" id="file" class="d-none" accept=".gif, .jpg, .jpeg, .png">
			</div>
			<div class="noti">최대 2개 (jpg, jpeg, png, gif)</div>
		</div>
		<div id="fileName" class="upload-file-name mt-1"><!-- 업로드된 파일명 노출 --></div>
		<!-- 첨부 이미지 영역 -->
		<div class="image-box d-flex justify-content-between my-3">
			<img src="https://cdn.pixabay.com/photo/2019/11/23/07/24/christmas-4646421_960_720.jpg" alt="첨부이미지">
			<img src="https://cdn.pixabay.com/photo/2021/12/12/20/17/drink-6865996_960_720.jpg" alt="첨부이미지">
		</div>
		<!-- 위치 -->
		<div class="form-group">
			<div class="d-flex align-items-center mb-2">
				<label for="location">위치</label>
				<button type="button" class="btn-location material-icons-outlined">place</button>
			</div>
		</div>
		<div id="locationAddress" class="location-address mt-1">주소명이 여기에 노출됩니다. <!-- 지도에 뿌릴 주소명 노출 --></div>
		<!-- 지도 표시 영역 : 상세에서만 표시 -->
		<!-- <div id="map" class="map-box"></div> -->
	</div>
	<div class="btn-box my-4">
		<button type="button" id="createBtn" class="btn btn-block btn-dark">저장</button>
	</div>
</section>

<script>
$(document).ready(function() {
	// 파일 업로드 버튼
	$('#fileUploadBtn').on('click', function(e) {
		e.preventDefault();
		$('#file').click();
	});
	// 파일 업로드 유효성 검사
	$('#file').on('change', function(e) {
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
});
</script>