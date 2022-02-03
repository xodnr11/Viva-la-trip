package graduation_project_beta.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class plan_DAO {
	public ArrayList<plan_DTO> arraylist_plan;
	public ArrayList<plan_DTO> arraylist_plan_my;
	public ArrayList<plan_DTO> arraylist_plan_public;
	
	public plan_DAO() {}
	private static plan_DAO instance = new plan_DAO();
	public static plan_DAO getinstance() {return instance;}
	
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
		} catch(Exception e){
			e.printStackTrace();
		}
		return conn;
	}
	
	public void get_plan() {
		arraylist_plan = new ArrayList<plan_DTO>();
		conn = getConnection();
		
		try {
			String sql = "select * from plan";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int num = rs.getInt(1);
				String id = rs.getString(2);
				int public_ = rs.getInt(3);
				int start_date = rs.getInt(4);
				int end_date = rs.getInt(5);
				String area = rs.getString(6);
				String places = rs.getString(7);
				int places_count = rs.getInt(8);
				String info_title = rs.getString(9);
				String plan_comment = rs.getString(10);
				int plan_liked = rs.getInt(11);
				plan_DTO s = new plan_DTO(num,id,public_,start_date,end_date,area,places,places_count,info_title,plan_comment,plan_liked);
				arraylist_plan.add(s);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void get_my_plan(String id) {
		arraylist_plan_my = new ArrayList<plan_DTO>();
		conn = getConnection();
		
		try {
			String sql = "select * from plan where id = '"+id+"'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				int num = rs.getInt(1);
				id = rs.getString(2);
				int public_ = rs.getInt(3);
				int start_date = rs.getInt(4);
				int end_date = rs.getInt(5);
				String area = rs.getString(6);
				String places = rs.getString(7);
				int places_count = rs.getInt(8);
				String info_title = rs.getString(9);
				String plan_comment = rs.getString(10);
				int plan_liked = rs.getInt(11);
				
				plan_DTO s = new plan_DTO(num,id,public_,start_date,end_date,area,places,places_count,info_title,plan_comment,plan_liked);
				arraylist_plan_my.add(s);
				
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void set_plan(String id, int public_, int start_date, int end_date, String area, String places,int places_count, String info_title, String plan_comment, int plan_liked) {
		conn = getConnection();
		
		try {
			String sql = "select * from plan";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			//select문으로 no값만 가져옴 > ++한 후 넣기
			int num = 0;
			while(rs.next()) {
				num = rs.getInt(1);
			}
			
			sql = "insert into plan values(?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,++num);
			pstmt.setString(2, id);
			pstmt.setInt(3,public_);
			pstmt.setInt(4,start_date);
			pstmt.setInt(5, end_date);
			pstmt.setString(6, area);
			pstmt.setString(7, places);
			pstmt.setInt(8, places_count);
			pstmt.setString(9, info_title);
			pstmt.setString(10, plan_comment);
			pstmt.setInt(11, plan_liked);
			pstmt.executeUpdate();
			
			conn.close();
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void delete_my_plan(int num) {
		conn = getConnection();
		
		try {
			String sql = "delete from plan where num = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			conn.close();
		} catch (SQLException e){
			e.printStackTrace();
		}
	}
	
	public void plus_public_plan(int num) {
		conn = getConnection();
		
		try {
			String sql = "update plan set public = 1 where num ="+num;
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void public_plan() {
		arraylist_plan_public = new ArrayList<plan_DTO>();
		conn = getConnection();
		
		try {
			String sql = "select * from plan where public=1";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
		
			while(rs.next()) {
				int num = rs.getInt(1);
				String id = rs.getString(2);
				int public_ = rs.getInt(3);
				int start_date = rs.getInt(4);
				int end_date = rs.getInt(5);
				String area = rs.getString(6);
				String places = rs.getString(7);
				int places_count = rs.getInt(8);
				String info_title = rs.getString(9);
				String plan_comment = rs.getString(10);
				int plan_liked = rs.getInt(11);
				
				plan_DTO s = new plan_DTO(num,id,public_,start_date,end_date,area,places,places_count,info_title,plan_comment,plan_liked);
				arraylist_plan_public.add(s);
				
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	
}