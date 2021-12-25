package com.sr.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminController extends HttpServlet {
	
		protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String operation=req.getParameter("Operation");
		RequestDispatcher rd=null;
 
		
 
 switch (operation) {
 case "ChangePassword":
	 rd=req.getRequestDispatcher("AdminPassword.jsp");
	 rd.forward(req, res);
		break;
		
case "AddCar":
	  rd=req.getRequestDispatcher("upload.html");
	 rd.forward(req, res);
		break;

case "RemoveCar":
	rd=req.getRequestDispatcher("deleteCar.html");
	 rd.forward(req, res);
break;

case "UpdateCar":
	rd=req.getRequestDispatcher("updateCar.html");
	rd.include(req, res);
	break;
	
case "DeleteUser":
	rd=req.getRequestDispatcher("DeleteUser.jsp");
	rd.include(req, res);
	break;
	
case "ViewCar":
	rd=req.getRequestDispatcher("Main.jsp?Page=1");
	rd.include(req, res);
	break;
	
case "ViewFeedback":
	rd=req.getRequestDispatcher("ViewFeedback.jsp?Page=1");
	rd.include(req, res);
	break;

case "Report":
	rd=req.getRequestDispatcher("Report.jsp");
	rd.include(req, res);
	break;
	
default:
	break;
}
}
}
