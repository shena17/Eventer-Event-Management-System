package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import com.model.PastEvents;
import com.model.UpcommingEvents;
import com.util.DashBoardDB;
import com.util.PastEventsDB;
import com.util.UpCommingDB;
import com.util.UserDBUtil;

public class DashBordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action=request.getParameter("godash");
		int uid = 0;
		
		HttpSession session = request.getSession();
		String uname = (String) session.getAttribute("username");
		
		try {
			uid = UserDBUtil.getId(uname);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
						
		//if user clicks home button in the navigation pannel this code excetuted
		if(action.equals("home")) {
			int countUpComming = 0;
			int countPast=0;
			
			try {
				countUpComming = DashBoardDB.getCountUpComming(uid);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			countPast=DashBoardDB.getCountPast(uid);
			
			ArrayList<UpcommingEvents> events=DashBoardDB.getUpcommingList(uid);

			request.setAttribute("upComming", countUpComming);
			request.setAttribute("past", countPast);
			request.setAttribute("events", events);
			RequestDispatcher dispatcher=request.getRequestDispatcher("userDash.jsp");
			dispatcher.forward(request,response);
		}
		
		//if user clicks upcomming in the navigation pannel this code is executed
		if(action.equals("upcomming")) {
			
			ArrayList<UpcommingEvents> events=UpCommingDB.getUpcommingList(uid);

			request.setAttribute("events", events);
			RequestDispatcher dispatcher=request.getRequestDispatcher("upcoming.jsp");
			dispatcher.forward(request,response);			
			
			
		}
		
		//if user clicks past in the navigation pannel this code is executed
		if(action.equals("past")) {
			ArrayList<PastEvents> events=PastEventsDB.getPastList(uid);
			
			request.setAttribute("events", events);
			RequestDispatcher dispatcher=request.getRequestDispatcher("past.jsp");
			dispatcher.forward(request,response);			
			
		}
		
		
	}

}
