package com.bbs.test;

import com.bbs.dbconnect.user.UserDAO;

public class IsUserExistTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		UserDAO ud = new UserDAO();
		if(ud.isUserNameExist("123"))
		{
			System.out.println("Exist!");
		}
	}

}
