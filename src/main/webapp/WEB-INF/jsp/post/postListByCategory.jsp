<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section class="contents-inner">
	<!-- head -->
	<jsp:include page="../include/postHead.jsp" />
	<!-- content -->
	<!-- 검색창 -->
	<div class="search-box d-flex align-items-center py-3">
		<input type="search" id="searchText" class="form-control" placeholder="검색어를 입력해주세요" value="${keyword}">
		<button type="button" id="searchBtn" class="btn-search"><span class="material-icons-outlined">search</span></button>
	</div>
	<!-- 분류 -->
	<div class="util-box dropdown-util-box d-flex justify-content-between align-items-center py-2">
		<div class="dropdown-outer d-flex">
			<div class="dropdown">
				<button type="button" id="dropdownMenuButton" class="btn btn-light btn-sm dropdown-toggle" data-toggle="dropdown">
			    	평가
			  	</button>
			  	<div class="dropdown-menu py-0">
			  		<a class="rating-dropdown dropdown-item p-2" href="#">좋음</a>
				    <a class="rating-dropdown dropdown-item p-2" href="#">보통</a>
				    <a class="rating-dropdown dropdown-item p-2" href="#">별로</a>
			  	</div>
			</div>
			<div class="dropdown ml-2">
				<button type="button" id="dropdownMenuButton" class="btn btn-light btn-sm dropdown-toggle" data-toggle="dropdown">
			    	정렬
			  	</button>
			  	<div class="dropdown-menu py-0">
			  		<a class="sort-dropdown dropdown-item p-2" href="#">등록일</a>
				    <a class="sort-dropdown dropdown-item p-2" href="#">구매일</a>
				    <a class="sort-dropdown dropdown-item p-2" href="#">구매횟수</a>
			  	</div>
			</div>
		</div>
		<div class="list-count">총 <span><!-- 목록 갯수 --></span>건</div>
	</div>
	<!-- 목록 -->
	<div class="post-content-list">
		<ul class="post-list">
			<c:forEach items="${postListByCategory}" var="post">
				<c:if test="${post.rating eq '좋음'}">
				<li class="list-card good">
				</c:if>
				<c:if test="${post.rating eq '보통'}">
				<li class="list-card normal">
				</c:if>
				<c:if test="${post.rating eq '별로'}">
				<li class="list-card bad">
				</c:if>
					<a href="/post/post_detail_view?postId=${post.id}&categoryId=${post.categoryId}" class="card-link p-3">
						<div class="card-inner">
							<div class="card-row d-flex justify-content-between py-1">
								<c:forEach items="${categoryList}" var="category">
									<input type="hidden" value="${post.categoryId}" class="postCategoryId">
									<c:if test="${post.categoryId == category.id}">
										<div class="category-name">${category.categoryName}</div>
									</c:if>
								</c:forEach>
								<c:if test="${not empty post.purchaseNumber}">
									<div class="purchase-count">${post.purchaseNumber}회 구매</div>
								</c:if>
							</div>
							<div class="card-row d-flex justify-content-between align-items-center py-2">
								<div class="subject">${post.subject}</div>
								<c:if test="${post.rating eq '좋음'}">
									<div class="rating"><span class="rating-icon good material-icons">sentiment_satisfied_alt</span></div> <!-- 좋음 -->
								</c:if>
								<c:if test="${post.rating eq '보통'}">
									<div class="rating"><span class="rating-icon normal material-icons">sentiment_neutral</span></div> <!-- 보통 -->
								</c:if>
								<c:if test="${post.rating eq '별로'}">
									<div class="rating"><span class="rating-icon bad material-icons">sentiment_very_dissatisfied</span></div> <!-- 별로 -->
								</c:if>
							</div>
							<div class="content pb-1">${post.content}</div>
						</div>
					</a>
				</li>
			</c:forEach>
		</ul>
		<c:if test="${empty postListByCategory}">
			<div class="empty text-center">목록이 없습니다.</div>
		</c:if>
	</div>
	<!-- navi -->
	<jsp:include page="../include/nav.jsp" />
</section>

<script>
$(document).ready(function() {
	// 헤드 텍스트-카테고리명 클릭시 페이지 이동
	$('#pageTitle').on('click', function() {
		let postCategoryId = $('.postCategoryId').val();
		location.href='/post/post_list_by_category_view/' + postCategoryId;
	});
	
	// 엔터로 검색
	let searchText = document.getElementById('searchText');
	searchText.addEventListener('keyup', function(event) {
		if (event.keyCode === 13) {
			event.preventDefault();
			$('#searchBtn').click();
		}
	});
	
	// 검색
	$('#searchBtn').on('click', function() {
		let keyword = $('#searchText').val().trim();
		// 유효성 검사
		if (keyword == '') {
			alert('검색어를 입력해주세요.');
			$('#searchText').focus();
			return;
		}
		let postCategoryId = $('.postCategoryId').val();
		location.href='/post/post_list_by_category_view/' + postCategoryId + '?keyword=' + keyword;
	});

	// 분류(평가)
	$('.rating-dropdown').on('click', function(e) {
		e.preventDefault();
		let postCategoryId = $('.postCategoryId').val();
		let rating = $(this).text().trim(); // 좋음, 보통, 나쁨
		location.href='/post/post_list_by_category_view/' + postCategoryId + '?rating=' + rating;
	});
	
	// 분류(정렬)
	$('.sort-dropdown').on('click', function(e) {
		e.preventDefault();
		let postCategoryId = $('.postCategoryId').val();
		let sort = $(this).text().trim(); // 등록일, 구매일, 구매횟수
		location.href='/post/post_list_by_category_view/' + postCategoryId + '?sort=' + sort;
	});

	// 목록 갯수 출력
	let listCount = $('.post-list > li').length;
	$('.list-count > span').text(listCount);
});
</script>