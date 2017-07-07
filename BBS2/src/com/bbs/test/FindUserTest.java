package com.bbs.test;

import com.bbs.dbconnect.user.User;
import com.bbs.dbconnect.user.UserDAO;

public class FindUserTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		UserDAO ud = new UserDAO();
		User u = ud.findUserById("Howard");
		System.out.println(u.getDescription());
		//ud.delete("17070002");
	}

}
