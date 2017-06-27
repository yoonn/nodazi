package com.kedu.nodazi.interceptor;


import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kedu.nodazi.dto.UserDto;
import com.kedu.nodazi.service.UserService;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Inject
	private UserService service;
	
	@Override
	public void postHandle(HttpServletRequest request,HttpServletResponse response,Object handler,ModelAndView modelAndView)throws Exception{
		
		HttpSession session = request.getSession();
		ModelMap modelMap = modelAndView.getModelMap();
		Object userDto = modelMap.get("UserDto");
		
		if(userDto != null){
			logger.info("new login success");
			
			UserDto uDto = (UserDto)userDto;
			String u_id = uDto.getU_id();
			Date endDt = service.checkUseService(u_id);
			
			session.setAttribute(LOGIN, userDto);
			session.setAttribute("endDt", endDt);
			
			response.sendRedirect("/user/main");
		}	
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object handler)throws Exception{
		HttpSession session = request.getSession();
		
		if(session.getAttribute(LOGIN)!= null){
			logger.info("clear login data before");
			session.removeAttribute(LOGIN);
			session.removeAttribute("endDt");
		}
		return true;
		}
	}

