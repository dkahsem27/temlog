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
			  	<div class="dropdown-menu">
			  		<a class="dropdown-item py-2" href="#">좋음</a>
				    <a class="dropdown-item py-2" href="#">보통</a>
				    <a class="dropdown-item py-2" href="#">별로</a>
			  	</div>
			</div>
			<div class="dropdown ml-2">
				<button type="button" id="dropdownMenuButton" class="btn btn-light btn-sm dropdown-toggle" data-toggle="dropdown">
			    	정렬
			  	</button>
			  	<div class="dropdown-menu">
			  		<a class="dropdown-item py-2" href="#">등록일</a>
				    <a class="dropdown-item py-2" href="#">구매일</a>
				    <a class="dropdown-item py-2" href="#">구매횟수</a>
			  	</div>
			</div>
		</div>
		<div class="list-count">총 n건</div>
	</div>
	<div class="post-content-list">
		list
		list
		list
		list
		list
		list
		list
		list
		list
		list
		list
		list
		list
		list
	</div>
	<!-- navi -->
	<jsp:include page="../include/nav.jsp" />
</section>