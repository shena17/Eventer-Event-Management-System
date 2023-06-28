package com.controller;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import com.util.OrganizerDBUtil;

public class RegisterOrganizer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fname = request.getParameter("FirstName");
		String lname = request.getParameter("LastName");
		String email = request.getParameter("Email");
		String NIC  = request.getParameter("NIC");
		String uname = request.getParameter("USerName");
		String password = request.getParameter("Password");
		
		boolean result = false;
		
		try {
			result = OrganizerDBUtil.insertOrganizer(fname, lname, email, NIC, uname, password);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		if(result == true) {
			RequestDispatcher rd = request.getRequestDispatcher("OrganizerDashboard");
			rd.forward(request, response);
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("AddOrganizer.jsp");
			rd.forward(request, response);
		}
		
	}

}
