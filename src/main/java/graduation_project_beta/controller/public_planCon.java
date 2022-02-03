package graduation_project_beta.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import graduation_project_beta.model.plan_DAO;
import graduation_project_beta.model.user_schedule_DAO;

@WebServlet("/public_plan/*")
public class public_planCon extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request ,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request ,response);
	}
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
		plan_DAO instance = plan_DAO.getinstance();
		instance.public_plan();
		
		String id = request.getParameter("id");
		
		request.setAttribute("arraylist_plan_public", instance.arraylist_plan_public);
		request.setAttribute("id", id);
		RequestDispatcher dis1 = request.getRequestDispatcher("public_plan.jsp");
		dis1.forward(request, response);
		
	}
}
