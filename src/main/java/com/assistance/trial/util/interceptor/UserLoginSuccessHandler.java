package com.assistance.trial.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.assistance.trial.command.AccountVO;


public class UserLoginSuccessHandler implements HandlerInterceptor{

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		ModelMap mv=modelAndView.getModelMap();
		AccountVO vo=(AccountVO)mv.get("user");
		
		if(vo ==null) {
			modelAndView.addObject("msg", "loginFail");
			modelAndView.setViewName("/account/login");
		}else {
			HttpSession session=request.getSession();
			session.setAttribute("login", vo);			
			response.sendRedirect(request.getContextPath()); 

		}
		
	}
}
