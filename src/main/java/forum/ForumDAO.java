package forum;

import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;

import java.sql.ResultSet;

import java.util.ArrayList;

public class ForumDAO {

	private Connection conn;

	private ResultSet rs;

	public ForumDAO() {

		try {

			String dbURL = "jdbc:mysql://localhost:3306/Test_Forum?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";

			String dbID = "root";

			String dbPassword = "baroyak123$";

			Class.forName("com.mysql.jdbc.Driver");

			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

		}
		
		catch (Exception e) {

			e.printStackTrace();

		}

	}

	// function that bring current time

	public String getDate() { 

		String SQL = "SELECT NOW()";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			rs = pstmt.executeQuery();

			if(rs.next()) {

				return rs.getString(1);

			}

		} 
			
		catch (Exception e) {

			e.printStackTrace();

		}

		return "";	// DB error

	}

	// return number of posts + 1

	public int getNext() { 

		String SQL = "SELECT forumID FROM FORUM ORDER BY forumID DESC";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			rs = pstmt.executeQuery();

			if(rs.next()) {

				return rs.getInt(1) + 1;

			}

			return 1;	// if there is no post

		} 
		
		catch (Exception e) {

			e.printStackTrace();

		}

		return -1;	// DB error

	}

	// write post function

	public int write(String forumTitle, String userName, String forumContent) { 

		String SQL = "INSERT INTO FORUM VALUES(?, ?, ?, ?, ?, ?, ?)";

		try {	

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1, getNext());

			pstmt.setString(2, forumTitle);

			pstmt.setString(3, userName);

			pstmt.setString(4, getDate());

			pstmt.setString(5, forumContent);

			pstmt.setInt(6, 1);
			
			pstmt.setString(7,  getDate());

			return pstmt.executeUpdate();	

		} 
		
		catch (Exception e) {

			e.printStackTrace();

		}

		return -1;	// DB error

	}
	
	public ArrayList<Forum> getList(int pageNumber) {
		
		String SQL = "SELECT * FROM FORUM WHERE forumID < ? AND forumAvailable = 1 ORDER BY forumID DESC LIMIT 10";
		
		ArrayList<Forum> list = new ArrayList<Forum>();
		
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1,  getNext() - (pageNumber - 1) * 10);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				Forum forum = new Forum();
				
				forum.setForumID(rs.getInt(1));
				
				forum.setForumTitle(rs.getString(2));
				
				forum.setUserName(rs.getString(3));
				
				forum.setForumDate(rs.getString(4));
				
				forum.setForumContent(rs.getString(5));
				
				forum.setForumAvailable(rs.getInt(6));
				
				forum.setForumUpdate(rs.getString(7));
				
				list.add(forum);
				
			}
			
		}
		
		catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return list;
		
	}
	
	public boolean nextPage (int pageNumber) {
		
		String SQL = "SELECT * FROM FORUM WHERE forumID < ? AND forumAvailable = 1 ORDER BY forumID DESC LIMIT 10";
		
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			
			rs = pstmt.executeQuery();
			
			if (rs.next())
				
				return true;
			
		}
		
		catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return false;
		
	}
	
	public Forum getForum(int forumID) {
		
		String SQL = "SELECT * FROM FORUM WHERE forumID = ?";
		
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1,  forumID);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				
				Forum forum = new Forum();
				
				forum.setForumID(rs.getInt(1));
				
				forum.setForumTitle(rs.getString(2));
				
				forum.setUserName(rs.getString(3));
				
				forum.setForumDate(rs.getString(4));
				
				forum.setForumContent(rs.getString(5));
				
				forum.setForumAvailable(rs.getInt(6));
				
				forum.setForumUpdate(rs.getString(7));
				
				return forum;
				
			}
			
		}
		
		catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return null;
		
	}
	
	public int edit(int forumID, String forumTitle, String forumContent) {
		
		String SQL = "UPDATE FORUM SET forumTitle = ?, forumContent = ?, forumUpdate = ? WHERE forumID = ?";
		
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1,  forumTitle);
			
			pstmt.setString(2, forumContent);
			
			pstmt.setString(3, getDate());
			
			pstmt.setInt(4,  forumID);
			
			return pstmt.executeUpdate();
			
		}
		
		catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return -1;
		
	}
	
	public int delete(int forumID) {
		
		String SQL = "UPDATE FORUM SET forumAvailable = 0 WHERE forumID = ?";
		
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1, forumID);
			
			return pstmt.executeUpdate();
			
		}
		
		catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return -1;
		
	}

}