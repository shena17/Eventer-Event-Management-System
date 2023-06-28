package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import com.util.EventDB;

public class PaymentConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		double cardNo = Double.parseDouble(request.getParameter("cno")) ;		
		double expiry = Double.parseDouble(request.getParameter("expiry")) ;
		double ccv = Double.parseDouble(request.getParameter("ccv")) ;	
		int eid = Integer.parseInt(request.getParameter("eid"));
		boolean success = false;
		
		
		if(cardNo != 0 && expiry != 0 && ccv != 0) {
			try {
				success = EventDB.confirmPayment(eid);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			if(success == true) {
				RequestDispatcher rd = request.getRequestDispatcher("upcoming.jsp?Success");
				rd.forward(request, response);
			}else {
				RequestDispatcher rd = request.getRequestDispatcher("PayEvent?Unsuccess");
				rd.forward(request, response);
			}
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("PayEvent?Unsuccess");
			rd.forward(request, response);
		}
	}

}
