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

import com.model.User;
import com.util.UserDBUtil;

public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String nic = request.getParameter("nic");
		String phone = request.getParameter("contact");
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		
		boolean isSuccess = false;
		
		try {
		
			isSuccess = UserDBUtil.updateUser(fname, lname, nic, phone, email, username);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(isSuccess == true) {
			RequestDispatcher rd = request.getRequestDispatcher("userProfile?UpdateSuccess");
			rd.forward(request, response);
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("updateProfile.jsp?UpdateFailed");
			rd.forward(request, response);
		}
	}


}
