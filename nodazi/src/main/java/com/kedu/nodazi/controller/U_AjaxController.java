package com.kedu.nodazi.controller;

import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kedu.nodazi.dto.UserDto;
import com.kedu.nodazi.service.UserService;
@RestController
@RequestMapping("/user")
public class U_AjaxController {
	private static final Logger logger = LoggerFactory.getLogger(U_AjaxController.class);
	@Inject
	private UserService uservice;		

	
	@RequestMapping(value="/{u_id}",method= {RequestMethod.PUT,RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("u_id")String u_id,@RequestBody UserDto udto){
		ResponseEntity<String>entity = null;
		try{
			udto.setU_id(u_id);
			uservice.userUpdate(udto);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(
					e.getMessage(),HttpStatus.BAD_REQUEST);
	}
		return entity;
		
	}
	
	@RequestMapping(value="/overlap",method = RequestMethod.PUT)
	public String Overlap(@RequestBody String u_id) throws Exception{
		return uservice.overlap(u_id);
	}
	
/*	@RequestMapping(value="/login",method = RequestMethod.PUT)
	public int loginCheck(@PathVariable("u_id") String u_id
							, @PathVariable("u_pw") String u_pw)throws Exception{
		int result = 0; 
		String pw = uservice.loginCheck(u_id);
		
		if(pw == null){
			result = 0;  // 아이디가 틀렸을때
		}else if(pw != null){
			if(pw != u_pw){
				result = 1; //비밀번호가 틀렸을대
			}else{
				result = 2; //성공.
			}
		}
		
		return  result;
		
	}*/
	@RequestMapping(value="/login",method = RequestMethod.PUT)
	public int loginCheck(@RequestBody Map<String,String> logininfo)throws Exception{
		String u_id = logininfo.get("u_id");
		String u_pw = logininfo.get("u_pw");
		logger.info(u_pw);
		int result = 0; 
		String pw = uservice.loginCheck(u_id);
		logger.info(pw);
		if(pw == null){
			result = 0;  // 아이디가 틀렸을때
		}else if(pw != null){
			if(pw.equals(u_pw)){
				result = 2; //비밀번호가 틀렸을때
			}else{
				result = 1; //성공.
			}
		}
		
		return  result;
		
	}
}
