package com.kedu.nodazi.dao;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kedu.nodazi.dto.LoginDto;
import com.kedu.nodazi.dto.PaymentDto;
import com.kedu.nodazi.dto.UserDto;
@Repository
public class UserDaoImpl implements UserDao{
	
	@Inject
	private SqlSession session;
	
	private static String namespace 
	="com.kedu.nodazi.mapper.UserMapper";
	
	public void regist(UserDto udto)throws Exception{
		session.insert(namespace+".regist",udto);
	}
	
	public UserDto login(LoginDto ldto) throws Exception{
		return session.selectOne(namespace + ".login",ldto);
	}
	
	public void payment(PaymentDto pdto)throws Exception{
		 session.insert(namespace+".payment",pdto);
	}
	
	public UserDto info(String u_id)throws Exception{
		return session.selectOne(namespace + ".info",u_id);
	}
	

	public List<PaymentDto> paymentDetail(String u_id)throws Exception{
		return session.selectList(namespace + ".paymentDetail",u_id);
	}
	
	public void userUpdate(UserDto udto)throws Exception{
		 session.update(namespace+".userUpdate",udto);
	}
	
	public void withdraw(UserDto udto)throws Exception{
		session.update(namespace+".withdraw",udto);
	}
	public String overlap(String u_id)throws Exception{
		return session.selectOne(namespace+".overlap",u_id);
	}
	public String loginCheck(String u_id) throws Exception{
		return session.selectOne(namespace+".loginCheck",u_id);
	}

	@Override
	public Date checkUseService(String u_id) throws Exception {
		return session.selectOne(namespace + ".checkUseService",u_id);
	}
}
