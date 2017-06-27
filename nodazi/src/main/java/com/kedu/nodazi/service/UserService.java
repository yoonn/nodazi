package com.kedu.nodazi.service;

import java.util.Date;
import java.util.List;

import com.kedu.nodazi.dto.LoginDto;
import com.kedu.nodazi.dto.PaymentDto;
import com.kedu.nodazi.dto.UserDto;

/*****************************************************
 * <pre>
 * com.kedu.nodazi.service
 * UserService.java
 * </pre>
 * @author	: 안홍내
 * @Date	: 2017. 5. 25.
 * @Version	: 1.0
 *****************************************************/
public interface UserService {
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 회원가입정보를 저장
	 * 2. 처리내용	: user테이블에 회원가입에 필요한 데이터를 저장
	 * </pre>
	 * @Method Name : join
	 * @param		  udto
	 * @throws		  Exception
	 *****************************************************/
	public void join(UserDto udto)throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 로그인하여 세션에 저장할 정보를 조회
	 * 2. 처리내용	: user테이블에서 로그인에 필요한 정보를 조회
	 * </pre>
	 * @Method Name : login
	 * @param		  ldto
	 * @return		  UserDto
	 * @throws		  Exception
	 *****************************************************/
	public UserDto login(LoginDto ldto)throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 결제에 필요한 정보를 저장
	 * 2. 처리내용	: payment테이블에 결제관련 정보를 저장
	 * </pre>
	 * @Method Name : payment
	 * @param		  pdto
	 * @throws		  Exception
	 *****************************************************/
	public void payment(PaymentDto pdto)throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 유저의 정보를 조회
	 * 2. 처리내용	: 유저아이디를 가져와 개인정보를 조회
	 * </pre>
	 * @Method Name : info
	 * @param		  u_id
	 * @return		  UserDto
	 * @throws		  Exception
	 *****************************************************/
	public UserDto info(String u_id)throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 결제내역을 조회
	 * 2. 처리내용	: 유저아이디를 입력받아 결제관련 정보를 조회
	 * </pre>
	 * @Method Name : paymentDetail
	 * @param		  u_id
	 * @return		  List<PaymentDto>
	 * @throws		  Exception
	 *****************************************************/
	public List<PaymentDto> paymentDetail(String u_id)throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 유저의 정보를 수정
	 * 2. 처리내용	: user테이블에 변경된 정보를 갱신
	 * </pre>
	 * @Method Name : userUpdate
	 * @param		  udto
	 * @throws		  Exception
	 *****************************************************/
	public void userUpdate(UserDto udto)throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 탈퇴한 유저의 withdraw 값을 변경
	 * 2. 처리내용	: user테이블의 withdraw 값을 0에서 1로 변경하여 탈퇴처리
	 * </pre>
	 * @Method Name : withdraw
	 * @param		  udto
	 * @throws		  Exception
	 *****************************************************/
	public void withdraw(UserDto udto)throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 아이디가 중복되는지 알기위해 u_id를 조회
	 * 2. 처리내용	: 유저 아이디를 가져와 그 아이디가 존재하는지 여부로 중복확인
	 * </pre>
	 * @Method Name : overlap
	 * @param		  u_id
	 * @return		  String
	 * @throws		  Exception
	 *****************************************************/
	public String overlap(String u_id)throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 로그인을 위해 입력한 정보가 올바른지 검증하기 위해 관련 정보를 조회
	 * 2. 처리내용	: 유저 아이디와 비밀번호를 가져와 데이터베이스에 존재하는지 검증
	 * </pre>
	 * @Method Name : loginCheck
	 * @param		  u_id
	 * @return		  String
	 * @throws		  Exception
	 *****************************************************/
	public String loginCheck(String u_id) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 유저가 현재 서비스를 이용중인지 확인
	 * 2. 처리내용	: 유저 id를 조건으로 오늘 날짜가 만기일과 시작일 사이에 있는지 확인
	 * </pre>
	 * @Method Name : checkUseService
	 * @param		  u_id
	 * @return		  Date
	 * @throws		  Exception
	 *****************************************************/
	public Date checkUseService(String u_id) throws Exception;
	
}
