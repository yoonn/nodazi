package com.kedu.nodazi.dto;

public class CodesDto {

	private Integer id;
	private String	last_update;
	private String	code;
	private String	full_code;
	private Integer	market_type;
	private	String	company;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getLast_update() {
		return last_update;
	}
	public void setLast_update(String last_update) {
		this.last_update = last_update;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		for(int length=code.length(); length<6; length++){
			code = "0" + code;
		}
		this.code = code;
	}
	public String getFull_code() {
		return full_code;
	}
	public void setFull_code(String full_code) {
		this.full_code = full_code;
	}
	public Integer getMarket_type() {
		return market_type;
	}
	public void setMarket_type(Integer market_type) {
		this.market_type = market_type;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}

	
	@Override
	public String toString() {
		return "CodesDto [id=" + id + ", last_update=" + last_update + ", code=" + code + ", full_code=" + full_code
				+ ", market_type=" + market_type + ", company=" + company + "]";
	}
	
}
