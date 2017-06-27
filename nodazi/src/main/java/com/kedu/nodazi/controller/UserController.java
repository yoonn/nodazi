package com.kedu.nodazi.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kedu.nodazi.dto.LoginDto;
import com.kedu.nodazi.dto.PageMaker;
import com.kedu.nodazi.dto.PaymentDto;
import com.kedu.nodazi.dto.SearchCriteria;
import com.kedu.nodazi.dto.UserDto;
import com.kedu.nodazi.service.BoardService;
import com.kedu.nodazi.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

		private static final Logger logger = LoggerFactory.getLogger(UserController.class);

		@Inject
		private UserService uservice;
		
		@Inject
		private BoardService service;
		
		@RequestMapping(value="/main",method = RequestMethod.GET)
		public void mainGET(Model model,SearchCriteria cri)throws Exception{
			logger.info("main");
			
			model.addAttribute("list", service.listSearchCriteria(cri));
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.listSearchCount(cri));
			
			model.addAttribute("pageMaker", pageMaker);
		}
		
		@RequestMapping(value="/join",method = RequestMethod.GET)
		public void registerGET(UserDto udto,Model model)throws Exception{
			logger.info("register get");
			
		}
		
		@RequestMapping(value="/join",method = RequestMethod.POST)
		public String registerPOST(UserDto udto,RedirectAttributes rttr)throws Exception{
			logger.info("register post");
			uservice.join(udto);
			
			rttr.addFlashAttribute("msg","success");
			return "redirect:/user/login";
		}

		
		@RequestMapping(value="/join_policy",method = RequestMethod.GET)
		public void JoinPolicyGET(Model model) throws Exception{
			logger.info("join_policy");
		}
		
		
		//login
		@RequestMapping(value="/login",method=RequestMethod.GET)
		public void LoginGET(@ModelAttribute("ldto")LoginDto ldto)throws Exception{
			logger.info("login");
		}
		
		@RequestMapping(value="/loginPost",method=RequestMethod.POST)
		public void LoginPOST(LoginDto ldto, HttpSession session,Model model)throws Exception{
			UserDto udto = uservice.login(ldto);
			
			if(udto == null){
				return;
			}
			
			model.addAttribute("UserDto",udto);
		}
		
		@RequestMapping(value="/logout",method=RequestMethod.GET)
		public String Logout(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception{
			Object obj = session.getAttribute("login");
			
			if(obj != null){
				UserDto udto = (UserDto) obj;
				
				session.removeAttribute("login");
				session.removeAttribute("endDt");
				session.invalidate();
			}
			return "/user/logout";
		}
		
		//payment
		@RequestMapping(value="/payment_policy",method=RequestMethod.GET)
		public void PaymentPolicyGET(Model model)throws Exception{
			logger.info("payment_policy");
		}
		
		@RequestMapping(value="/payment",method=RequestMethod.GET)
		public void PaymentGET(Model model,HttpSession session)throws Exception{

			logger.info("payment");
		
		}
		
		@RequestMapping(value="/payment",method = RequestMethod.POST)
		public String PaymentPOST(PaymentDto pdto,RedirectAttributes rttr)throws Exception{
			
			logger.info("Payment post");
			uservice.payment(pdto);
			
			rttr.addFlashAttribute("msg","success");
			return "redirect:/user/main";
		}
		
		@RequestMapping(value="/payment_detail",method = RequestMethod.GET)
		public void PaymentDetailGET(Model model,HttpSession session)throws Exception{

			Object obj = session.getAttribute("login");
			UserDto udto = (UserDto)obj;
			String u_id = udto.getU_id();
			model.addAttribute("list",uservice.paymentDetail(u_id));
			logger.info("infoGET");
		}
		
		@RequestMapping(value="/info",method = RequestMethod.GET)
		public void InfoGET(Model model, HttpSession session)throws Exception{
			
			Object obj = session.getAttribute("login");
			UserDto udto = (UserDto)obj;
			String u_id = udto.getU_id();
			model.addAttribute("udto",uservice.info(u_id));
			logger.info("infoGET");

		}
		
		
		@RequestMapping(value="/withdraw",method = RequestMethod.POST)
		public String Withdraw(UserDto udto, RedirectAttributes rttr,HttpSession session)throws Exception{
			logger.info("Payment post");
			uservice.withdraw(udto);
			
			rttr.addFlashAttribute("msg","success");
			session.removeAttribute("login");
			session.invalidate();
			return "redirect:/user/main";
			
		}
		
		

		
}