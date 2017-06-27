package com.kedu.nodazi.dao;

import java.util.List;

import com.kedu.nodazi.dto.PaymentDto;
import com.kedu.nodazi.dto.SearchCriteria;
import com.kedu.nodazi.dto.UserDto;

/*****************************************************
 * <pre>
 * com.kedu.nodazi.dao
 * BoardDao.java
 * </pre>
 * @author	: 최진혁
 * @Date	: 2017. 5. 25.
 * @Version	: 1.0
 *****************************************************/
public interface ManagerDao {
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 결제 목록
	 * 2. 처리내용	: 결제 목록을 검색조건에 맞게 페이징 처리해서 출력.
	 * </pre>
	 * @Method Name : paymentListSearch
	 * @param		  SearchCriteria
	 * @return		  List<PaymentDto>
	 * @throws		  Exception
	 *****************************************************/
	public List<PaymentDto> paymentListSearch(SearchCriteria sc) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 결제 목록 개수
	 * 2. 처리내용	: 페이징을 위해 검색 조건에 맞는 결제 목록의 개수를 가져옴.
	 * </pre>
	 * @Method Name : paymentListSearchCount
	 * @param		  SearchCriteria
	 * @return		  int
	 * @throws		  Exception
	 *****************************************************/
	public int paymentListSearchCount(SearchCriteria sc) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 결제 상태
	 * 2. 처리내용	: 결제 금액에 따라 결제 상태를 갱신
	 * </pre>
	 * @Method Name : updatePaymentStatus
	 * @param		  List<PaymentDto>
	 * @throws		  Exception
	 *****************************************************/
	public void updatePaymentStatus(List<PaymentDto> list) throws Exception; 
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 회원 목록
	 * 2. 처리내용	: 회원 목록을 검색조건에 맞게 페이징 처리해서 출력.
	 * </pre>
	 * @Method Name : userListSearch
	 * @param		  List<UserDto>
	 * @throws		  Exception
	 *****************************************************/
	public List<UserDto> userListSearch(SearchCriteria sc) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 회원 목록 개수
	 * 2. 처리내용	: 페이징을 위해 검색 조건에 맞는 회원 목록의 개수를 가져옴.
	 * </pre>
	 * @Method Name : userListSearchCount
	 * @param		  SearchCriteria
	 * @return		  int
	 * @throws		  Exception
	 *****************************************************/
	public int userListSearchCount(SearchCriteria sc) throws Exception;
}
