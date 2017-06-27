package com.kedu.nodazi.dto;

import java.util.Date;

public class DateHistoryDto {

	private String	code;
	private Date	rec_dt;
	private String	company;
	private Integer	latest_close;
	private Integer rec_close;
	private double	variation;
	
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Date getRec_dt() {
		return rec_dt;
	}
	public void setRec_dt(Date rec_dt) {
		this.rec_dt = rec_dt;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public Integer getLatest_close() {
		return latest_close;
	}
	public void setLatest_close(Integer latest_close) {
		this.latest_close = latest_close;
	}
	public Integer getRec_close() {
		return rec_close;
	}
	public void setRec_close(Integer rec_close) {
		this.rec_close = rec_close;
	}
	public double getVariation() {
		return variation;
	}
	public void setVariation(double variation) {
		this.variation = variation;
	}
	
	
	@Override
	public String toString() {
		return "DateHistoryDto [code=" + code + ", rec_dt=" + rec_dt + ", company=" + company + ", latest_close="
				+ latest_close + ", rec_close=" + rec_close + ", variation=" + variation + "]";
	}
	
	
}
