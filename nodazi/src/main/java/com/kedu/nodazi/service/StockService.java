package com.kedu.nodazi.service;

import java.util.List;

import com.kedu.nodazi.dto.CodesDto;
import com.kedu.nodazi.dto.Criteria;
import com.kedu.nodazi.dto.DateHistoryDto;
import com.kedu.nodazi.dto.FavorDto;
import com.kedu.nodazi.dto.PricesDto;
import com.kedu.nodazi.dto.SearchCriteria;
import com.kedu.nodazi.dto.StockHistoryDto;

/*****************************************************
 * <pre>
 * com.kedu.nodazi.service
 * RecStockService.java
 * </pre>
 * @author	: 오윤진
 * @Date	: 2017. 5. 26.
 * @Version	: 1.0
 *****************************************************/
public interface StockService {

	/*****************************************************
	 * <pre>
	 * 1. 개요	: 오늘 추천될 종목을 조회
	 * 2. 처리내용	: 오늘 날짜로 추천될 종목의 코드와 회사명을 조회
	 * </pre>
	 * @Method Name : readRecStock
	 * @return		  List<CodesDto>
	 * @throws		  Exception
	 *****************************************************/
	public List<CodesDto> readRecStock() throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 종목의 주가정보를 조회
	 * 2. 처리내용	: 종목코드와 조회할 기간을 받아서 주가데이터를 조회
	 * </pre>
	 * @Method Name : readStockPrice
	 * @param		  code
	 * @param		  term
	 * @return		  List<PricesDto>
	 * @throws		  Exception
	 *****************************************************/
	public List<PricesDto> readStockPrice(String code, int term) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 종목 목록 조회
	 * 2. 처리내용	: 검색과 페이징이 적용된 목록 조회
	 * </pre>
	 * @Method Name : searchListCriteria
	 * @param		  cri
	 * @return		  List<PricesDto>
	 * @throws		  Exception
	 *****************************************************/
	public List<PricesDto> searchListCriteria(SearchCriteria cri) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 종목 개수 조회
	 * 2. 처리내용	: 페이징 계산을 위해 검색이 적용된 총 종목 개수 조회
	 * </pre>
	 * @Method Name : searchListCount
	 * @param		  cri
	 * @return		  int
	 * @throws		  Exception
	 *****************************************************/
	public int searchListCount(SearchCriteria cri) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 종목 상세 조회
	 * 2. 처리내용	: code로 종목에 대한 정보 조회
	 * </pre>
	 * @Method Name : readCode
	 * @param		  code
	 * @return		  CodesDto
	 * @throws		  Exception
	 *****************************************************/
	public CodesDto readCode(String code) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 주가 상세 조회
	 * 2. 처리내용	: code로 종목에 대한 주가 조회, 페이징 처리
	 * </pre>
	 * @Method Name : readPricePage
	 * @param		  code
	 * @param		  cri
	 * @return		  List<PricesDto>
	 * @throws		  Exception
	 *****************************************************/
	public List<PricesDto> readPricePage(String code, Criteria cri) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 한 종목의 주가정보 갯수 세기
	 * 2. 처리내용	: price 페이징 처리를 위한 주가정보 갯수 세기
	 * </pre>
	 * @Method Name : readPriceCount
	 * @param		  code
	 * @return		  Integer
	 * @throws		  Exception
	 *****************************************************/
	public Integer readPriceCount(String code) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 한 종목에 대한 과거 추천내역 HistoryDto를 조회
	 * 2. 처리내용	: 종목코드를넣어서 HistoryDto를 조회
	 * </pre>
	 * @Method Name : readSHistoryDto
	 * @param		  code
	 * @return		  List<HistoryDto>
	 * @throws		  Exception
	 *****************************************************/
	public List<StockHistoryDto> readSHistoryDto(String code) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 선호 종목 등록
	 * 2. 처리내용	: 선호하는 종목코드를 interest_stock에 insert
	 * </pre>
	 * @Method Name : regFavor
	 * @param		  code
	 * @param		  u_id
	 * @throws		  Exception
	 *****************************************************/
	public void regFavor(String code, String u_id) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 선호 종목 해제
	 * 2. 처리내용	: 선호하는 종목코드를 interest_stock에서 delete
	 * </pre>
	 * @Method Name : unRegFavor
	 * @param		  code
	 * @param		  u_id
	 * @throws		  Exception
	 *****************************************************/
	public void unRegFavor(String code, String u_id) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 기간에 해당하는 과거 추천내역을 조회
	 * 2. 처리내용	: 시작날짜, 끝날짜를 넣어서 과거 추천내역을 조회
	 * 			Controller에서 날짜를 String - int 로 변환
	 * 			Date로 변환하는데 어려움이 있어서 int로 받음
	 * </pre>
	 * @Method Name : readDHistoryDto
	 * @param		  start
	 * @param		  end
	 * @return		  List<DateHistoryDto>
	 * @throws		  Exception
	 *****************************************************/
	public List<DateHistoryDto> readDHistoryDto(int start, int end) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 유저가 종목을 선호종목에 등록하였는지 확인
	 * 2. 처리내용	: 유저ID와 code로 interest_stock을 조회
	 * 				i_seq를 return받아 제대로 select가 되었는지 확인
	 * </pre>
	 * @Method Name : checkFavorStock
	 * @param		  code
	 * @param		  u_id
	 * @return		  String
	 * @throws		  Exception
	 *****************************************************/
	public String checkFavorStock(String code, String u_id) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 유저ID로 선호종목과 정보를 검색
	 * 2. 처리내용	: u_id를 받아서 FavorDto 조회
	 * </pre>
	 * @Method Name : readFavorDto
	 * @param		  u_id
	 * @return		  List<FavorDto>
	 * @throws		  Exception
	 *****************************************************/
	public List<FavorDto> readFavorDto(String u_id) throws Exception;
	
}
