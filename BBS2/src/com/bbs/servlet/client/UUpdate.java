package com.bbs.servlet.client;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbs.dbconnect.user.User;
import com.bbs.dbconnect.user.UserDAO;

public class UUpdate extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
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
		String userName = request.getParameter("username");
		String psw = request.getParameter("password");
		String description = request.getParameter("desp");
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		User u = new User();
		u.setDescription(description);
		u.setPassword(psw);
		u.setUserid(userId);
		u.setUsername(userName);
		u.setUserpic("0");
		UserDAO dao = new UserDAO();
		if(dao.isUserNameExist(userName)){
			response.sendRedirect("client/UserPage.jsp");
			return;
		}
		dao.update(u);
		System.out.print("msg update success!");
		session.removeAttribute("userId");
		session.removeAttribute("userName");
		response.sendRedirect("client/Login.jsp");
		out.close();
	}

}
