package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.User;
import com.util.OrganizerDBUtil;
import com.util.SupplierDBUtil;


public class ShowSupplier extends HttpServlet {
	private static final long serialVersionUID = 1L;

    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<User>result = null;
		List<User>pending = null;
		
		try {
			
			//Get All Suppliers
			result  = SupplierDBUtil.getSupplierDetails();
			//Get Pending Suppliers
			pending = SupplierDBUtil.displayPendingSuppliers();
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
	
		request.setAttribute("SupPendDetails", pending);
		request.setAttribute("SupDetails", result);
		RequestDispatcher rd = request.getRequestDispatcher("supplierAdd.jsp");
		rd.forward(request, response);
				
		}
	

	
	
	}


