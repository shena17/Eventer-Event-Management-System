package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.model.User;
import com.util.UserDBUtil;


public class userProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String username = (String) session.getAttribute("username");
		
		List<User> details = UserDBUtil.getUserDetails(username);
		
		request.setAttribute("userDetails", details);
		
		RequestDispatcher rd = request.getRequestDispatcher("userProfile.jsp");
		rd.forward(request, response);
	}

}
