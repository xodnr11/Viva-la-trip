package graduation_project_beta.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/make_plan/*")
public class make_planCon extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request ,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request ,response);
	}
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		String area = request.getParameter("area");
		String id = request.getParameter("id");
		
		System.out.println(area);
		System.out.println(id);
		request.setAttribute("selected_area_", area);
		request.setAttribute("id", id);
		RequestDispatcher dis = request.getRequestDispatcher("make_plan.jsp");
		dis.forward(request, response);
	}
}