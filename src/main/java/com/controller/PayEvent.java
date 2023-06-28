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

import com.util.EventDB;

public class PayEvent extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int eid = Integer.parseInt(request.getParameter("id"));
		
		double budget = 0;
		String name = null;
		
		try {
			budget = EventDB.getBudget(eid);
			name = EventDB.getName(eid);			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("name", name);
		request.setAttribute("budget", budget);
		request.setAttribute("eid", eid);
		
		RequestDispatcher rd = request.getRequestDispatcher("payEvent.jsp");
		rd.forward(request, response);
	}

}
