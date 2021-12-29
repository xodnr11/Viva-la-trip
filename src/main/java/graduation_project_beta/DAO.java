package graduation_project_beta;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class DAO {

		public ArrayList<DTO> arraylist = new ArrayList<DTO>();

		private DAO(){}
		private static DAO instance = new DAO(); //占쏙옙체
		public static DAO getInstance() {return instance;} //占쏙옙체 占쌍쇽옙 占쏙옙환
		
		Connection conn = null;
		PreparedStatement pstmt = null; //占쏙옙占쏙옙占쏙옙 Select占쏙옙占� 
		ResultSet rs = null; //占쏙옙占�
		

		public Connection getConnection() {
			String dbURL = "jdbc:mysql://localhost:3306/GraduationDB?serverTimezone=UTC&useSSL=false";
			String dbID = "root";
			String dbPassword = "root";
			try {
		         Class.forName("com.mysql.cj.jdbc.Driver");
		         conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		      } catch (Exception e) {
		         e.printStackTrace();
		      }
		      return conn;
		   }
		
		//select 占쏙옙占쏙옙占싶븝옙占싱쏙옙占쏙옙 占쌍댐옙 占쏙옙占싱븝옙 占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙
		
		public void getMember() {
			
			conn = getConnection(); //占쏙옙占� 占쏙옙占쏙옙占�
			try {
				String sql = "select * from UserInfo";//3占쏙옙
				pstmt = conn.prepareStatement(sql);//占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
				rs  = pstmt.executeQuery();//占쏙옙占� (占쏙옙트占싼울옙占쏙옙)
				
				while(rs.next()) {//10占쏙옙 > 10占쏙옙
					int NUM = rs.getInt(1);
					String ID = rs.getString(2);
					String PW = rs.getString(3);
					
					//占쏙옙占쏙옙占쌘뤄옙 占쏙옙占쏙옙底� 占싼뱄옙占쏙옙 占쏙옙占쏙옙占싶듸옙 占실곤옙
					//getter, 
					DTO s = new DTO(NUM,ID,PW); //占쏙옙占쏙옙占쏙옙
					arraylist.add(s);
					
				}
				conn.close();
				
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		//insert �뜲�씠�꽣踰좎씠�뒪�뿉 �뜲�씠�꽣 �꽔湲�
		public void setMember(String ID, String PW) {
			conn = getConnection(); //占쏙옙占� 占쏙옙占쏙옙占�
			try {
				String sql = "select * from UserInfo";//3占쏙옙
				pstmt = conn.prepareStatement(sql);//占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
				rs  = pstmt.executeQuery();//占쏙옙占� (占쏙옙트占싼울옙占쏙옙)
				int NUM = 0;
				//select臾몄쑝濡� no媛믩쭔 媛��졇�샂 > ++�븳 �썑 �꽔湲�
				while(rs.next()) {
					NUM = rs.getInt(1);
				}
				sql = "insert into UserInfo values(?,?,?)";//3媛�
				pstmt = conn.prepareStatement(sql);//荑쇰━臾� �떎�뻾
				
				
				pstmt.setInt(1, ++NUM);
				pstmt.setString(2,ID);
				pstmt.setString(3,PW);
				
				pstmt.executeUpdate();
				
				conn.close();
				
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
}
