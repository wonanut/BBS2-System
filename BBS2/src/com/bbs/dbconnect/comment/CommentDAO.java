package com.bbs.dbconnect.comment;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import com.bbs.dbconnect.JDBCUtils;
import com.bbs.dbconnect.message.Message;
import com.bbs.dbconnect.user.User;

public class CommentDAO {
	
	public static String getMsgDate()
	{
		Date d = new Date();
		String s = null;

		DateFormat sdf3 = new SimpleDateFormat("yyyy-MM-dd");
		s = sdf3.format(d);

		String s1 = String.valueOf(s);//把num转化为字符串
	    
		return s1;
	}
	
	public boolean insert(Comment comm)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try{
			conn = JDBCUtils.getConnection();
			stmt = conn.createStatement();
			
			//Send SQL prase
			String sql = "INSERT INTO comment VALUES('"
						+ comm.getComid()
						+ "','"
						+ comm.getMesgid()
						+ "','"
						+ comm.getUserid()
						+ "','"
						+ comm.getComcontent()
						+ "','"
						+ comm.getComdate()
						+ "')";
			
			int num = stmt.executeUpdate(sql);
			if(num > 0)
			{
				return true;
			}
			return false;
		} catch(Exception e)
		{
			e.printStackTrace();
		} finally{
			JDBCUtils.release(rs, stmt, conn);
		}
		return false;
	}
	
	//通过用户id寻找对应的发布信息
		public ArrayList<Comment> findCommByMesgId(String id)
		{
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			ArrayList<Comment> list = new ArrayList<Comment>();
			
			try{
				conn = JDBCUtils.getConnection();
				stmt = conn.createStatement();
				
				//Send SQL prase
				String sql = "SELECT * FROM comment WHERE mesgid = " + id;
				
				rs = stmt.executeQuery(sql);
				
				while (rs.next())
				{
					Comment comm = new Comment();
					comm.setComid(rs.getString("comid"));
					comm.setMesgid(rs.getString("mesgid"));
					comm.setUserid(rs.getString("userid"));
					comm.setComcontent(rs.getString("comcontent"));
					comm.setComdate(rs.getString("comdate"));
					list.add(comm);
				}
				return list;
				
			} catch(Exception e)
			{
				e.printStackTrace();
			} finally{
				JDBCUtils.release(rs, stmt, conn);
			}
			return null;
			
		}

		
		public static String getNewMsgId() {
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			try{
				conn = JDBCUtils.getConnection();
				stmt = conn.createStatement();
				
				//Send SQL prase
				String sql = "SELECT * FROM comment ORDER BY comid DESC LIMIT 1";
				
				rs = stmt.executeQuery(sql);
				
				while (rs.next())
				{
					Comment comm = new Comment();
					comm.setComid(rs.getString("comid"));
					comm.setMesgid(rs.getString("mesgid"));
					comm.setUserid(rs.getString("userid"));
					comm.setComcontent(rs.getString("comcontent"));
					comm.setComdate(rs.getString("comdate"));
					return comm.getComid();
				}
				return "00000";
				
			} catch(Exception e)
			{
				e.printStackTrace();
			} finally{
				JDBCUtils.release(rs, stmt, conn);
			}
			return "00000";
			
		}
		
		public boolean delete(String id)
		{
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			try{
				conn = JDBCUtils.getConnection();
				stmt = conn.createStatement();
				
				//Send SQL prase
				String sql = "DELETE FROM comment WHERE comid = " + id;
				System.out.println(sql);
				int num = stmt.executeUpdate(sql);
				
				if(num > 0)
				{
					return true;
				}
				return false;
				
			} catch(Exception e)
			{
				e.printStackTrace();
			} finally{
				JDBCUtils.release(rs, stmt, conn);
			}
			return false;
			
		}
	
}
