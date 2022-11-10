<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="post-area">
	<!-- 글 수정 / 삭제 모달버튼 -->
	<div class="util-box d-flex justify-content-end py-3">
		<button type="button" class="btn-more" data-toggle="modal" data-target="#modal">
			<span class="material-icons c-gray">more_horiz</span>
		</button>
	</div>
	<!-- 카테고리 / 구매횟수 -->
	<div class="detail-top d-flex justify-content-between align-items-center pb-2">
		<span class="tag tag-category">카테고리명카테고리명</span>
		<div class="purchase-count"><span class="c-red">999</span>회 구매</div>
	</div>
	<div class="detail-content py-3">
		<!-- 글 제목 / 평가 -->
		<div class="content-subject d-flex justify-content-between align-items-center mb-3">
			<div class="subject">제목입니다 제목은 20자까지 가능합니다. 두 줄이상이면 말줄임 되겠지만 사실상 두 줄이 넘을 수가 없음</div>
			<div class="rating mx-2"><span class="rating-icon good material-icons">sentiment_satisfied_alt</span></div> <!-- 좋음 -->
			<!-- <div class="rating mx-2"><span class="rating-icon normal material-icons">sentiment_neutral</span></div> --> <!-- 보통 -->
			<!-- <div class="rating mx-2"><span class="rating-icon bad material-icons">sentiment_very_dissatisfied</span></div> --> <!-- 별로 -->
		</div>
		<!-- 구매일 -->
		<div class="purchase-date">구매일: 2022-11-01</div>
		<!-- 글 내용 -->
		<div class="content my-2 py-4">내용입니다 내용 내용은 150자까지 가능
		
			청춘을 위하여 생명을 너의 곧 그들의 남는 목숨이 그들에게 있는가?
			피고 대중을 끓는 우리의 황금시대의 얼음에 간에 위하여서, 이것이다. 들어 창공에 얼마나 것이다.
			
			그들은 보이는 새가 이것이다. 같지 희망의 구할 품으며, 운다.
		</div>
		<!-- 첨부 이미지 영역 -->
		<div class="image-box d-flex justify-content-between mb-3">
			<img src="https://cdn.pixabay.com/photo/2019/11/23/07/24/christmas-4646421_960_720.jpg" alt="첨부이미지">
			<img src="https://cdn.pixabay.com/photo/2021/12/12/20/17/drink-6865996_960_720.jpg" alt="첨부이미지">
		</div>
		<!-- 지도 표시 영역 -->
		<div id="map" class="map-box mb-3"></div>
		<!-- 등록일 / 수정일 -->
		<div class="date-box text-right">
			<div class="created-date">등록 | 2022-11-19</div>
			<div class="updated-date">마지막 수정 | 2022-11-19</div>
		</div>
	</div>
	<!-- 목록버튼 -->
	<div class="util-box mt-2 mb-4">
		<a href="/post/post_list_view" class="btn btn-light btn-block">목록</a>
	</div>
</section>

<!-- Modal -->
<div class="modal fade" id="modal">
	<div class="modal-dialog modal-dialog-centered modal-sm">
		<div class="modal-content">
			<!-- 모달 내용 -->
			<div class="modal-box p-4">
				<div class="d-flex justify-content-center mb-4">
					<button type="button" class="btn-close material-icons" data-dismiss="modal">close</button>
				</div>
				<div class="content mb-5">
					<div class="subject mb-2">제목입니다 제목은 20자까지 가능합니다. 말줄임 노노</div>
					<div class="content">내용입니다 내용은 150자 가능하고 1줄 말줄임</div>
				</div>
				<div class="btn-box d-flex justify-content-center">
					<a href="/post/post_update_view" id="updatePostBtn" class="btn btn-dark col-6">수정</a>
					<button type="button" id="deletePostBtn" class="btn btn-secondary col-6 ml-2">삭제</button>
				</div>
			</div>
		</div>
	</div>
</div>