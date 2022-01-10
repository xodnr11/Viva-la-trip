package graduation_project_beta.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import graduation_project_beta.model.DAO;
import graduation_project_beta.model.DTO;

@WebServlet("/make_member_joinpro.do")
public class make_member_joinproCon extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request ,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request ,response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		DAO instance = DAO.getInstance(); //객체 주소 불러옴(객체 만듬)
		instance.getMember(); //select 함수 불러오기
		ArrayList<DTO> arraylist = instance.arraylist; //어레이 리스트 가져오기
		int log = -1; //
		
	
	
		String id = request.getParameter("id");
		
		//아이디 값 비교
		for(int i=0;i<arraylist.size();i++){
			if( arraylist.get(i).getId().equals(id) ){
				log = 1;
			}
		}
		if(log != 1){ //아이디 중복 x //회원가입 성공
			String pw = request.getParameter("pw");
			String date_of_birth = request.getParameter("date_of_birth");
			String gender = request.getParameter("gender");
			String username = request.getParameter("username");
			instance.setMember(id, pw, date_of_birth, gender,username);
			//회원전용 페이지로 이동
			RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
			dis.forward(request, response);
		}else{ //아이디 중복 log = 1 회원가입 실패
			//다시 로그인 페이지로 넘어가기
			RequestDispatcher dis_fail = request.getRequestDispatcher("login.jsp");
			dis_fail.forward(request, response);
		}
	}
}