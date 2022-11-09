<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav id="navigation" class="d-flex align-items-center">
	<ul class="nav nav-fill w-100">
		<li class="nav-item py-1"> <!-- on 클래스 추가시 focus -->
			<a href="/main_view" class="nav-link">
				<div class="nav-link-inner">
					<div class="nav-icon material-icons">home</div>
					<div class="nav-text">홈</div>
				</div>
			</a>
		</li>
		<li class="nav-item py-1">
			<a href="/post/post_list_view" class="nav-link">
				<div class="nav-link-inner">
					<div class="nav-icon material-icons">event_note</div>
					<div class="nav-text">기록</div>
				</div>
			</a>
		</li>
		<li class="nav-item py-1">
			<a href="/schedule/schedule_main_view" class="nav-link">
				<div class="nav-link-inner">
					<div class="nav-icon material-icons">event</div>
					<div class="nav-text">일정</div>
				</div>
			</a>
		</li>
		<li class="nav-item py-1">
			<a href="/account_view" class="nav-link">
				<div class="nav-link-inner">
					<div class="nav-icon material-icons">account_circle</div>
					<div class="nav-text">내정보</div>
				</div>
			</a>
		</li>
	</ul>
</nav>