package com.sr.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sr.dao.JdbcCon;

public class DeleteUserServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	     PrintWriter out=res.getWriter();
		String id=req.getParameter("Mail");
		Connection con =JdbcCon.getConnection();
		RequestDispatcher rd=req.getRequestDispatcher("DeleteUser.jsp");
		
		                                                                         //getting Admin
		HttpSession session=req.getSession(false);
		
		if(session.getAttribute("Mode")==null){
			out.print("<center><font color=white>You must Login First</font></center>");
			    rd=req.getRequestDispatcher("login1.html"); 
			   	rd.include(req, res);
		}else
		if(session.getAttribute("Mode")==null || !session.getAttribute("Mode").toString().equals("Admin") )
		{
			rd=req.getRequestDispatcher("login1.html"); 
		   	rd.forward(req, res);
		}
		
		try {
			PreparedStatement ps=con.prepareStatement("DELETE FROM USERS WHERE MAIL=?");
		    ps.setString(1, id);
		    ps.executeUpdate();
		    rd.forward(req, res);
		}
		catch (Exception e) {
		e.printStackTrace();	
		}
	
	}
}
