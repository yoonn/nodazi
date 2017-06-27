package com.kedu.nodazi.dao;

import java.util.List;

import com.kedu.nodazi.dto.BoardDto;
import com.kedu.nodazi.dto.Criteria;
import com.kedu.nodazi.dto.SearchCriteria;

/*****************************************************
 * <pre>
 * com.kedu.nodazi.dao
 * BoardDao.java
 * </pre>
 * @author	: 김윤화
 * @Date	: 2017. 5. 30.
 * @Version	: 1.0
 *****************************************************/
public interface BoardDao {
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 게시글 작성
	 * 2. 처리내용	: board 테이블에 저장
	 * </pre>
	 * @Method Name : create
	 * @param bDto
	 * @throws Exception
	 *****************************************************/
	public void create(BoardDto bDto) throws Exception;
	
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
	 * @Method Name : update
	 * @param bDto
	 * @throws Exception
	 *****************************************************/
	public void update(BoardDto bDto) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 게시글 삭제
	 * 2. 처리내용	: board 테이블에서 삭제
	 * </pre>
	 * @Method Name : delete
	 * @param b_no
	 * @throws Exception
	 *****************************************************/
	public void delete(int b_no) throws Exception;
	
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
	 * 1. 개요	: 게시글 목록 페이징
	 * 2. 처리내용	: 페이징 처리
	 * </pre>
	 * @Method Name : listPage
	 * @param page
	 * @return List<BoardDto>
	 * @throws Exception
	 *****************************************************/
	public List<BoardDto> listPage(int page) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 목록 페이징
	 * 2. 처리내용	: 게시글 목록 페이징 처리
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
	 * @Method Name : countPaging
	 * @param cri
	 * @return int
	 * @throws Exception
	 *****************************************************/
	public int countPaging(Criteria cri) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 게시글 검색
	 * 2. 처리내용	: 검색 목록 출력, 페이징
	 * </pre>
	 * @Method Name : listSearch
	 * @param cri
	 * @return List<BoardDto>
	 * @throws Exception
	 *****************************************************/
	public List<BoardDto> listSearch(SearchCriteria cri) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 게시글 검색 출력
	 * 2. 처리내용	: 검색된 게시글을 출력, 페이징
	 * </pre>
	 * @Method Name : listSearchCount
	 * @param cri
	 * @return
	 * @throws Exception
	 *****************************************************/
	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 댓글 개수 수정
	 * 2. 처리내용	: 변경된 댓글 개수 갱신
	 * </pre>
	 * @Method Name : updateReplyCnt
	 * @param b_no
	 * @param amount
	 * @throws Exception
	 *****************************************************/
	public void updateReplyCnt(int b_no, int amount) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 조회수 수정
	 * 2. 처리내용	: 조회수를 추가한다
	 * </pre>
	 * @Method Name : updateViewCnt
	 * @param b_no
	 * @throws Exception
	 *****************************************************/
	public void updateViewCnt(int b_no) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 첨부파일 추가
	 * 2. 처리내용	: 첨부파일 정보 저장
	 * </pre>
	 * @Method Name : addAttach
	 * @param fullName
	 * @throws Exception
	 *****************************************************/
	public void addAttach(String fullName) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 첨부파일 목록
	 * 2. 처리내용	: 특정 게시물의 첨부파일을 시간 순서대로 가져옴
	 * </pre>
	 * @Method Name : getAttach
	 * @param b_no
	 * @return List<String>
	 * @throws Exception
	 *****************************************************/
	public List<String> getAttach(int b_no) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 첨부파일 삭제
	 * 2. 처리내용	: attach 테이블에서 첨부파일 삭제
	 * </pre>
	 * @Method Name : deleteAttach
	 * @param b_no
	 * @throws Exception
	 *****************************************************/
	public void deleteAttach(int b_no) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 첨부파일 추가
	 * 2. 처리내용	: 수정시 추가
	 * </pre>
	 * @Method Name : replaceAttach
	 * @param fullName
	 * @param b_no
	 * @throws Exception
	 *****************************************************/
	public void replaceAttach(String fullName, int b_no) throws Exception;
}
