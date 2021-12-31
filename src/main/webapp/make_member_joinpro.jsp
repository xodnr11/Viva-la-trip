<%@ page language="java" contentType="text/html; charset="
    pageEncoding="utf-8"%>
        <%@page import="java.util.ArrayList"%>
<%@page import="graduation_project_beta.DAO"%>
<%@page import="graduation_project_beta.DTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
		DAO instance = DAO.getInstance(); //객체 주소 불러옴(객체 만듬)
		instance.getMember(); //select 함수 불러오기
		ArrayList<DTO> arraylist = instance.arraylist; //어레이 리스트 가져오기
		int log = -1; //
		
	%>
	<!-- 데이터만 확인하고
		로그인이 되면 index로
		안되면 다시 로그인 페이지로
		 -->
	<%
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
			session.setAttribute("login_log",log); // -1
			response.sendRedirect("index.jsp"); 
		}else{ //아이디 중복 log = 1 회원가입 실패
			//다시 로그인 페이지로 넘어가기
			session.setAttribute("login_log",log); // 1
			response.sendRedirect("login.jsp"); 
			
		}
	%>
</body>
</html>