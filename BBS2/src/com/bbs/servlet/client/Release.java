package com.bbs.servlet.client;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.NumberFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbs.dbconnect.comment.CommentDAO;
import com.bbs.dbconnect.message.Message;
import com.bbs.dbconnect.message.MessageDAO;

public class Release extends HttpServlet {

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
		String title = request.getParameter("title");
		String msg = request.getParameter("msg");
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		if(userId == null) return;
		MessageDAO dao = new MessageDAO();
		Message m = new Message();
		m.setUserid(userId);
		m.setMesgtitle(title);
		m.setMesgcontent(msg);
		m.setMesgdate(MessageDAO.getMsgDate());

		String tmp_comid = MessageDAO.getNewId();
		int tmp_comid1 = Integer.parseInt(tmp_comid) + 1;
        //得到一个NumberFormat的实例
        NumberFormat nf = NumberFormat.getInstance();
        //设置是否使用分组
        nf.setGroupingUsed(false);
        //设置最大整数位数
        nf.setMaximumIntegerDigits(5);
        //设置最小整数位数    
        nf.setMinimumIntegerDigits(5);
        //输出测试语句
		
		m.setMesgid(nf.format(tmp_comid1));
		
		dao.insert(m);
		System.out.print("success!\nwith:"+title+":"+msg+"\nby"+userId);
		response.sendRedirect("client/UserPage.jsp");
		out.close();
	}

}
