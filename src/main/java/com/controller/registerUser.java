package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import com.util.UserDBUtil;

public class registerUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String nic = request.getParameter("nic");
		String phone = request.getParameter("contact");
		String email = request.getParameter("email");
		String uname = request.getParameter("username");
		String pwd = request.getParameter("pwd");
		
		boolean isSuccess = false;
		boolean isExisting = false;
		
		try {
			isExisting = UserDBUtil.isExisting(uname);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		if(isExisting == false) {
				try {
				
				isSuccess = UserDBUtil.insertUser(fname, lname, nic, phone, email, uname, pwd);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if(isSuccess == true) {
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp?RegistrationSuccess");
				rd.forward(request, response);
			}else {
				RequestDispatcher rd = request.getRequestDispatcher("register.jsp?RegistrationFailed");
				rd.forward(request, response);
			}
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("register.jsp?RegistrationFailed");
			rd.forward(request, response);
		}
		
		
		
	}

}
