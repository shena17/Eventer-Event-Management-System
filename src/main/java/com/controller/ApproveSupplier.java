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
import com.util.SupplierDBUtil;

public class ApproveSupplier extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		boolean result = false;
		
		try {
			result = SupplierDBUtil.approveSupplier(id);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(result == true) {
			RequestDispatcher rd = request.getRequestDispatcher("ShowSupplier");
			rd.forward(request, response);
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("ShowSupplier");
			rd.forward(request, response);
	
		}
				
	}
}


