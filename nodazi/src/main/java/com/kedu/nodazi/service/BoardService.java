package com.kedu.nodazi.service;

import java.util.List;

import com.kedu.nodazi.dto.BoardDto;
import com.kedu.nodazi.dto.Criteria;
import com.kedu.nodazi.dto.SearchCriteria;

/*****************************************************
 * <pre>
 * com.kedu.nodazi.service
 * BoardService.java
 * </pre>
 * @author	: 김윤화
 * @Date	: 2017. 5. 30.
 * @Version	: 1.0
 *****************************************************/
public interface BoardService {
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 게시글 작성
	 * 2. 처리내용	: board 테이블에 저장
	 * </pre>
	 * @Method Name : regist
	 * @param boeard
	 * @throws Exception
	 *****************************************************/
	public void regist(BoardDto board) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 게시글 조회
	 * 2. 처리내용	: b_no를 받아서 게시글 조회
	 * </pre>
	 * @Method Name : read
	 * @param b_no
	 * @return BoardDto
	 * @throws Exception
	 *****************************************************/
	public BoardDto read(int b_no) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 게시글 수정
	 * 2. 처리내용	: board 테이블에 변경된 데이터 갱신
	 * </pre>
	 * @Method Name : modify
	 * @param board
	 * @throws Exception
	 *****************************************************/
	public void modify(BoardDto board) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 게시글 삭제
	 * 2. 처리내용	: board 테이블에서 삭제
	 * </pre>
	 * @Method Name : remove
	 * @param b_no
	 * @throws Exception
	 *****************************************************/
	public void remove(int b_no) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 게시글 목록
	 * 2. 처리내용	: board 테이블에서 목록 조회
	 * </pre>
	 * @Method Name : list
	 * @return List<BoardDto>
	 * @throws Exception
	 *****************************************************/
	public List<BoardDto> list() throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 페이징
	 * 2. 처리내용	: 목록 페이징
	 * </pre>
	 * @Method Name : listCriteria
	 * @param cri
	 * @return List<BoardDto>
	 * @throws Exception
	 *****************************************************/
	public List<BoardDto> listCriteria(Criteria cri) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 게시글 수
	 * 2. 처리내용	: b_no 수를 구한다
	 * </pre>
	 * @Method Name : listCountCriteria
	 * @param cri
	 * @return int
	 * @throws Exception
	 *****************************************************/
	public int listCountCriteria(Criteria cri) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 게시글 검색
	 * 2. 처리내용	: 검색 목록 출력, 페이징
	 * </pre>
	 * @Method Name : listSearchCriteria
	 * @param cri
	 * @return List<BoardDto>
	 * @throws Exception
	 *****************************************************/
	public List<BoardDto> listSearchCriteria(SearchCriteria cri) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 검색된 게시글 수
	 * 2. 처리내용	: 검색된 게시글 수
	 * </pre>
	 * @Method Name : listSearchCount
	 * @param cri
	 * @return int
	 * @throws Exception
	 *****************************************************/
	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 첨부파일 목록
	 * 2. 처리내용	: 첨부파일 fullName 목록 출력
	 * </pre>
	 * @Method Name : getAttach
	 * @param b_no
	 * @return List<String>
	 * @throws Exception
	 *****************************************************/
	public List<String> getAttach(int b_no) throws Exception;
}
