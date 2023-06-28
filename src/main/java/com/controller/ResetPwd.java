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

public class ResetPwd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean isSuccess;
		
		String username = request.getParameter("username");
		String pwd = request.getParameter("pwd");
		
		try {
			isSuccess = UserDBUtil.resetPwd(username, pwd);
			
			if(isSuccess == true) {
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp?ResetSuccessful");
				rd.forward(request, response);
			}
			else {
				RequestDispatcher rd = request.getRequestDispatcher("resetPwd.jsp?ResetUnsuccessful");
				rd.forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
			
	}

}
