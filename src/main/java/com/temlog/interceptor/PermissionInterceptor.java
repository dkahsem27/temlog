package com.temlog.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class PermissionInterceptor implements HandlerInterceptor {

	private Logger log = LoggerFactory.getLogger(this.getClass());

	@Override
	public boolean preHandle(
			HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {

		// 세션이 있는지 확인 => 있으면 로그인 상태
		HttpSession session = request.getSession();
		String userLoginId = (String)session.getAttribute("userLoginId");

		// 요청 url path를 가져온다.
		String uri = request.getRequestURI();
		log.info("[######## prehandle] uri:{}", uri);

		// 비로그인 && /post => 로그인 페이지로 리다이렉트
		if (userLoginId == null && uri.startsWith("/post")) {
			response.sendRedirect("/user/sign_in_view");
			return false;
		}
		// 비로그인 && /category => 로그인 페이지로 리다이렉트
		if (userLoginId == null && uri.startsWith("/category")) {
			response.sendRedirect("/user/sign_in_view");
			return false;
		}
		// 비로그인 && /schedule => 로그인 페이지로 리다이렉트
		if (userLoginId == null && uri.startsWith("/schedule")) {
			response.sendRedirect("/user/sign_in_view");
			return false;
		}
		// 비로그인 && /account_view(내 정보) => 로그인 페이지로 리다이렉트
		if (userLoginId == null && uri.equals("/account_view")) {
			response.sendRedirect("/user/sign_in_view");
			return false;
		}
		// 비로그인 && /main_view(홈) => 로그인 페이지로 리다이렉트
		if (userLoginId == null && uri.equals("/main_view")) {
			response.sendRedirect("/user/sign_in_view");
			return false;
		}
		
		// 로그인 && /user => 메인(홈) 페이지로 리다이렉트
		if (userLoginId != null && uri.startsWith("/user")) {
			response.sendRedirect("/main_view");
			return false;
		}
		
		// 컨트롤러 수행
		return true;
	}

	@Override
	public void postHandle(
			HttpServletRequest request, 
			HttpServletResponse response, Object handler, ModelAndView modelAndView) {

		log.info("[######## postHandle]");
	}

	@Override
	public void afterCompletion(HttpServletRequest request, 
			HttpServletResponse response, Object handler, Exception ex) {

		log.info("[######## afterCompletion]");
	}
}
