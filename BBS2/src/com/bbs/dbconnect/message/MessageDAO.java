package com.bbs.dbconnect.message;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.bbs.dbconnect.JDBCUtils;
import com.bbs.dbconnect.comment.Comment;
import com.bbs.dbconnect.user.User;

public class MessageDAO {
	
	public static String getNewId() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try{
			conn = JDBCUtils.getConnection();
			stmt = conn.createStatement();
			
			//Send SQL prase
			String sql = "SELECT * FROM message ORDER BY mesgid DESC LIMIT 1";
			
			rs = stmt.executeQuery(sql);
			
			while (rs.next())
			{
				Message mesg = new Message();
				mesg.setMesgid(rs.getString("mesgid"));
				return mesg.getMesgid();
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
	
	public static String getMsgDate()
	{
		Date d = new Date();
		String s = null;

		DateFormat sdf3 = new SimpleDateFormat("yyyy-MM-dd");
		s = sdf3.format(d);

		String s1 = String.valueOf(s);//把num转化为字符串
	    
		return s1;
	}
	
	public boolean insert(Message mesg)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try{
			conn = JDBCUtils.getConnection();
			stmt = conn.createStatement();
			
			//Send SQL prase
			String sql = "INSERT INTO message VALUES('"
						+ mesg.getMesgid()
						+ "','"
						+ mesg.getMesgtitle()
						+ "','"
						+ mesg.getMesgcontent()
						+ "','"
						+ mesg.getMesgdate()
						+ "','"
						+ mesg.getUserid()
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
	
	public ArrayList<Message> finAll()
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Message> list = new ArrayList<Message>();
		
		try{
			conn = JDBCUtils.getConnection();
			stmt = conn.createStatement();
			
			//Send SQL prase
			String sql = "SELECT * from message";
			
			rs = stmt.executeQuery(sql);
			
			while (rs.next())
			{
				Message mesg = new Message();
				mesg.setMesgid(rs.getString("mesgid"));
				mesg.setMesgcontent(rs.getString("mesgcontent"));
				mesg.setMesgdate(rs.getString("mesgdate"));
				mesg.setMesgtitle(rs.getString("mesgtitle"));
				mesg.setUserid(rs.getString("userid"));
				list.add(mesg);
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
	
	//通过用户id寻找对应的发布信息
	public ArrayList<Message> findMesgByUserId(String id)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Message> list = new ArrayList<Message>();
		
		try{
			conn = JDBCUtils.getConnection();
			stmt = conn.createStatement();
			
			//Send SQL prase
			String sql = "SELECT * FROM message WHERE userid = " + id;
			
			rs = stmt.executeQuery(sql);
			
			while (rs.next())
			{
				Message mesg = new Message();
				mesg.setMesgid(rs.getString("mesgid"));
				mesg.setMesgcontent(rs.getString("mesgcontent"));
				mesg.setMesgtitle(rs.getString("mesgtitle"));
				mesg.setMesgdate(rs.getString("mesgdate"));
				mesg.setUserid(rs.getString("userid"));
				list.add(mesg);
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
	
	//通过用户id寻找对应的发布信息
		public Message findMesgByMesgId(String mesgid)
		{
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			try{
				conn = JDBCUtils.getConnection();
				stmt = conn.createStatement();
				
				//Send SQL prase
				String sql = "SELECT * FROM message WHERE mesgid = " + mesgid;
				
				rs = stmt.executeQuery(sql);
				
				while (rs.next())
				{
					Message mesg = new Message();
					mesg.setMesgid(rs.getString("mesgid"));
					mesg.setMesgcontent(rs.getString("mesgcontent"));
					mesg.setMesgtitle(rs.getString("mesgtitle"));
					mesg.setMesgdate(rs.getString("mesgdate"));
					mesg.setUserid(rs.getString("userid"));
					return mesg;
				}
				return null;
				
			} catch(Exception e)
			{
				e.printStackTrace();
			} finally{
				JDBCUtils.release(rs, stmt, conn);
			}
			return null;
			
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
			String sql = "DELETE FROM message WHERE mesgid = " + id;
			
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
	
	public boolean update(Message mesg)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try{
			conn = JDBCUtils.getConnection();
			stmt = conn.createStatement();
			
			//Send SQL prase
			String sql = "UPDATE message SET mesgid='" + mesg.getMesgid()
						+ "',mesgtitle='" + mesg.getMesgtitle()
						+ "',mesgcontent='" + mesg.getMesgcontent()
						+ "',mesgdate='" + mesg.getMesgdate()
						+ "',userid='" + mesg.getUserid()
						+ "' WHERE mesgid =" + mesg.getMesgid();
			
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
