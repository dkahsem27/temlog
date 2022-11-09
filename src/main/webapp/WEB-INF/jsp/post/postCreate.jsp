<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="post-area">
	<div class="subject-box d-flex justify-content-between align-items-end mb-5">
		<h2 class="form-title">기록하기</h2>
		<a href="/user/sign_in_view" class="btn-cancle">취소</a>
	</div>
	<div class="form-outer">
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
		<div class="form-group">
			<label for="subject" class="mb-2">제목<span class="required">*</span></label>
			<input type="text" id="subject" class="form-control" placeholder="기록하고 싶은 항목을 입력해주세요(최대 20자)">
		</div>
		<div class="form-group">
			<label for="content" class="mb-2">내용<span class="required">*</span></label>
			<textarea id="content" class="form-control" rows="8" placeholder="기록하고 싶은 내용을 입력해주세요(최대 150자)"></textarea>
		</div>
		<hr>
		<div class="form-group d-flex justify-content-between align-items-center">
			<label for="rating">평가<span class="required">*</span></label>
			<div class="rating-box d-flex align-items-center">
				<button type="button" id="goodBtn" class="rating"><span class="rating-icon good material-icons">sentiment_satisfied_alt</span></button> <!-- 좋음 -->
				<button type="button" id="normalBtn" class="rating"><span class="rating-icon normal material-icons">sentiment_neutral</span></button> <!-- 보통 -->
				<button type="button" id="badBtn" class="rating"><span class="rating-icon bad material-icons">sentiment_very_dissatisfied</span></button> <!-- 별로 -->
			</div>
		</div>
		<div class="form-group d-flex justify-content-between align-items-center">
			<div class="noti-box d-flex">
				<label for="purchaseCount">구매횟수</label>
				<div class="noti-info d-flex align-items-end ml-1">
					<span class="icon-info material-icons-outlined">info</span>
					<span class="noti hover-block ml-1">0 ~ 999까지 입력할 수 있습니다</span>
				</div>
			</div>
			<input type="number" id="purchaseCount" class="form-control col-4">
		</div>
		<div class="form-group d-flex justify-content-between align-items-center">
			<div class="noti-box d-flex">
				<label for="datePicker">구매일</label>
				<div class="noti-info d-flex align-items-end ml-1">
					<span class="icon-info material-icons-outlined">info</span>
					<span class="noti hover-block ml-1">최초구매일을 선택해주세요</span>
				</div>
			</div>
			<input type="text" id="datePicker" class="form-control col-4" placeholder="날짜 선택">
		</div>
		<div class="form-group d-flex justify-content-between align-items-center">
			<div class="d-flex align-items-center">
				<label for="imageFile">사진</label>
				<button type="button" class="btn-add-photo material-icons-outlined">add_photo_alternate</button>
				<input type="file" id="imageFile" class="d-none"> <!-- 숨길 영역 -->
			</div>
			<span class="noti">최대 2개 (jpg, jpeg, png, gif)</span>
		</div>
		<div class="form-group d-flex justify-content-between align-items-center">
			<div class="d-flex align-items-center">
				<label for="location">위치</label>
				<button type="button" class="btn-location material-icons-outlined">place</button>
			</div>
			<!-- 카카오맵 API -->
		</div>
	</div>
	<div class="btn-box mt-5">
		<button type="button" id="createBtn" class="btn btn-block btn-dark">저장</button>
	</div>
</section>

<script>
$(document).ready(function() {
	// datepicker
	$('#datePicker').datepicker({
		dateFormat: 'yy-mm-dd'
	});
});
</script>