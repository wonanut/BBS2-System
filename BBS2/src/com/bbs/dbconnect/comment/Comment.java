package com.bbs.dbconnect.comment;

import java.sql.Date;

public class Comment {

	private String comid;
	
	private String mesgid;
	
	private String userid;
	
	private String comcontent;
	
	private String comdate;

	public String getComid() {
		return comid;
	}

	public void setComid(String comid) {
		this.comid = comid;
	}

	public String getMesgid() {
		return mesgid;
	}

	public void setMesgid(String mesgid) {
		this.mesgid = mesgid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getComcontent() {
		return comcontent;
	}

	public void setComcontent(String comcontent) {
		this.comcontent = comcontent;
	}

	public String getComdate() {
		return comdate;
	}

	public void setComdate(String comdate) {
		this.comdate = comdate;
	}
}
