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
import graduation_project_beta.model.user_schedule_DAO;

@WebServlet("/my_plan_delete.do")
public class my_plan_deleteCon extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request ,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request ,response);
	}
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
		plan_DAO instance = plan_DAO.getinstance();
		String id = request.getParameter("id");
		instance.get_my_plan(id);
		int no = Integer.parseInt(request.getParameter("no__"));
		
		instance.delete_my_plan(no);
		request.setAttribute("id", id);
		System.out.println(id);
		RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
		dis.forward(request, response);
	}
}