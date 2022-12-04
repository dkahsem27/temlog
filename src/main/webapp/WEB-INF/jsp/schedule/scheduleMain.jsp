<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
					<div class="d-flex mb-1">
						<div id="startDate" class="date"></div>
						<span class="betweenDates">&nbsp;~&nbsp;</span>
						<div id="endDate" class="date"></div>
					</div>
					<div id="subject" class="subject mb-2"></div>
					<div id="content" class="schedule-content"></div>
				</div>
				<div class="btn-box d-flex justify-content-center">
					<a href="" id="updateScheduleBtn" class="btn btn-dark col-6">수정</a>
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
<script class="cssdesk" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.0/moment.min.js" type="text/javascript"></script>
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
        
        events: [ // 이벤트(일정)
        	<c:forEach items="${scheduleList}" var="schedule">
            { // 한개의 일정 생성 영역
            	id: ${schedule.id},
              	title: "${schedule.subject}", // 제목
              	start: "<fmt:formatDate value='${schedule.startDate}' pattern='yyyy-MM-dd' />", // 시작일
              	<c:if test="${not empty schedule.endDate}">
             	end: "<fmt:formatDate value='${schedule.endDate}' pattern='yyyy-MM-dd' />", // 종료일 ** 지정일 하루 전 종료 **
             	</c:if>
             	allDay: true, // 종일 (optionable)
             	extendedProps: {
             		content: "${schedule.content}"
             	}
            },
            </c:forEach>
       	],

        // 이벤트 클릭 => 일정상세 모달
        eventClick: function(calendar, event, info) {
        	//alert(info.event.title);
        	//alert(calendar.event.id);
        	
            $('#scheduleDetailModal').modal('show'); // 일정 상세 모달로 연결
            $('#scheduleDetailModal #deleteScheduleBtn').data('schedule-id', calendar.event.id); // 삭제를 위한 id 세팅
            $('#scheduleDetailModal #updateScheduleBtn').data('schedule-id', calendar.event.id); // 수정을 위한 id 세팅
            
            $('#startDate').text(moment(calendar.event.start).format('YYYY년 MM월 DD일'));
            if (calendar.event.end != null) { // 종료일 있을때
            	$('#endDate').text(moment(calendar.event.end).format('YYYY년 MM월 DD일'));
            	$('#endDate').siblings('.betweenDates').css('display', 'block');
            } else if (calendar.event.end == null) { // 종료일 없을때
            	$('#endDate').text('');
            	$('#endDate').siblings('.betweenDates').css('display', 'none');
            }
            $('#subject').text(calendar.event.title);
            $('#content').text(calendar.event.extendedProps.content);
        },
        
        // 날짜가 있는 칸 클릭 => 일정등록 페이지
        /* select: function(date, jsEvent, view) {
            //$('#scheduleDetailModal').modal('show');
            location.href="/schedule/schedule_create_view";
        }, */
	});
	calendar.render();
});
</script>

<script>
$(document).ready(function() {
	// 일정 삭제
	$('#deleteScheduleBtn').on('click', function() {
		let scheduleId = $(this).data('schedule-id');
		
		if (confirm('삭제하시겠습니까?')) {
			$.ajax({
				type: 'delete'
				, url: '/schedule/delete'
				, data: {'scheduleId':scheduleId}
			
				, success: function(data) {
					if (data.code == 100) {
						alert('삭제되었습니다.');
						location.reload();
					} else {
						alert(data.errorMessage);
					}
				}
				, error: function(e) {
					alert('일정 삭제 실패');
				}
			});
		}
	});
	
	// 일정 수정 페이지 이동
	$('#updateScheduleBtn').on('click', function(e) {
		e.preventDefault();
		
		let scheduleId = $(this).data('schedule-id');
		location.href = '/schedule/schedule_update_view?scheduleId=' + scheduleId;
	});
});
</script>