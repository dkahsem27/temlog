<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<section class="post-area">
	<!-- 글 수정 / 삭제 모달버튼 -->
	<div class="util-box d-flex justify-content-between py-3">
		<a href="/post/post_list_view" class="btn-back material-icons px-1">arrow_back</a>
		<button type="button" class="btn-more" data-toggle="modal" data-target="#modal">
			<span class="material-icons">more_horiz</span>
		</button>
	</div>
	<!-- 카테고리 / 구매횟수 -->
	<div class="detail-top d-flex justify-content-between align-items-center pb-2">
		<span class="tag tag-category">${category.categoryName}</span>
		<c:if test="${not empty post.purchaseNumber}">
			<div class="purchase-count">
				<span class="c-red">${post.purchaseNumber}</span>회 구매
			</div>
		</c:if>
	</div>
	<div class="detail-content py-3">
		<!-- 글 제목 / 평가 -->
		<div class="content-subject d-flex justify-content-between align-items-center mb-3">
			<div class="subject">${post.subject}</div>
			<c:if test="${post.rating eq '좋음'}">
				<div class="rating mx-2"><span class="rating-icon good material-icons">sentiment_satisfied_alt</span></div> <!-- 좋음 -->
			</c:if>
			<c:if test="${post.rating eq '보통'}">
				<div class="rating mx-2"><span class="rating-icon normal material-icons">sentiment_neutral</span></div> <!-- 보통 -->
			</c:if>
			<c:if test="${post.rating eq '별로'}">
				<div class="rating mx-2"><span class="rating-icon bad material-icons">sentiment_very_dissatisfied</span></div> <!-- 별로 -->
			</c:if>
		</div>
		<!-- 구매일 -->
		<c:if test="${not empty post.purchaseDate}">
			<div class="purchase-date">구매일: <fmt:formatDate value="${post.purchaseDate}" pattern="yyyy-MM-dd" /></div>
		</c:if>
		<!-- 글 내용 -->
		<div class="content my-2 py-4">${post.content}</div>
		<!-- 첨부 이미지 영역 -->
		<c:if test="${not empty imagePathList}">
			<div class="image-box d-flex justify-content-between mb-3">
				<c:forEach items="${imagePathList}" var="imagePath">
				<div class="image detail" data-toggle="modal" data-target="#imageModal">
					<img src="${imagePath}" alt="첨부이미지">
				</div>
				</c:forEach>
			</div>
		</c:if>
		<!-- 지도 표시 영역 -->
		<c:if test="${not empty post.location}">
			<div id="map" class="map-box mb-3"></div>
		</c:if>
		<!-- 등록일 / 수정일 -->
		<div class="date-box text-right pt-2">
			<div class="created-date">등록 | <fmt:formatDate value="${post.createdAt}" pattern="yyyy-MM-dd" /></div>
			<div class="updated-date">마지막 수정 | <fmt:formatDate value="${post.updatedAt}" pattern="yyyy-MM-dd" /></div>
		</div>
	</div>
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
					<div class="subject mb-2">${post.subject}</div>
					<div class="post-content">${post.content}</div>
				</div>
				<div class="btn-box d-flex justify-content-center">
					<a href="/post/post_update_view?postId=${post.id}" id="updatePostBtn" class="btn btn-dark col-6">수정</a>
					<button type="button" id="deletePostBtn" class="btn btn-secondary col-6 ml-2" data-post-id="${post.id}">삭제</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Image Modal -->
<div class="modal fade" id="imageModal">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<!-- 모달 내용 -->
			<div class="modal-box p-2">
				<div class="d-flex justify-content-center mb-2">
					<button type="button" class="btn-close material-icons" data-dismiss="modal">close</button>
				</div>
				<%-- <div class="image-box">
					<c:forEach items="${imagePathList}" var="imagePath">
						<img src="${imagePath}" alt="첨부이미지">
					</c:forEach>
				</div> --%>
				<!-- swiper -->
				<div class="swiper">
					<!-- wrapper -->
					<div class="swiper-wrapper">
					<c:forEach items="${imagePathList}" var="imagePath">
						<div class="swiper-slide"><img src="${imagePath}" alt="첨부이미지"></div>
					</c:forEach>
					</div>
					<!-- pagination -->
					<div class="swiper-pagination"></div>
					<!-- navigation buttons -->
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=39a4fdf39fcdea33b96f40e1d8522d02&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${post.location}', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>

<script>
$(document).ready(function() {
	// 삭제버튼
	$('#deletePostBtn').on('click', function() {
		if (confirm('삭제하시겠습니까?')) {
			let postId = $(this).data('post-id');
			
			$.ajax({
				type: 'delete'
				, url: '/post/delete'
				, data: {'postId':postId}
			
				, success: function(data) {
					if (data.code == 100) {
						alert('삭제되었습니다.');
						location.href='/post/post_list_view';
					} else {
						alert(data.errorMessage);
					}
				}
				, error: function(e) {
					alert('글 삭제 실패');
				}
			});
		}
	});
});


//swiper
const swiper = new Swiper('.swiper', {
	// Optional parameters
	direction: 'horizontal', // 슬라이드 방향
	loop: false,
	
	pagination: {
	 el: '.swiper-pagination',
	},
	
	navigation: {
	 nextEl: '.swiper-button-next',
	 prevEl: '.swiper-button-prev',
	},
});
</script>