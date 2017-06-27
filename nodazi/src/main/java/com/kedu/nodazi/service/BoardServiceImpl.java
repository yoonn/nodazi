package com.kedu.nodazi.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.kedu.nodazi.dao.BoardDao;
import com.kedu.nodazi.dto.BoardDto;
import com.kedu.nodazi.dto.Criteria;
import com.kedu.nodazi.dto.SearchCriteria;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDao dao;
	
	@Transactional
	@Override
	public void regist(BoardDto board) throws Exception {
		dao.create(board);
		
		String[] files = board.getFiles();
		
		if(files == null){
			return;
		}
		
		for(String fileName : files){
			dao.addAttach(fileName);
		}
	}

	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public BoardDto read(int b_no) throws Exception {
		dao.updateViewCnt(b_no);
		return dao.read(b_no);
	}

	@Transactional
	@Override
	public void modify(BoardDto board) throws Exception {
		dao.update(board);
		
		int b_no = board.getB_no();
		
		dao.deleteAttach(b_no);
		
		String[] files = board.getFiles();
		
		if(files == null){
			return;
		}
		
		for(String fileName : files){
			dao.replaceAttach(fileName, b_no);
		}
	}

	@Transactional
	@Override
	public void remove(int b_no) throws Exception {
		dao.deleteAttach(b_no);
		dao.delete(b_no);
	}

	@Override
	public List<BoardDto> list() throws Exception {
		return dao.list();
	}

	@Override
	public List<BoardDto> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		return dao.countPaging(cri);
	}

	@Override
	public List<BoardDto> listSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

	@Override
	public List<String> getAttach(int b_no) throws Exception {
		return dao.getAttach(b_no);
	}

}
