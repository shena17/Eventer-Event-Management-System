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
import com.util.EventDB;
import com.util.UserDBUtil;

public class ViewEvents extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String uname = (String) session.getAttribute("username");
		int uid = 0;
				
		try {
			uid = UserDBUtil.getId(uname);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		ArrayList<UpdateEvent> details = EventDB.getEventDetails(uid);
		
		request.setAttribute("details", details);
		
		RequestDispatcher rd = request.getRequestDispatcher("ViewEventsThanuka.jsp");
		rd.forward(request, response);
	}

}
