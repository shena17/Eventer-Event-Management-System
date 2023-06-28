package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.model.Event;
import com.model.User;
import com.util.EventListDBUtil;
import com.util.SupplierDBUtil;

public class ShowEvents extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		List<Event>result = null;
		
		try {
			result  = EventListDBUtil.getEventDetails();
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
	
		request.setAttribute("EventDetails", result);
		RequestDispatcher rd = request.getRequestDispatcher("Events.jsp");
		rd.forward(request, response);
				
		}
	}


