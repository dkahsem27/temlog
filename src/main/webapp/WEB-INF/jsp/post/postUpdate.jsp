<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="post-area">
	<div class="subject-box d-flex justify-content-between align-items-end mb-3">
		<div class="d-flex align-items-end">
			<h2 class="form-title">기록하기</h2>
			<span class="tag tag-modify ml-2">수정</span>
		</div>
		<a href="/post/post_detail_view" class="btn-cancle">취소</a>
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
				<button type="button" title="좋음" id="goodBtn" class="rating">
					<span class="rating-icon good material-icons non-selected">sentiment_satisfied_alt</span>
				</button> <!-- 좋음 -->
				<button type="button" title="보통" id="normalBtn" class="rating">
					<span class="rating-icon normal material-icons non-selected">sentiment_neutral</span>
				</button> <!-- 보통 -->
				<button type="button" title="별로" id="badBtn" class="rating">
					<span class="rating-icon bad material-icons non-selected">sentiment_very_dissatisfied</span>
				</button> <!-- 별로 -->
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
				<input type="file" id="fileInput" class="d-none" accept=".gif, .jpg, .jpeg, .png">
			</div>
			<div class="noti">최대 2개 (jpg, jpeg, png, gif)</div>
		</div>
		<div id="fileName" class="upload-file-name mt-1"><!-- 업로드된 파일명 노출 --></div>
		<!-- 첨부 이미지 미리보기 -->
		<div id="preview" class="image-box d-flex justify-content-between my-3"><!-- 첨부된 이미지 노출 영역 --></div>
		<!-- 위치 -->
		<div class="form-group">
			<div class="d-flex align-items-center mb-2">
				<label for="location">위치</label>
				<button type="button" onclick="execDaumPostcode()" class="btn-location material-icons-outlined">place</button>
			</div>
		</div>
		<div id="address" class="location-address mt-1"><!-- 지도에 뿌릴 주소명 노출 --></div>
	</div>
	<div class="btn-box my-4">
		<button type="button" id="createBtn" class="btn btn-block btn-dark">저장</button>
	</div>
</section>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=39a4fdf39fcdea33b96f40e1d8522d02&libraries=services"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("address").innerText = addr;
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
			
			var reader = new FileReader();
			reader.onload = function(e) {
				var img_html = "<div class='image'><img src=\'" + e.target.result + "\' /><button type='button' class='btn-delete-image material-icons'>clear</button></div>";
				$('#preview').append(img_html);
			}
			reader.readAsDataURL(f);
		});
	}
});
</script>