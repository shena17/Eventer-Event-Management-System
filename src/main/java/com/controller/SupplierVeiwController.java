package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import com.model.SupplierDisplay;
import com.model.VenueDisplay;
import com.util.SupplierDB;
import com.util.venueDB;

public class SupplierVeiwController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action=request.getParameter("type");
		
		//if user selects to veiw the available venues this code executes
		if(action.equals("venue")) {
			ArrayList<VenueDisplay> venues=venueDB.getVenues();
			request.setAttribute("venues", venues);
			RequestDispatcher dispatcher=request.getRequestDispatcher("veiwvenues.jsp");
			dispatcher.forward(request,response);	
			
		}
		
		//if user click any other link other than venue this code executes
		else {
			//creates a arrayList from the supplierdisplay class and gets the relevent suppliers for the selected type
			ArrayList<SupplierDisplay> supplier=SupplierDB.getSupplier(action);
			request.setAttribute("supplier", supplier);
			//common supplier page to display all supplier information
			RequestDispatcher dispatcher=request.getRequestDispatcher("commonSupplier.jsp");
			dispatcher.forward(request,response);
			
		}
		
	}

}
