package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import com.model.UpcommingEvents;
import com.util.EventDB;
import com.util.UpCommingDB;

public class DeleteEventController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int eid=Integer.parseInt(request.getParameter("delete"));
		
		boolean isTrue;
		//deleting the selected event
		isTrue=EventDB.deleteEvent(eid);
		
		
		//display the rest of the upcomming events
		if(isTrue==true) {
			ArrayList<UpcommingEvents> events=UpCommingDB.getUpcommingList(3);
			System.out.println("Inside");
			request.setAttribute("events", events);
			RequestDispatcher dispatcher=request.getRequestDispatcher("upcoming.jsp");
			dispatcher.forward(request,response);	
		}
		else {
			System.out.println("Error");
		}
	}

}
