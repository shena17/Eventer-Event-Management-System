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

public class loginUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public loginUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uname = request.getParameter("username");
		String pwd = request.getParameter("pwd");
		String type = null;
		
		boolean isSuccess = false;
		boolean isExisting = false;
		
		try {
			isExisting = UserDBUtil.isExisting(uname);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		if(isExisting == true) {
				try {	
				isSuccess = UserDBUtil.loginUser(uname, pwd);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			if(isSuccess == true) {
				
				HttpSession session = request.getSession();
				
				session.setAttribute("username", uname);
								
				response.sendRedirect("index.jsp?LoginSuccess");
				
			}else {
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp?LoginFailed");
				rd.forward(request, response);
			}
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp?LoginFailed");
			rd.forward(request, response);
		}
		
		
	}

}
