<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="contents-inner">
	<!-- head -->
	<jsp:include page="../include/head.jsp" />
	<!-- content -->
	<div class="search-box d-flex align-items-center py-3">
		<input type="search" class="form-control" placeholder="검색어를 입력해주세요">
		<button type="button" class="btn-search"><span class="material-icons-outlined">search</span></button>
	</div>
	<div class="util-box dropdown-util-box d-flex justify-content-between align-items-center py-2">
		<div class="dropdown-outer d-flex">
			<div class="dropdown">
				<button type="button" id="dropdownMenuButton" class="btn btn-light btn-sm dropdown-toggle" data-toggle="dropdown">
			    	평가
			  	</button>
			  	<div class="dropdown-menu py-0">
			  		<a class="dropdown-item p-2" href="#">좋음 <span class="rating-icon good material-icons md-18">sentiment_satisfied_alt</span></a>
				    <a class="dropdown-item p-2" href="#">보통 <span class="rating-icon normal material-icons md-18">sentiment_neutral</span></a>
				    <a class="dropdown-item p-2" href="#">별로 <span class="rating-icon bad material-icons md-18">sentiment_very_dissatisfied</span></a>
			  	</div>
			</div>
			<div class="dropdown ml-2">
				<button type="button" id="dropdownMenuButton" class="btn btn-light btn-sm dropdown-toggle" data-toggle="dropdown">
			    	정렬
			  	</button>
			  	<div class="dropdown-menu py-0">
			  		<a class="dropdown-item p-2" href="#">등록일</a>
				    <a class="dropdown-item p-2" href="#">구매일</a>
				    <a class="dropdown-item p-2" href="#">구매횟수</a>
			  	</div>
			</div>
		</div>
		<div class="list-count">총 n건</div>
	</div>
	<div class="post-content-list">
		<ul class="post-list">
			<li class="list-card good">
				<a href="#" class="card-link p-3">
					<div class="card-inner">
						<div class="card-row d-flex justify-content-between py-1">
							<div class="category-name">카테고리명</div>
							<div class="purchase-count">n회 구매</div>
						</div>
						<div class="card-row d-flex justify-content-between align-items-center py-2">
							<div class="subject">제목입니다. 제목입니다.</div>
							<div class="rating"><span class="rating-icon good material-icons">sentiment_satisfied_alt</span></div> <!-- 좋음 -->
							<!-- <div class="rating"><span class="rating-icon normal material-icons">sentiment_neutral</span></div> --> <!-- 보통 -->
							<!-- <div class="rating"><span class="rating-icon bad material-icons">sentiment_very_dissatisfied</span></div> --> <!-- 별로 -->
						</div>
						<div class="content pb-1">글 내용입니다. 길어질 경우 말줄임 표시. 글 내용입니다. 길어질 경우 말줄임 표시.</div>
					</div>
				</a>
			</li>
			<li class="list-card normal">
				<a href="#" class="card-link p-3">
					<div class="card-inner">
						<div class="card-row d-flex justify-content-between py-1">
							<div class="category-name">카테고리명</div>
							<div class="purchase-count">n회 구매</div>
						</div>
						<div class="card-row d-flex justify-content-between align-items-center py-2">
							<div class="subject">제목입니다. 제목입니다. 제목입니다. 제목입니다. 제목입니다.</div>
							<div class="rating"><span class="rating-icon normal material-icons">sentiment_neutral</span></div> <!-- 보통 -->
						</div>
						<div class="content pb-1">글 내용입니다. 길어질 경우 말줄임 표시. 글 내용입니다. 길어질 경우 말줄임 표시.</div>
					</div>
				</a>
			</li>
			<li class="list-card bad">
				<a href="#" class="card-link p-3">
					<div class="card-inner">
						<div class="card-row d-flex justify-content-between py-1">
							<div class="category-name">카테고리명</div>
							<div class="purchase-count">n회 구매</div>
						</div>
						<div class="card-row d-flex justify-content-between align-items-center py-2">
							<div class="subject">제목입니다. 제목입니다. 제목입니다. 제목입니다. 제목입니다.</div>
							<div class="rating"><span class="rating-icon bad material-icons">sentiment_very_dissatisfied</span></div> <!-- 별로 -->
						</div>
						<div class="content pb-1">글 내용입니다. 길어질 경우 말줄임 표시. 글 내용입니다. 길어질 경우 말줄임 표시.</div>
					</div>
				</a>
			</li>
		</ul>
	</div>
	<!-- navi -->
	<jsp:include page="../include/nav.jsp" />
</section>