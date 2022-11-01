package com.assistance.trial.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class UserAuthHandler implements HandlerInterceptor {


	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session=request.getSession();

		if(session.getAttribute("login") ==null) {
			System.out.println("오류나서 호출됌");
			response.sendRedirect(request.getContextPath()+"/account/login");
			return false;
		}

		return true; 

	}
}
