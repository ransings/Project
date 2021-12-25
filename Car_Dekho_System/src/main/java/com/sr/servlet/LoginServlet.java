package com.sr.servlet;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sr.dao.JdbcCon;



public class LoginServlet extends HttpServlet {  	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter pw=res.getWriter();
		res.setContentType("text/html");
		String mode=req.getParameter("Mode");
		Connection con=null;
		String id=req.getParameter("UserName");
		String password=req.getParameter("Password");
		
		
		if(mode.equalsIgnoreCase("Admin"))
		{
			
		con=JdbcCon.getConnection();
		try {
		PreparedStatement ps=con.prepareStatement("SELECT * FROM ADMIN WHERE EMAIL=? AND PASSWORD=?");
		ps.setString(1,id);
		ps.setString(2, password);
		ResultSet rs=ps.executeQuery();
				if(rs.next())
				{
				HttpSession session=req.getSession();
				session.setAttribute("Mode", "Admin");
				session.setAttribute("Id", rs.getInt("Id"));
		RequestDispatcher rd=req.getRequestDispatcher("AdminConsole.jsp");
		rd.forward(req, res);
				}
				RequestDispatcher rd=req.getRequestDispatcher("login1.html");
				pw.println("<font color=white><center>Invalid Credentials...</center></font><br>");
				rd.include(req, res);
				
				
				
		}
		catch (Exception e) {
				e.printStackTrace();
				}
		

		}
		
		
		
		else {
			con=JdbcCon.getConnection();
			try {
			PreparedStatement ps=con.prepareStatement("SELECT * FROM Users WHERE MAIL=? AND PASSWORD=?");
			ps.setString(1,id);
			ps.setString(2, password);
			ResultSet rs=ps.executeQuery();
					if(rs.next())
					{
						HttpSession session=req.getSession();
						session.setAttribute("Mode", "User");
						session.setAttribute("Id", rs.getInt("Id"));
			RequestDispatcher rd=req.getRequestDispatcher("UserConsole.jsp");
			rd.forward(req, res);
					}
					RequestDispatcher rd=req.getRequestDispatcher("login2.html");
					pw.println("<font color=white><center>Invalid Credentials...</center></font><br>");
					rd.include(req, res);
					
					
					
			}
			catch (Exception e) {
					e.printStackTrace();
					}

		}
			
			}
	
	
}
