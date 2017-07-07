package com.bbs.test;

import com.bbs.dbconnect.user.UserDAO;

public class InsertTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		UserDAO ud = new UserDAO();
		ud.updateUserpic("1707043520", "2");
	}

}
