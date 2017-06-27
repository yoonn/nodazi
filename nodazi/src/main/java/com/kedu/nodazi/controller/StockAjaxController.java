package com.kedu.nodazi.controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kedu.nodazi.dto.ChartDto;
import com.kedu.nodazi.dto.Criteria;
import com.kedu.nodazi.dto.DateHistoryDto;
import com.kedu.nodazi.dto.PageMaker;
import com.kedu.nodazi.dto.PricesDto;
import com.kedu.nodazi.dto.UserDto;
import com.kedu.nodazi.service.StockService;

@RestController
@RequestMapping("/stock")
public class StockAjaxController {
	
	public static final Logger logger = LoggerFactory.getLogger(StockAjaxController.class);
	
	@Inject
	private StockService service;

	@ResponseBody
	@RequestMapping(value="/chartAjax", method=RequestMethod.GET)
	public HashMap<String, Object> chartAjax(@RequestParam int term, @RequestParam String code, Model model) throws Exception{
		
		logger.info("code : " + code + ", term = " + term);
		List<PricesDto> recStock = service.readStockPrice(code, term);
		ChartDto		chart    = new ChartDto(); 
		
		chart.addColumn("month", "string");
		chart.addColumn("price_low", "number");
		chart.addColumn("price_open", "number");
		chart.addColumn("price_close", "number");
		chart.addColumn("price_high", "number");
		chart.addTooltip();
		
		chart.createRows(term);
		
		SimpleDateFormat sdfRow = new SimpleDateFormat("MM/dd");
		SimpleDateFormat sdfTool = new SimpleDateFormat("yyyy. MM. dd");
		
		for(int row=0; row<recStock.size(); row++){
			PricesDto dto = recStock.get(row);
			
			chart.addCell(row, dto.getPrice_date(), sdfRow.format(dto.getPrice_date()));
			chart.addCell(row, dto.getPrice_low());
			chart.addCell(row, dto.getPrice_open());
			chart.addCell(row, dto.getPrice_close());
			chart.addCell(row, dto.getPrice_high());
			chart.addCell(row, sdfTool.format(dto.getPrice_date()) + "\r\n시가 : " + dto.getPrice_open()
												+ "\r\n종가 : " + dto.getPrice_close()
												+ "\r\n저가 : " + dto.getPrice_low()
												+ "\r\n고가 : " + dto.getPrice_high());
		}
		
		logger.info("recStock : " + recStock);
		logger.info("chart.getResult() : " + chart.toString());
		
		return chart.getResult();
		
	}
	
	@ResponseBody
	@RequestMapping(value="/{code}/{page}", method = RequestMethod.GET)
	public Map<String, Object> listPrice(@PathVariable("code") String code
										, @PathVariable("page") Integer page) throws Exception{
		Criteria cri = new Criteria();
		cri.setPage(page);
		
		int priceCount = service.readPriceCount(code);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(priceCount);
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<PricesDto>   price = service.readPricePage(code, cri);
		
		map.put("price", price);
		map.put("pageMaker", pageMaker);
		
		logger.info("cri : " + cri);
		logger.info("pagemaker : " + pageMaker);
		logger.info("priceListMap : " + map);
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="favorStock", method = RequestMethod.GET)
	public int favorStock(@RequestParam int status
						, @RequestParam String code
						, HttpSession session) throws Exception{
		
//		1이면 insert성공, 0이면 delete 성공
		
		UserDto uDto = (UserDto) session.getAttribute("login");
		String u_id  = uDto.getU_id();
		
//		String u_id = "aaaa";
		
		logger.info("status = 0 : " + status);
		
		if(status == 1){
			service.unRegFavor(code, u_id);
			status = 0;
		}else if(status == 0){
			service.regFavor(code, u_id);
			status = 1;
			logger.info("status == 0 -> 1 : " + status);
		}
		
		logger.info("return status : " + status);
		return status;
	}
	
	@ResponseBody
	@RequestMapping(value="historyTable", method=RequestMethod.GET)
	public List<DateHistoryDto> historyTable(@RequestParam String start
											, @RequestParam String end) throws Exception{
		
		start = start.replace("-", "");
		end = end.replace("-", "");
		
		int startNum = Integer.parseInt(start);
		int endNum = Integer.parseInt(end);
		
		logger.info("String : start = " + start + ", end = " + end);
		
		
		logger.info("int : start = " + start + ", end = " + end);
		
		List<DateHistoryDto> history = service.readDHistoryDto(startNum, endNum);
		
		logger.info("history.history : " + history);
		
		return history;
	}
}
