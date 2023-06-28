package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import com.model.Supplier;
import com.model.Venue;
import com.service.EventServices;
import com.util.EventDB;
import com.util.SupplierDB;
import com.util.venueDB;

public class BookingHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String etype=request.getParameter("eventType");
		String date=request.getParameter("date");
		String[] options=request.getParameterValues("list");
		int noOfGuest=Integer.parseInt(request.getParameter("noOfGuest")) ;
		String color=request.getParameter("themeColor");

		EventServices.setData(etype, date, options, noOfGuest, color);
		PrintWriter out=response.getWriter();
				
		try {
			//getting venues which are available for the selected date and the selected event type
			
			List<Venue> vData=venueDB.getVenueList(date, etype);
			request.setAttribute("Venue", vData);
			
			//getting a list of suppliers which are available on the selected date and who provide above services
			List<Supplier> sData=SupplierDB.getSupplierList(options,date);
			request.setAttribute("Supplier", sData);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//sending the data for the bookvenue.jsp page
		RequestDispatcher dis=request.getRequestDispatcher("bookVenue.jsp");
		dis.forward(request,response);

	}
	
}
