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
import java.util.ArrayList;

import com.model.UpdateEvent;
import com.util.SupplierDBUtil;
import com.util.UserDBUtil;

public class ViewPastEvents extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = 0;
		HttpSession session = request.getSession();
		
		String uname = (String) session.getAttribute("username");
		
		try {
			id = UserDBUtil.getId(uname);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		ArrayList<UpdateEvent> event = SupplierDBUtil.getEventData(id);
		
		request.setAttribute("eventDetails", event);
		
		RequestDispatcher rd = 	request.getRequestDispatcher("EventsThanuka.jsp");
		rd.forward(request, response);
		
	}

}
