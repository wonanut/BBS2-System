package com.bbs.dbconnect.message;

import java.sql.Date;

public class Message {
	
	private String mesgid;
	
	private String mesgcontent;
	
	private String mesgtitle;
	
	public String getMesgtitle() {
		return mesgtitle;
	}

	public void setMesgtitle(String mesgtitle) {
		this.mesgtitle = mesgtitle;
	}

	public String getMesgid() {
		return mesgid;
	}

	public void setMesgid(String mesgid) {
		this.mesgid = mesgid;
	}

	public String getMesgcontent() {
		return mesgcontent;
	}

	public void setMesgcontent(String mesgcontent) {
		this.mesgcontent = mesgcontent;
	}

	public String getMesgdate() {
		return mesgdate;
	}

	public void setMesgdate(String mesgdate) {
		this.mesgdate = mesgdate;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	private String mesgdate;
	
	private String userid;

}
