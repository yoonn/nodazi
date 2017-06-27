package com.kedu.nodazi.dao;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.kedu.nodazi.dto.CodesDto;
import com.kedu.nodazi.dto.Criteria;
import com.kedu.nodazi.dto.DateHistoryDto;
import com.kedu.nodazi.dto.FavorDto;
import com.kedu.nodazi.dto.PricesDto;
import com.kedu.nodazi.dto.SearchCriteria;
import com.kedu.nodazi.dto.StockHistoryDto;

@Repository
public class StockDaoImpl implements StockDao{

	@Inject
	private SqlSession session;
	
	private static Logger logger = LoggerFactory.getLogger(StockDaoImpl.class);
	
	private static String namespace = "com.kedu.nodazi.mapper.StockMapper";
	

	@Override
	public List<CodesDto> readRecStock() throws Exception {
		
		Calendar day   = Calendar.getInstance();
		String	 today = "";
		
		Map<String, Integer> paramMap  = new HashMap<String, Integer>();
		List<CodesDto>		 recList   = new ArrayList<CodesDto>();
		
//		오늘 날짜 생성
		int year = day.get(Calendar.YEAR);
		int month = day.get(Calendar.MONTH) + 1;
		int date = day.get(Calendar.DATE);
		
		today += year;
		if(month < 10){
			today += 0;
		}
		today += month;
		if(date < 10){
			today += 0;
		}
		today += date;
		
//		오늘의 추천종목 5개의 종목코드를 가져온다.
		paramMap.put("today", Integer.parseInt(today));
		paramMap.put("seq", 0);
		
//		seq는 1부터 시작하기에 i=1
		for(int i=1; i<=5; i++){
			paramMap.replace("seq", i);
			recList.add(session.selectOne(namespace+".readRecList", paramMap));
		}
		
		return recList;
	}

	@Override
	public List<PricesDto> readStockPrice(String code, int term) throws Exception {
		
//		code는 String으로 받아야 하지만 term이 int여야 함으로 sql문에서 cast(#{code} as char)를 해준다.
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("code", Integer.parseInt(code, 10));
		map.put("term", term);
		
		return session.selectList(namespace + ".readRecStock", map);
		
	}

	@Override
	public List<PricesDto> searchList(SearchCriteria cri) throws Exception {
		return session.selectList(namespace + ".searchList", cri);
	}

	@Override
	public int searchListCount(SearchCriteria cri) throws Exception {
		return session.selectOne(namespace + ".searchListCount");
	}

	@Override
	public CodesDto readCode(String code) throws Exception {
		return session.selectOne(namespace + ".readCodesDto", code);
	}

	@Override
	public List<PricesDto> readPricePage(String code, Criteria cri) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("code", code);
		paramMap.put("cri", cri);
		
		return session.selectList(namespace + ".readPricePage", paramMap);
	}

	@Override
	public Integer readPriceCount(String code) throws Exception {
		return session.selectOne(namespace + ".readPriceCount", code);
	}

	@Override
	public List<StockHistoryDto> readSHistoryDto(String code) throws Exception {
		
		return session.selectList(namespace + ".readSHistoryDto", code);
	}

	@Override
	public void insertFavor(String code, String u_id) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("u_id", u_id);
		paramMap.put("code", code);
		
		session.insert(namespace + ".insertFavor", paramMap);
	}

	@Override
	public void deleteFavor(String code, String u_id) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("u_id", u_id);
		paramMap.put("code", code);
		
		session.delete(namespace + ".deleteFavor", paramMap);
	}

	@Override
	public List<DateHistoryDto> readDHistoryDto(int start, int end) throws Exception {
		
		Map<String, Integer> paramMap = new HashMap<>();
		
		paramMap.put("start", start);
		paramMap.put("end", end);
		
		return session.selectList(namespace + ".readDHistoryDto", paramMap);
	}

	@Override
	public String checkFavorStock(String code, String u_id) throws Exception {
		
		Map<String, String> paramMap = new HashMap<>();
		
		paramMap.put("code", code);
		paramMap.put("u_id", u_id);
		
		return session.selectOne(namespace + ".checkFavor", paramMap);
	}

	@Override
	public List<FavorDto> readFavorDto(String u_id) throws Exception {
		return session.selectList(namespace + ".readFavorDto", u_id);
	}


}
