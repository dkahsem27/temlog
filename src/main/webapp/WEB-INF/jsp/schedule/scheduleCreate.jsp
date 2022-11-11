<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="schedule-area">
	<div class="subject-box d-flex justify-content-between align-items-end mb-3">
		<h2 class="form-title">일정등록</h2>
		<a href="/schedule/schedule_main_view" class="btn-cancle">취소</a>
	</div>
	<div class="form-outer py-3">
		<!-- 시작날짜 -->
		<div class="form-group">
			<label for="startDate" class="mb-2">시작일 선택<span class="required">*</span></label>
			<input type="text" id="startDate" class="form-control col-5" placeholder="날짜 선택">
		</div>
		<!-- 종료날짜 -->
		<div class="form-group">
			<label for="endDate" class="mb-2">종료일 선택 <span class="noti">(생략 가능)</span></label>
			<input type="text" id="endDate" class="form-control col-5" placeholder="날짜 선택">
		</div>
		<!-- 제목 -->
		<div class="form-group">
			<label for="subject" class="mb-2">제목<span class="required">*</span></label>
			<input type="text" id="subject" class="form-control" placeholder="제목을 입력해주세요(최대 20자)">
		</div>
		<!-- 내용 -->
		<div class="form-group">
			<label for="content" class="mb-2">내용</label>
			<textarea id="content" class="form-control" rows="3" placeholder="내용을 입력해주세요(최대 50자)"></textarea>
		</div>
	</div>
	<div class="btn-box my-4">
		<button type="button" id="schedulCreateBtn" class="btn btn-block btn-dark">저장</button>
	</div>
</section>

<script>
$(document).ready(function() {
	// datepicker
	$('#startDate').datepicker({
		dateFormat: 'yy-mm-dd'
		, prevText: '이전 달'
		, nextText: '다음 달'
		, monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
		//, monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
		//, dayNames: ['일', '월', '화', '수', '목', '금', '토']
		//, dayNamesShort: ['일', '월', '화', '수', '목', '금', '토']
		, dayNamesMin: ['일', '월', '화', '수', '목', '금', '토']
		, showMonthAfterYear: true
		, yearSuffix: '년'
		, onSelect: function (date) {
 			var endDate = $('#endDate');
			var minDate = $(this).datepicker('getDate');
			endDate.datepicker('option', 'minDate', minDate);
		}  
	});
	$('#endDate').datepicker({
		dateFormat: 'yy-mm-dd'
		, prevText: '이전 달'
		, nextText: '다음 달'
		, monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
		, dayNamesMin: ['일', '월', '화', '수', '목', '금', '토']
		, showMonthAfterYear: true
		, yearSuffix: '년'
	});
});
</script>