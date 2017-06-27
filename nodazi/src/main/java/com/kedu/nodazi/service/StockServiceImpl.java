package com.kedu.nodazi.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kedu.nodazi.dao.StockDao;
import com.kedu.nodazi.dto.CodesDto;
import com.kedu.nodazi.dto.Criteria;
import com.kedu.nodazi.dto.DateHistoryDto;
import com.kedu.nodazi.dto.FavorDto;
import com.kedu.nodazi.dto.StockHistoryDto;
import com.kedu.nodazi.dto.PricesDto;
import com.kedu.nodazi.dto.SearchCriteria;

@Service
public class StockServiceImpl implements StockService{

	@Inject
	private StockDao dao;

	@Override
	public List<CodesDto> readRecStock() throws Exception {
		
		return dao.readRecStock();
	}

	@Override
	public List<PricesDto> readStockPrice(String code, int term) throws Exception {
		
		return dao.readStockPrice(code, term);
	}

	@Override
	public List<PricesDto> searchListCriteria(SearchCriteria cri) throws Exception {
		return dao.searchList(cri);
	}

	@Override
	public int searchListCount(SearchCriteria cri) throws Exception {
		return dao.searchListCount(cri);
	}

	@Override
	public CodesDto readCode(String code) throws Exception {
		return dao.readCode(code);
	}

	@Override
	public List<PricesDto> readPricePage(String code, Criteria cri) throws Exception {
		return dao.readPricePage(code, cri);
	}

	@Override
	public Integer readPriceCount(String code) throws Exception {
		return dao.readPriceCount(code);
	}

	@Override
	public List<StockHistoryDto> readSHistoryDto(String code) throws Exception {
		return dao.readSHistoryDto(code);
	}

	@Override
	public void regFavor(String code, String u_id) throws Exception {
		dao.insertFavor(code, u_id);
	}

	@Override
	public void unRegFavor(String code, String u_id) throws Exception {
		dao.deleteFavor(code, u_id);
	}

	@Override
	public List<DateHistoryDto> readDHistoryDto(int start, int end) throws Exception {
		return dao.readDHistoryDto(start, end);
	}

	@Override
	public String checkFavorStock(String code, String u_id) throws Exception {
		return dao.checkFavorStock(code, u_id);
	}

	@Override
	public List<FavorDto> readFavorDto(String u_id) throws Exception {
		return dao.readFavorDto(u_id);
	}

}
