package com.kedu.nodazi.service;

import java.util.List;

import com.kedu.nodazi.dto.Criteria;
import com.kedu.nodazi.dto.ReplyDto;

/*****************************************************
 * <pre>
 * com.kedu.nodazi.service
 * ReplyService.java
 * </pre>
 * @author	: 김윤화
 * @Date	: 2017. 6. 15.
 * @Version	: 1.0
 *****************************************************/
public interface ReplyService {
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 댓글 추가
	 * 2. 처리내용	: reply 테이블에 추가
	 * </pre>
	 * @Method Name : addReply
	 * @param rDto
	 * @throws Exception
	 *****************************************************/
	public void addReply(ReplyDto rDto) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 댓글 목록 출력
	 * 2. 처리내용	: 댓글을 reply 테이블에서 가져옴
	 * </pre>
	 * @Method Name : listReply
	 * @param b_no
	 * @return List<ReplyDto>
	 * @throws Exception
	 *****************************************************/
	public List<ReplyDto> listReply(int b_no) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 댓글 수정
	 * 2. 처리내용	: reply 테이블에 변경된 내용으로 수정
	 * </pre>
	 * @Method Name : modifyReply
	 * @param rDto
	 * @throws Exception
	 *****************************************************/
	public void modifyReply(ReplyDto rDto) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 댓글 삭제
	 * 2. 처리내용	: reply 테이블에서 선택된 r_no 삭제
	 * </pre>
	 * @Method Name : removeReply
	 * @param r_no
	 * @param b_no
	 * @throws Exception
	 *****************************************************/
	public void removeReply(int r_no, int b_no) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 댓글 페이징
	 * 2. 처리내용	: 댓글 페이징 처리
	 * </pre>
	 * @Method Name : listReplyPage
	 * @param b_no
	 * @param cri
	 * @return List<ReplyDto>
	 * @throws Exception
	 *****************************************************/
	public List<ReplyDto> listReplyPage(int b_no, Criteria cri) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 댓글 개수
	 * 2. 처리내용	: 댓글의 개수를 구한다
	 * </pre>
	 * @Method Name : count
	 * @param b_no
	 * @return int
	 * @throws Exception
	 *****************************************************/
	public int count(int b_no) throws Exception;
}
