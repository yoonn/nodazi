package com.kedu.nodazi.dto;

public class FavorDto {
	
	private Integer	seq;
	private	String	code;
	private	String	company;
	private	Integer	int_price;
	private	Integer	latest_price;
	private double	variation;

	
	public Integer getSeq() {
		return seq;
	}
	public void setSeq(Integer seq) {
		this.seq = seq;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public Integer getInt_price() {
		return int_price;
	}
	public void setInt_price(Integer int_price) {
		this.int_price = int_price;
	}
	public Integer getLatest_price() {
		return latest_price;
	}
	public void setLatest_price(Integer latest_price) {
		this.latest_price = latest_price;
	}
	public double getVariation() {
		return variation;
	}
	public void setVariation(double variation) {
		this.variation = variation;
	}
	
	
	@Override
	public String toString() {
		return "FavorDto [seq=" + seq + ", code=" + code + ", company=" + company + ", int_price=" + int_price
				+ ", latest_price=" + latest_price + ", variation=" + variation + "]";
	}

	
	
}
