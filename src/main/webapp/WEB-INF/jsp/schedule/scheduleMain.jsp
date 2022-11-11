<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="contents-inner">
	<!-- head -->
	<jsp:include page="../include/scheduleHead.jsp" />
	<!-- content -->
	<div class="schedule-content py-3">
		<!-- 캘린더 -->
		<div id="calendar"></div>
		<!-- 모달버튼 -->
		<!-- <button type="button" class="btn-more" data-toggle="modal" data-target="#modal">
			일정상세모달버튼
		</button> -->
	</div>
	<!-- navi -->
	<jsp:include page="../include/nav.jsp" />
</section>

<!-- Modal -->
<div class="modal fade" id="modal">
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

<!-- fullcalendar -->
<link href='/static/fullcalendar/main.css' rel='stylesheet' />
<script src='/static/fullcalendar/main.js'></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		
		initialView: 'dayGridMonth',
		
		// 툴바 관련 문서
		// https://fullcalendar.io/docs/toolbar
        headerToolbar: {
            end: 'today prev,next'
        },
        buttonText: {
        	today: '오늘'
        },
        
		selectable: true, // 날짜 선택 가능 여부
        selectMirror: true, // 날짜 드래그 선택 가능 여부
        
        editable: true,
        
        // 날짜 클릭 -> 일정등록 페이지
        /* select: function() {
        	
        }, */
        
        // 이벤트 클릭 -> 일정상세 모달
        eventClick: function(info) {
        	info.jsEvent.preventDefault();

            if (info.event.url) {
              window.open(info.event.url);
            }
        },
        
        // 이벤트 관련 문서
        // https://fullcalendar.io/docs/event-parsing
        events: [
            { // 한개의 이벤트 생성 영역
              	title: 'The Title', // 제목
              	start: '2022-11-01', // 시작일
             	 end: '2022-11-05' // 종료일 ** 지정일 하루 전 종료 **
            },
            {
              	title: 'The Title',
              	start: '2022-11-11',
             	 allDay: true, // 종일 (optionable)
             	 url: 'http://google.com/',
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