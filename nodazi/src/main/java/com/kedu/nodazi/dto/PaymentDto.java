package com.kedu.nodazi.dto;

import java.util.Date;

public class PaymentDto {
	private String u_id;
	private int p_seq;
	private String p_account;
	private String p_dep_nm;
	private String p_dep_bank;
	private Date p_regdt;
	private Date p_depdt;
	private int p_price;
	private Date p_enddt;
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public int getP_seq() {
		return p_seq;
	}
	public void setP_seq(int p_seq) {
		this.p_seq = p_seq;
	}
	public String getP_account() {
		return p_account;
	}
	public void setP_account(String p_account) {
		this.p_account = p_account;
	}
	public String getP_dep_nm() {
		return p_dep_nm;
	}
	public void setP_dep_nm(String p_dep_nm) {
		this.p_dep_nm = p_dep_nm;
	}
	public String getP_dep_bank() {
		return p_dep_bank;
	}
	public void setP_dep_bank(String p_dep_bank) {
		this.p_dep_bank = p_dep_bank;
	}
	public Date getP_regdt() {
		return p_regdt;
	}
	public void setP_regdt(Date p_regdt) {
		this.p_regdt = p_regdt;
	}
	public Date getP_depdt() {
		return p_depdt;
	}
	public void setP_depdt(Date p_depdt) {
		this.p_depdt = p_depdt;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public Date getP_enddt() {
		return p_enddt;
	}
	public void setP_enddt(Date p_enddt) {
		this.p_enddt = p_enddt;
	}
	
}
