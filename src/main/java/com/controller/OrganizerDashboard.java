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

import com.model.Event;
import com.model.Payments;
import com.util.EventListDBUtil;
import com.util.PaymentDBUtil;
import com.util.SupplierDBUtil;

public class OrganizerDashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		List<Event>result = null;
		List<Payments>pay = null;
		int supplierCount = 0;
		//int onGoingEvents = 0;
		//int pastEvents = 0;
		
		try {
			result  = EventListDBUtil.getEventDetails();
			supplierCount = SupplierDBUtil.supplierCount();
			pay = PaymentDBUtil.getPaymentDetails();
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
	
		request.setAttribute("EventDetails", result);
		request.setAttribute("SupCount", supplierCount);
		request.setAttribute("PaymentDetails", pay);
		RequestDispatcher rd = request.getRequestDispatcher("OrganizerDashboard.jsp");
		rd.forward(request, response);
				
		
	}

}