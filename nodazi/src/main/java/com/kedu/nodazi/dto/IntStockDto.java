package com.kedu.nodazi.dto;

import java.util.Date;

public class IntStockDto {
	
	private Integer	i_seq;
	private	String	u_id;
	private String	code;
	private Date	i_regdt;
	public Integer getI_seq() {
		return i_seq;
	}
	public void setI_seq(Integer i_seq) {
		this.i_seq = i_seq;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Date getI_regdt() {
		return i_regdt;
	}
	public void setI_regdt(Date i_regdt) {
		this.i_regdt = i_regdt;
	}
	
	@Override
	public String toString() {
		return "IntStockDto [i_seq=" + i_seq + ", u_id=" + u_id + ", code=" + code + ", i_regdt=" + i_regdt + "]";
	}

}
