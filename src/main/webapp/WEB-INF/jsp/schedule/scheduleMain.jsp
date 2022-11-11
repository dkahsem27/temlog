<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="contents-inner">
	<!-- head -->
	<jsp:include page="../include/scheduleHead.jsp" />
	<!-- content -->
	<div class="schedule-content py-3">
		<div id="calendar"><!-- 캘린더 --></div>
	</div>
	<!-- navi -->
	<jsp:include page="../include/nav.jsp" />
</section>

<!-- 모달버튼 -->
<!-- <button type="button" data-toggle="modal" data-target="#scheduleDetailModal">모달버튼</button> -->
<!-- Modal -->
<div class="modal fade" id="scheduleDetailModal">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<!-- 모달 내용 -->
			<div class="modal-box p-4">
				<div class="d-flex justify-content-center mb-4">
					<button type="button" class="btn-close material-icons" data-dismiss="modal">close</button>
				</div>
				<div class="content mb-5">
					<div class="date mb-1">2022년 11월 1일</div>
					<div class="subject mb-2">[약속] 약속내용 어쩌고 저쩌고 말줄임 없이</div>
					<div class="schedule-content">내용입니다 내용은 50자까지 말줄임 없이 뿌린다. 내용입니다 내용은 50자까지 말줄임 없이 뿌린다.</div>
				</div>
				<div class="btn-box d-flex justify-content-center">
					<a href="/schedule/schedule_update_view" id="updateScheduleBtn" class="btn btn-dark col-6">수정</a>
					<button type="button" id="deleteScheduleBtn" class="btn btn-secondary col-6 ml-2">삭제</button>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- fullCalendar -->
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		// 툴바 관련 문서 https://fullcalendar.io/docs/toolbar
		// 이벤트 관련 문서 https://fullcalendar.io/docs/event-parsing
		
		initialView: 'dayGridMonth',
		
        headerToolbar: { // 헤더 툴바 영역
            end: 'today prev,next'
        },
        buttonText: { // 버튼명 변경 옵션
        	today: '오늘'
        },
        
		selectable: true, // 날짜 선택 가능 여부
        selectMirror: true, // 날짜 드래그 선택 가능 여부
        editable: true,
        
        // 날짜가 있는 칸 클릭 => 일정등록 페이지
        select: function(date, jsEvent, view) {
            //$('#scheduleDetailModal').modal('show');
            location.href="/schedule/schedule_create_view";
        },
        
        // 이벤트 클릭 => 일정상세 모달
        eventClick: function(event) {
            var modal = $("#scheduleDetailModal");
            modal.modal();
        },
        
        events: [ // 이벤트(일정)
            { // 한개의 일정 생성 영역
              	title: '일정 제목입니다', // 제목
              	start: '2022-11-01', // 시작일
             	end: '2022-11-05' // 종료일 ** 지정일 하루 전 종료 **
            },
            {
              	title: '일정 제목입니다',
              	start: '2022-11-11',
             	allDay: true, // 종일 (optionable)
            }
       	]
	});
	calendar.render();
});
</script>

<script>
$(document).ready(function() {
	// 삭제버튼
	$('#deleteScheduleBtn').on('click', function() {
		if (confirm('삭제하시겠습니까?')) {
			alert('삭제되었습니다.');
		}
	});
});
</script>