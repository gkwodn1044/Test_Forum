package user;

import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;

import java.sql.ResultSet;

// DAO : Database Access Object - Object for save or load data from DB

public class UserDAO {
	
	private Connection conn;	// connection : Object that connect with DB
	
	private PreparedStatement pstmt;
	
	private ResultSet rs;
	
	// if constructer called, connect DB
	
	public UserDAO() {
		
		try {
			
			String dbURL = "jdbc:mysql://localhost:3306/Test_Forum?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";	// localhost:3306 포트는 컴퓨터에 설치된 mysql 주소
			
			String dbID = "root";
			
			String dbPassword = "baroyak123$";
			
			Class.forName("com.mysql.jdbc.Driver");
			
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
		}
		
		catch(Exception e) {
			
			e.printStackTrace();	// 오류가 무엇인지 출력
			
		}
		
	}
	
	// login function
	
	public int login(String userEmail, String userPassword) {
		
		String SQL = "SELECT userPassword FROM USER WHERE userEmail = ?";
		
		try {
			
			// pstmt : prepared statement - put strings into ? part of SQL string - to prevent sql injection
			
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1,  userEmail);
			
			// rs : result set - store result from DB
			
			rs = pstmt.executeQuery();	// execute SQL string at connected DB
			
			// if there are results
			
			if (rs.next()) {
				
				// correct password
				
				if (rs.getString(1).equals(userPassword))
					
					return 1;	// login success
				
				// incorrect password
				
				else
					
					return 0;
				
			}
			
			return -1;	// no email on DB
			
		}
		
		catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
		return -2;	// DB error
		
	}
	
	public int join(User user) {
		
		String SQL = "INSERT INTO USER VALUES (?,?,?,?)";
		
		try {
			
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, user.getUserEmail());
			
			pstmt.setString(2, user.getUserPassword());
			
			pstmt.setString(3, user.getUserName());
			
			pstmt.setString(4, user.getUserGender());
			
			return pstmt.executeUpdate();
			
		}
		
		catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
		return -1;	// DB error
		
	}
	
}