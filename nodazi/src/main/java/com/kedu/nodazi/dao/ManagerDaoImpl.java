package com.kedu.nodazi.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.kedu.nodazi.dto.PaymentDto;
import com.kedu.nodazi.dto.SearchCriteria;
import com.kedu.nodazi.dto.UserDto;

@Repository
public class ManagerDaoImpl implements ManagerDao {
	 
	@Inject
	private SqlSession session;

	private static Logger logger = LoggerFactory.getLogger(ManagerDaoImpl.class);
	
	private static String namespace = "com.kedu.nodazi.mapper.mangerMapper";
	
	@Override
	public List<PaymentDto> paymentListSearch(SearchCriteria sc) throws Exception{
		return session.selectList(namespace + ".paymentListSearch", sc);
	}
	
	@Override
	public int paymentListSearchCount(SearchCriteria sc) throws Exception {
		return session.selectOne(namespace + ".paymentListSearchCount", sc);
	}
	
	@Override
	public void updatePaymentStatus(List<PaymentDto> list) throws Exception {

		for(int i=0;i<list.size();i++ ){
			session.update(namespace+".updatePaymentStatus",list.get(i));
		}
	}
	
	@Override
	public List<UserDto> userListSearch(SearchCriteria sc) throws Exception {
		return session.selectList(namespace + ".userListSearch",sc) ;
	}
	
	@Override
	public int userListSearchCount(SearchCriteria sc) throws Exception {
		return session.selectOne(namespace + ".userListSearchCount", sc);
	}
	
}

