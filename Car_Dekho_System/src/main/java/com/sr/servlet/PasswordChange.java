package com.sr.servlet;

import java.io.IOException;
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

public class PasswordChange extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	HttpSession session=req.getSession(false);
	String id=session.getAttribute("Id").toString();
	String current=req.getParameter("current");
	String newPass=req.getParameter("new");
	String newPass1=req.getParameter("new1");
	String otp=req.getParameter("otp");
	String otp1=req.getParameter("otp1");
	String mode=req.getParameter("mode");
	String status=null;
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	
	
		
	if(mode.equalsIgnoreCase("User")) {
		try {
	con=JdbcCon.getConnection();
	ps=con.prepareStatement("SELECT * FROM USERS WHERE ID=? AND PASSWORD=?");
	ps.setInt(1, Integer.parseInt(id));
	ps.setString(2, current);
	rs=ps.executeQuery();
	
	if(rs.next()) {
		if(newPass.equals(newPass1)) {
			if(otp.equals(otp1)) {
			ps=con.prepareStatement("UPDATE USERS SET PASSWORD=? WHERE ID=?");
			ps.setString(1, newPass);
			ps.setInt(2,Integer.parseInt(id));
			ps.executeUpdate();  
			status="success";
			}
			else
				status="otp";
		}
		else {
			status="confirm";
		}
		
		//if
	}
	else {
		status="current";
	}
	//try
		}
		
		catch (Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd=req.getRequestDispatcher("Status.jsp?status="+status);
		rd.forward(req, res);
		
		//user password
	}
	else {                                                                         //Admin Password Change
		
		try {
			con=JdbcCon.getConnection();
			ps=con.prepareStatement("SELECT * FROM ADMIN WHERE ID=? AND PASSWORD=?");
			ps.setInt(1, Integer.parseInt(id));
			ps.setString(2, current);
			rs=ps.executeQuery();
			
			if(rs.next()) {
				if(newPass.equals(newPass1)) {
					if(otp.equals(otp1)) {
					ps=con.prepareStatement("UPDATE ADMIN SET PASSWORD=? WHERE ID=?");
					ps.setString(1, newPass);
					ps.setInt(2,Integer.parseInt(id));
					ps.executeUpdate();  
					status="success";
					}
					else
						status="otp";
				}
				else {
					status="confirm";
				}
				
				//if
			}
			else {
				status="current";
			}
			//try
				}
				
				catch (Exception e) {
					e.printStackTrace();
				}
				
				RequestDispatcher rd=req.getRequestDispatcher("AdminStatus.jsp?status="+status);
				rd.forward(req, res);
				
	}
	
	
}

}
