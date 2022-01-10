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

@WebServlet("/loginpro.do")
public class loginproCon extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request ,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request ,response);
	}
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		DAO instance = DAO.getInstance();
		instance.getMember();
		ArrayList<DTO> arraylist = instance.arraylist;
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		int log = -1;
		for(int i=0;i<arraylist.size();i++) {
			if(arraylist.get(i).getId().equals(id)) {
				if(arraylist.get(i).getPw().equals(pw)) {
					log = 1;
				}
			}
		}
		if(log == 1) {
			RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis_fail = request.getRequestDispatcher("login.jsp");
			dis_fail.forward(request, response);
		}
		
	}
}
