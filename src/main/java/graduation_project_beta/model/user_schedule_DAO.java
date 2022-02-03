package graduation_project_beta.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class user_schedule_DAO {
	public ArrayList<user_schedule_DTO> arraylist_user_schedule;
	
	public user_schedule_DAO() {}
	private static user_schedule_DAO instance = new user_schedule_DAO();
	public static user_schedule_DAO getinstance() {return instance;}
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	public Connection getConnection() {
		String dbURL = "jdbc:mysql://localhost:3306/GraduationDB?serverTimezone=UTC&useSSL=false";
		String dbID = "root";
		String dbPassword = "root";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public void getUser_schedule() {
		arraylist_user_schedule = new ArrayList<user_schedule_DTO>();
		conn = getConnection();
		
		try {
			String sql = "select * from user_schedule";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int no_ = rs.getInt(1);
				String region = rs.getString(2);
				int first_period = rs.getInt(3);
				int last_period = rs.getInt(4);
				int place_count = rs.getInt(5);
				String place_list = rs.getString(6);
				String travel_name = rs.getString(7);
				String travel_content = rs.getString(8);
				
				user_schedule_DTO s = new user_schedule_DTO(no_,region,first_period,last_period,place_count,place_list,travel_name,travel_content);
				arraylist_user_schedule.add(s);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void setUser_schedule(String region,int first_period,int last_period, int place_count,String place_list,String travel_name,String travel_content) {
		conn = getConnection();
		
		try {
			
			String sql = "select * from user_schedule";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			
			//select문으로 no값만 가져옴 > ++한 후 넣기
			int no_ = 0;
			while(rs.next()) {
				no_ = rs.getInt(1);
			}
			
			sql = "insert into user_schedule values(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, ++no_);
			pstmt.setString(2, region);
			pstmt.setInt(3, first_period);
			pstmt.setInt(4, last_period);
			pstmt.setInt(5, place_count);
			pstmt.setString(6, place_list);
			pstmt.setString(7, travel_name);
			pstmt.setString(8, travel_content);
			
			pstmt.executeUpdate();
			
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void delete_user_schedule(String travel_name) {
		conn = getConnection();
		
		try {
			String sql = "delete from user_schedule where travel_name = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, travel_name);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
