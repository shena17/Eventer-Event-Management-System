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
import java.util.ArrayList;
import java.util.List;

import com.model.Event;
import com.service.EventServices;
import com.util.EventDB;

public class BookSupplierHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//getting the selected venue
		int vid=Integer.parseInt(request.getParameter("venue"));
		
		Event e1=EventServices.getObj();
		
		String[] option=e1.getArr();
		int[] sid=new int[] {0,0,0,0};
		
		//getting the selected suppliers and assing to the array
		for(int i=0;i<option.length;i++) {
			if(option[i].equals("food")) {
				int food=Integer.parseInt(request.getParameter("food"));
				sid[i]=food;
			}
			if(option[i].equals("deco")) {
				int deco=Integer.parseInt(request.getParameter("deco"));
				sid[i]=deco;
			}
			
			if(option[i].equals("photography")) {
				int photography=Integer.parseInt(request.getParameter("photography"));
				sid[i]=photography;
			}
			
			if(option[i].equals("music")) {
				int music=Integer.parseInt(request.getParameter("music"));
				sid[i]=music;
			}
			
		}
		
		//sending the array to the eventServices 
		e1.setSuppliers(sid);
		
		//sending the venue to the eventServices
		EventServices.setVenue(vid);
		
		//calling the function to calculate the total
		EventServices.calcTotal();

		//forwarding to the eventConfrim page
		RequestDispatcher dis=request.getRequestDispatcher("eventConfirm.jsp");
		dis.forward(request, response);

	}

}
