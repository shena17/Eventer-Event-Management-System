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
import com.model.UpdateEvent;
import com.util.EventDB;
import com.util.UpCommingDB;

public class EventUpdateControler extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int id=Integer.parseInt(request.getParameter("update"));
		
		ArrayList<UpdateEvent> eventData=EventDB.getEventData(id);
		
		request.setAttribute("eventData", eventData);
		RequestDispatcher dispatcher=request.getRequestDispatcher("UpdateEvent.jsp");
		dispatcher.forward(request,response); 
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id=Integer.parseInt(request.getParameter("id"));
		int venue=Integer.parseInt(request.getParameter("venue"));
		String color=request.getParameter("color");
		String date=request.getParameter("date");
		int num=Integer.parseInt(request.getParameter("number"));
		
		boolean isTrue;
		
		isTrue=EventDB.updateEvent(id,venue,date,color,num);
		
		if(isTrue==true) {
			ArrayList<UpcommingEvents> events=UpCommingDB.getUpcommingList(3);
			System.out.println("Inside");
			request.setAttribute("events", events);
			RequestDispatcher dispatcher=request.getRequestDispatcher("upcoming.jsp");
			dispatcher.forward(request,response); 
			
		}
		else {
			
		}
	}

}
