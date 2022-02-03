package graduation_project_beta.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class userinfo_DAO {
		public ArrayList<userinfo_DTO> arraylist = new ArrayList<userinfo_DTO>(); //DTO를 ArrayList에 담음(배열)
		
		//싱글톤 활용
		private userinfo_DAO(){}
		private static userinfo_DAO instance = new userinfo_DAO(); //본인 클래스의 객체 생성
		public static userinfo_DAO getInstance() {return instance;} 
		
		Connection conn = null; //db 커넥션 변수 선언
		PreparedStatement pstmt = null; //db의 select문을 사용하기 위한 변수 선언 
		ResultSet rs = null; //db select의 결과를 담을 변수 선언
		
		//db 커넥션 메소드 선언
		public Connection getConnection() {
			//mysql의 graduationdb주소
			String dbURL = "jdbc:mysql://localhost:3306/GraduationDB?serverTimezone=UTC&useSSL=false"; 
			String dbID = "root";
			String dbPassword = "root";
			try { //오류가 나도 상관없이 실행 되도돌 트라이 캐치문 활용
		         Class.forName("com.mysql.cj.jdbc.Driver");
		         conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		      } catch (Exception e) {
		         e.printStackTrace(); //오류가 날 시 오류 설명문 출력
		      }
		      return conn;
		   }
		
		//select 활용
		
		public void getMember() {
			
			conn = getConnection(); //커넥션 함수호출
			try { //오류가 나도 상관없이 실행 되도돌 트라이 캐치문 활용
				String sql = "select * from UserInfo"; //sql변수에 db에 저장 된 회원정보를 읽어오는 명령어를 담음
				pstmt = conn.prepareStatement(sql); //자바에서 제공하는 db를 읽어올 수 있는 메소드에 sql을 담고 변수에 당므 
				rs  = pstmt.executeQuery();//결과를 담음
				
				while(rs.next()) {//db의 행(row)가 끝날 때까지 반복
					//순서대로 coloum의 값들을 읽어옴 
					int NUM = rs.getInt(1);     
					String ID = rs.getString(2);
					String PW = rs.getString(3);
					String UserName = rs.getString(4);
					String liked = rs.getString(5);
					
					//�����ڷ� ���� �ѹ��� �����͵� �ǰ�
					//getter, settter�� ������ �ص� ��
					userinfo_DTO s = new userinfo_DTO(NUM,ID,PW,UserName,liked); //DTD의 객체 생성
					arraylist.add(s); //생성된 객체에 담긴 정보들 전부 배열(어레이 리스트)에 추가
					
				}
				conn.close();
				
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		//insert 데이터베이스에 데이터 넣기
		public void setMember(String ID, String PW, String UserName,String liked) {
			conn = getConnection(); //db연결 함수호출
			try {
				//위와 동일
				String sql = "select * from UserInfo";//
				pstmt = conn.prepareStatement(sql);
				rs  = pstmt.executeQuery();
				int NUM = 0;
				
				//select문으로 no(회원번호)값만 가져옴(자동으로 회원번호가 증가되기 위해) > ++한 후 넣기
				while(rs.next()) {
					NUM = rs.getInt(1);
				}
				sql = "insert into UserInfo values(?,?,?,?,?)";//uswerinfo에 6개의 정보가 들어가야 하므로
				pstmt = conn.prepareStatement(sql);//쿼리문 실행
				
				
				pstmt.setInt(1, ++NUM); //회원정보 증가
				pstmt.setString(2,ID); 	//아이디 추가
				pstmt.setString(3,PW);	//비밀번호 추가
				pstmt.setString(4,UserName);//닉네임 추가
				pstmt.setString(5,liked); //좋아요한 목록
				
				pstmt.executeUpdate();		//db업데이트 함수
				
				conn.close();				//db close
				
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
}
