package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

import com.util.UserDBUtil;

public class DashboardNavigation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type = null;
		
		HttpSession session = request.getSession();
		
		String uname = (String) session.getAttribute("username");
		
		try {
			type = UserDBUtil.getType(uname);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		if(type.equals("customer")) {
			
			request.setAttribute("navigate", "home");
			
			RequestDispatcher rd = request.getRequestDispatcher("UserDashboardHome");
			
			rd.forward(request, response);
			
		}else if(type.equals("supplier")) {
			response.sendRedirect("SupplierAdmin.jsp?LoginSuccess");
		}else if(type.equals("organizer")) {
			response.sendRedirect("OrganizerDashboard?LoginSuccess");
		}else if(type.equals("admin")) {
			response.sendRedirect("OrganizerDashboard?LoginSuccess");
		}
	}

}
