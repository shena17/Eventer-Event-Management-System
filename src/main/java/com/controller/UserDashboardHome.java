package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import com.model.UpcommingEvents;
import com.util.DashBoardDB;

public class UserDashboardHome extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String actionHome = (String) request.getAttribute("navigate");
				
		if(actionHome.equals("home")) {
			int countUpComming = 0;
			int countPast=0;

			try {
				countUpComming = DashBoardDB.getCountUpComming(3);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			countPast=DashBoardDB.getCountPast(3);
			
			ArrayList<UpcommingEvents> events=DashBoardDB.getUpcommingList(3);

			request.setAttribute("upComming", countUpComming);
			request.setAttribute("past", countPast);
			request.setAttribute("events", events);
			RequestDispatcher dispatcher=request.getRequestDispatcher("userDash.jsp");
			dispatcher.forward(request,response);
		}
	}

}
