package com.bbs.servlet.client;

import java.io.IOException;
import java.io.PrintWriter;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbs.dbconnect.user.User;
import com.bbs.dbconnect.user.UserDAO;

public class Register extends HttpServlet {

	public Register() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		UserDAO tmpD = new UserDAO();
		User tmpU = new User();
		String userName, userPsw , userRpsw, userDesp, userIcon, userId;
		userName = request.getParameter("username");
		userPsw = request.getParameter("password");
		userDesp = request.getParameter("desp");
		userRpsw = request.getParameter("repassword");
		userId = UserDAO.getNewID();
		System.out.println(userName);
		System.out.println(userPsw);
		userIcon = "0";
		if(tmpD.isUserNameExist(userName)){
			response.sendRedirect("client/UserRegister.jsp");
			return;
		}
		
		tmpU.setDescription(userDesp);
		tmpU.setPassword(userPsw);
		tmpU.setUsername(userName);
		tmpU.setUserid(userId);
		tmpU.setUserpic(userIcon);

		tmpD.insert(tmpU);
		HttpSession session = request.getSession();
		session.setAttribute("userId", userId);
		session.setAttribute("userName", userName);
		System.out.println("a");
		response.sendRedirect("client/RegisterSuccess.jsp");
		
		//out.flush();
		//out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
