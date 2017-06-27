package com.kedu.nodazi.dto;

import java.util.Date;

public class HistoryDto {
	
	private Date	rec_dt;
	private Integer	rec_price;
	private Integer	latest_price;
	private double	variation;
	
	public Date getRec_dt() {
		return rec_dt;
	}

	public void setRec_dt(Date rec_dt) {
		this.rec_dt = rec_dt;
	}

	public Integer getRec_price() {
		return rec_price;
	}

	public void setRec_price(Integer rec_price) {
		this.rec_price = rec_price;
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
		return "HistoryDto [rec_dt=" + rec_dt + ", rec_price=" + rec_price + ", latest_price=" + latest_price
				+ ", variation=" + variation + "]";
	}

}
