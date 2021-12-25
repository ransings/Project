package com.sr.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class HomeServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session=request.getSession(false);
		RequestDispatcher rd=null;
		PrintWriter out=response.getWriter();
		
		if(session==null) {
			out.print("<center><font color=white>You must Login First</font></center>");
			rd=request.getRequestDispatcher("login2.html");
			rd.include(request, response); 		
			}
		else if(session.getAttribute("Mode").toString().equalsIgnoreCase("Admin")) {
			rd=request.getRequestDispatcher("AdminConsole.jsp");
			rd.include(request, response); 	
		}
		else if(session.getAttribute("Mode").toString().equalsIgnoreCase("User")){
			rd=request.getRequestDispatcher("UserConsole.jsp");
			rd.include(request, response); 	
		}
		
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
