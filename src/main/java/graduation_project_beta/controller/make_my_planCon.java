package graduation_project_beta.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import graduation_project_beta.model.plan_DAO;
@WebServlet("/make_my_plan.do")
public class make_my_planCon extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request ,response);
		System.out.println("doget");
		System.out.println("성현");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request ,response);
		System.out.println("dopost");
	}
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		int check = -1;
		plan_DAO instance = plan_DAO.getinstance();
		String id = request.getParameter("id");
		String area = request.getParameter("area");
		int start_date = Integer.parseInt(request.getParameter("start_date"));
		int end_date = Integer.parseInt(request.getParameter("end_date"));
		String places = request.getParameter("places");
		String info_title = request.getParameter("info_title");
		
		int places_count = 0;
		char slash = '/';
		for(int i=0;i<places.length();i++) {
			if(places.charAt(i)==slash) {
				places_count++;
			}
		}
		
		if(id.equals("")) {
			check = -2;
		}
		
		System.out.println("이프밖");
		
		int public_ = 0;
		String plan_comment = "";
		int plan_liked = 0;
		
		if(check == -1) {
			instance.set_plan(id,public_, start_date, end_date, area, places,places_count, info_title,plan_comment,plan_liked);
			System.out.println("혹시 두번?");
		}
		request.setAttribute("id", id);
		RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
		dis.forward(request, response);
	}
}
