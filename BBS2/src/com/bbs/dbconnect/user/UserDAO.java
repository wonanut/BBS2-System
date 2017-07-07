package com.bbs.dbconnect.user;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import com.bbs.dbconnect.JDBCUtils;

public class UserDAO {
	
	public static User checkLogin(String username, String password)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try{
			conn = JDBCUtils.getConnection();
			stmt = conn.createStatement();
			
			//Send SQL prase
			String sql = "SELECT * FROM user WHERE username = '" + username + "' and password = '" + password + "'";
			
			System.out.println(sql);
			rs = stmt.executeQuery(sql);
			while (rs.next())
			{
				User user = new User();
				user.setUserid(rs.getString("userid"));
				user.setUsername(rs.getString("username"));
				user.setDescription(rs.getString("description"));
				user.setPassword(rs.getString("password"));
				user.setUserpic(rs.getString("userpic"));
				return user;
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
	
	public static String getNewID()
	{
		Date d = new Date();
		String s = null;

		DateFormat sdf3 = new SimpleDateFormat("yyMMdd");
		s = sdf3.format(d);

		String s1 = String.valueOf(s);//把num转化为字符串
	    int x;//定义两变量
	    Random ne=new Random();//实例化一个random的对象ne
	    x=ne.nextInt(9999-1000+1)+1000;//为变量赋随机值1000-9999
		/**System.out.println(x);//输出*/
		String x1 = String.valueOf(x);//把num转化为字符串
		String ID =s1+x1;

		return ID;
	}
	
	public boolean insert(User user)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try{
			conn = JDBCUtils.getConnection();
			stmt = conn.createStatement();
			
			//Send SQL prase
			String sql = "INSERT INTO user VALUES('"
						+ user.getUserid()
						+ "','"
						+ user.getUsername()
						+ "','"
						+ user.getDescription()
						+ "','"
						+ user.getPassword()
						+ "','"
						+ user.getUserpic()
						+ "')";
			
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
	
	public ArrayList<User> finAll()
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<User> list = new ArrayList<User>();
		
		try{
			conn = JDBCUtils.getConnection();
			stmt = conn.createStatement();
			
			//Send SQL prase
			String sql = "SELECT * from user";
			
			rs = stmt.executeQuery(sql);
			
			while (rs.next())
			{
				User user = new User();
				user.setUserid(rs.getString("userid"));
				user.setUsername(rs.getString("username"));
				user.setDescription(rs.getString("description"));
				user.setPassword(rs.getString("password"));
				user.setUserpic(rs.getString("userpic"));
				list.add(user);
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
	
	public User findUserById(String id)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try{
			conn = JDBCUtils.getConnection();
			stmt = conn.createStatement();
			
			//Send SQL prase
			String sql = "SELECT * FROM user WHERE userid = " + id;
			System.out.println(sql);
			
			rs = stmt.executeQuery(sql);
			
			while (rs.next())
			{
				User user = new User();
				user.setUserid(rs.getString("userid"));
				user.setUsername(rs.getString("username"));
				user.setDescription(rs.getString("description"));
				user.setPassword(rs.getString("password"));
				user.setUserpic(rs.getString("userpic"));
				System.out.println(user.getUserid());
				return user;
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
			
			String sql = "DELETE FROM user WHERE userid = " + id ;
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
	
	public boolean update(User user)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try{
			conn = JDBCUtils.getConnection();
			stmt = conn.createStatement();
			
			//Send SQL prase
			String sql = "UPDATE user SET userid='" + user.getUserid()
						+ "',username='" + user.getUsername()
						+ "',description='" + user.getDescription()
						+ "',password='" + user.getPassword()
						+ "',userpic='" + user.getUserpic()
						+ "' WHERE userid =" + user.getUserid();
			System.out.print(sql);
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
	
	public boolean updateUserpic(String userid,String picid)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try{
			conn = JDBCUtils.getConnection();
			stmt = conn.createStatement();
			
			//Send SQL prase
			String sql = "UPDATE user SET userpic = '" + picid + "' WHERE userid = '" + userid + "'";
			
			System.out.print(sql);
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

	public boolean isUserIdExist(String userid)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try{
			conn = JDBCUtils.getConnection();
			stmt = conn.createStatement();
			
			//Send SQL prase
			String sql = "SELECT * FROM user WHERE userid = " + userid;
			
			rs = stmt.executeQuery(sql);
			
			while (rs.next())
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
	
	public boolean isUserNameExist(String username)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try{
			conn = JDBCUtils.getConnection();
			stmt = conn.createStatement();
			
			//Send SQL prase
			String sql = "SELECT * FROM user WHERE username = '" + username + "'";
			
			rs = stmt.executeQuery(sql);
			
			while (rs.next())
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
