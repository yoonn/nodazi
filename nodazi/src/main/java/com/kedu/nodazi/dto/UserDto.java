package com.kedu.nodazi.dto;

import java.util.Date;

public class UserDto {
	
	private String u_nm;
	private String u_id;
	private String u_pw;
	private String u_email;
	private String u_mobile;
	private Date u_regdt;
	private Date u_updatedt;
	private Date u_withdrawdt;
	private int u_mgr;
	private int u_withdraw;
	
	public String getU_nm() {
		return u_nm;
	}
	public void setU_nm(String u_nm) {
		this.u_nm = u_nm;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_pw() {
		return u_pw;
	}
	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public String getU_mobile() {
		return u_mobile;
	}
	public void setU_mobile(String u_mobile) {
		this.u_mobile = u_mobile;
	}
	public Date getU_regdt() {
		return u_regdt;
	}
	public void setU_regdt(Date u_regdt) {
		this.u_regdt = u_regdt;
	}
	public Date getU_updatedt() {
		return u_updatedt;
	}
	public void setU_updatedt(Date u_updatedt) {
		this.u_updatedt = u_updatedt;
	}
	public Date getU_withdrawdt() {
		return u_withdrawdt;
	}
	public void setU_withdrawdt(Date u_withdrawdt) {
		this.u_withdrawdt = u_withdrawdt;
	}
	public int getU_mgr() {
		return u_mgr;
	}
	public void setU_mgr(int u_mgr) {
		this.u_mgr = u_mgr;
	}
	public int getU_withdraw() {
		return u_withdraw;
	}
	public void setU_withdraw(int u_withdraw) {
		this.u_withdraw = u_withdraw;
	}
	
	@Override
	public String toString() {
		return "UserDto [u_nm=" + u_nm + ", u_id=" + u_id + ", u_pw=" + u_pw + ", u_email=" + u_email + ", u_mobile="
				+ u_mobile + ", u_regdt=" + u_regdt + ", u_updatedt=" + u_updatedt + ", u_withdrawdt=" + u_withdrawdt
				+ ", u_mgr=" + u_mgr + ", u_withdraw=" + u_withdraw + "]";
	}
	
	
	
}
