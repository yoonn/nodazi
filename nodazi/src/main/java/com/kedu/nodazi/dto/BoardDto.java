package com.kedu.nodazi.dto;

import java.util.Arrays;
import java.util.Date;

public class BoardDto {
	private	int		 b_no;
	private String	 b_title;
	private String	 b_content;
	private String	 u_id;
	private Date	 b_regdt;
	private int		 b_notice;
	private int		 b_top;
	private Date	 b_updatedt;
	private int		 b_viewcnt;
	private int		 r_cnt;
	private String[] files;
	
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public Date getB_regdt() {
		return b_regdt;
	}
	public void setB_regdt(Date b_regdt) {
		this.b_regdt = b_regdt;
	}
	public int getB_notice() {
		return b_notice;
	}
	public void setB_notice(int b_notice) {
		this.b_notice = b_notice;
	}
	public int getB_top() {
		return b_top;
	}
	public void setB_top(int b_top) {
		this.b_top = b_top;
	}
	public Date getB_updatedt() {
		return b_updatedt;
	}
	public void setB_updatedt(Date b_updatedt) {
		this.b_updatedt = b_updatedt;
	}
	public int getB_viewcnt() {
		return b_viewcnt;
	}
	public void setB_viewcnt(int b_viewcnt) {
		this.b_viewcnt = b_viewcnt;
	}
	public int getR_cnt() {
		return r_cnt;
	}
	public void setR_cnt(int r_cnt) {
		this.r_cnt = r_cnt;
	}
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	
	@Override
	public String toString() {
		return "BoardDto [b_no=" + b_no + ", b_title=" + b_title + ", b_content=" + b_content + ", u_id=" + u_id
				+ ", b_regdt=" + b_regdt + ", b_notice=" + b_notice + ", b_top=" + b_top + ", b_updatedt=" + b_updatedt
				+ ", b_viewcnt=" + b_viewcnt + ", r_cnt=" + r_cnt + ", files=" + Arrays.toString(files) + "]";
	}
		
}
