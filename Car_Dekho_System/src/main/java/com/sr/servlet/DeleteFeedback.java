package com.sr.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sr.dao.JdbcCon;

public class DeleteFeedback extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int Id=Integer.parseInt(request.getParameter("Id"));
		RequestDispatcher rd=null;
		PrintWriter out=response.getWriter();
		Connection con=JdbcCon.getConnection();
		PreparedStatement ps=null;
		String status=null;
		
		//Validating Session
		HttpSession session=request.getSession(false);
		if(session==null) {
			out.print("<center><font color=white>You must Login First</font></center>");
			rd=request.getRequestDispatcher("login1.html");
			rd.include(request, response); 
		}
		else
		if(!session.getAttribute("Mode").toString().equals("Admin") )
		{
			out.print("<center><font color=white>You must Login First</font></center>");
		rd=request.getRequestDispatcher("login1.html"); 
		  	rd.include(request, response);
		}
		
		//deleting Feeedback
		try {
			ps=con.prepareStatement("DELETE FROM FEEDBACK WHERE USERID=?");
			ps.setInt(1, Id);
			ps.executeUpdate();
			status="feedback success";
		}
		catch (SQLException e) {
			e.printStackTrace();
			status="feedback fail";
		}
	
	rd=request.getRequestDispatcher("AdminStatus.jsp?status="+status);
	rd.forward(request, response);
		
	}


}
