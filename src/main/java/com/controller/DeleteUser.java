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

public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean isSuccess = false;
		
		HttpSession session = request.getSession();
		
		String username =  (String) session.getAttribute("username");
		
		try {
			isSuccess = UserDBUtil.deleteUser(username);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(isSuccess == true) {
			session.invalidate();
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp?DeleteSuccessful");
			rd.forward(request, response);
		}else{
			RequestDispatcher rd = request.getRequestDispatcher("register.jsp?DeleteUnsuccessful");
			rd.forward(request, response);
		}
		
		
	}

}
