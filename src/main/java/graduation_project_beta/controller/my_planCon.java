package graduation_project_beta.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import graduation_project_beta.model.plan_DAO;

@WebServlet("/my_plan.do")
public class my_planCon extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request ,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request ,response);
	}
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
		plan_DAO instance = plan_DAO.getinstance();
		instance.get_plan();
		String id = request.getParameter("id");
		for(int i=0;i<instance.arraylist_plan.size();i++) {
			if(instance.arraylist_plan.get(i).getId().equals(id)) {
				instance.get_my_plan(id);
				request.setAttribute("arraylist_plan", instance.arraylist_plan_my);
				
			}
		}
		request.setAttribute("id", id);
		RequestDispatcher dis = request.getRequestDispatcher("my_plan.jsp");
		dis.forward(request, response);
		
	}
}