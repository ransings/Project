package com.sr.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserController extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String operation=req.getParameter("Operation");
		RequestDispatcher rd=null;
  
 switch (operation) {

 		
case "ViewCar":
	rd=req.getRequestDispatcher("Main.jsp?Page=1");
	rd.include(req, res);
	break;
	
case "Feedback":
	rd=req.getRequestDispatcher("Feedback.jsp");
	rd.include(req, res);
	break;

case "ChangePassword":
	rd=req.getRequestDispatcher("Password.jsp");
	rd.include(req, res);
	break;

case "Upcoming":
	rd=req.getRequestDispatcher("Upcoming.jsp?Page=1");
	rd.include(req, res);
	break;
	
case "Brands":
	rd=req.getRequestDispatcher("Brands.jsp");
	rd.include(req, res);
	break;
	
	
default:
	break;
}
		
	}

}
