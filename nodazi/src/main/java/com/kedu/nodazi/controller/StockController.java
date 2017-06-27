package com.kedu.nodazi.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kedu.nodazi.dto.CodesDto;
import com.kedu.nodazi.dto.FavorDto;
import com.kedu.nodazi.dto.PageMaker;
import com.kedu.nodazi.dto.SearchCriteria;
import com.kedu.nodazi.dto.StockHistoryDto;
import com.kedu.nodazi.dto.UserDto;
import com.kedu.nodazi.service.StockService;

@Controller
@RequestMapping("/stock")
public class StockController {
	
	private static final Logger logger = LoggerFactory.getLogger(StockController.class);
	
	@Inject
	private StockService service;
	
	@RequestMapping(value = "/recommend", method = RequestMethod.GET)
	public void recommend(Model model) throws Exception{
		
		logger.info("/stock/recommend.GET.......................................");
				
		List<CodesDto> recStockList   = service.readRecStock();
		
		logger.info("recommend.recStockList : " + recStockList);
		
		model.addAttribute("recStockList", recStockList);
		
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(@ModelAttribute("cri") SearchCriteria cri
					, Model model) throws Exception{
		
		logger.info("/stock/list.GET.............................................");
		
		logger.info(cri.toString());
		
		model.addAttribute("list", service.searchListCriteria(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.searchListCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		
	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@ModelAttribute("cri") SearchCriteria cri
					, @RequestParam("code") String code
					, HttpSession session
					, Model model) throws Exception{
		
		logger.info("/stock/read.GET..............................................");
		
		UserDto uDto = (UserDto) session.getAttribute("login");
		String u_id  = uDto.getU_id();
		
		Date endDt = (Date) session.getAttribute("endDt");
		
		CodesDto codeDto = service.readCode(code);
		List<StockHistoryDto> history = service.readSHistoryDto(code);
		String checkFavor = service.checkFavorStock(code, u_id);
		int favorResult = 0;
		
		if(checkFavor == null){
			favorResult = 0;
		}else{
			favorResult = 1;
		}
		
		model.addAttribute("code", codeDto);
		model.addAttribute("history", history);
		model.addAttribute("checkFavor", favorResult);
		model.addAttribute("endDt", endDt);
		
		logger.info("read.codeDto : " + codeDto);
		logger.info("read.history : " + history);
		logger.info("read.result : " + favorResult);
		logger.info("read.endDt : " + endDt);
	}
	
	@RequestMapping(value="/history", method = RequestMethod.GET)
	public void history() throws Exception{
		
		logger.info("/stock/history.GET.............................................");
		
	}
	
	@RequestMapping(value="/favor", method = RequestMethod.GET)
	public void favor(HttpSession session, Model model) throws Exception{
		
		logger.info("/stock/favor.GET...............................................");
		
		UserDto uDto = (UserDto) session.getAttribute("login");
		String u_id  = uDto.getU_id();
		
//		String u_id = "aaaa";
		
		List<FavorDto> favor = service.readFavorDto(u_id);
		
		model.addAttribute("favor", favor);
		logger.info("favor : " + favor);
		
	}
	
}
