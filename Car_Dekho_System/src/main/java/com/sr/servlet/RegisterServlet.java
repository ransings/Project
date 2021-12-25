package com.sr.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.SQLRecoverableException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sr.dao.JdbcCon;

public class RegisterServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		PrintWriter pw=res.getWriter();
		String Fname=req.getParameter("Fname");
		String Mname=req.getParameter("Mname");
		String Lname=req.getParameter("Lname");
		String Gender=req.getParameter("Gender");
		String Age=req.getParameter("Age");
		String Contact=req.getParameter("Contact");
		String Mail=req.getParameter("Mail");
		String Password=req.getParameter("Password");
		
		Connection con=null;
		PreparedStatement ps=null;
		RequestDispatcher rd=null;
		
			

		try {
			con=JdbcCon.getConnection();
		ps=con.prepareStatement("INSERT INTO Users VALUES(?,?,?,?,?,?,?,?,UserId.NEXTVAL)");
		ps.setString(1,Fname);
		ps.setString(2,Mname);
		ps.setString(3,Lname);
		ps.setString(4, Gender);
		ps.setInt(5, Integer.parseInt(Age));
		ps.setString(6, Contact);
		ps.setString(7, Mail);
		ps.setString(8, Password);
		
		
		int ins=ps.executeUpdate();
		
		if(ins>0)
		{
			rd=req.getRequestDispatcher("login2.html");
			rd.forward(req, res);
		}
		else {
			pw.println("Failed To Register Try Again...<br>");
			rd=req.getRequestDispatcher("Register.html");
			rd.include(req, res);
		}
		
		}
		catch (SQLIntegrityConstraintViolationException e) {
			pw.println("<font size=5 color=white><center>Failed To Register Try Another Email<br><br></center></font>");
			rd=req.getRequestDispatcher("register.html");
			rd.include(req, res);
		}
		
		catch (Exception e) {

			e.printStackTrace();
			
		}





	}

}
