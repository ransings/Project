package com.sr.servlet;

import java.io.File;
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

public class DeleteServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	PrintWriter out=res.getWriter();
	res.setContentType("text/html");
	
	Connection con=JdbcCon.getConnection();
	PreparedStatement ps=null;
	ResultSet rs=null;
	String status=null; 
	RequestDispatcher rd=null;
	
	//getting Admin
	HttpSession session=req.getSession(false);
	
	if(session==null){
		out.print("<center><font color=white>You must Login First</font></center>");
		    rd=req.getRequestDispatcher("login1.html"); 
		   	rd.include(req, res);
	}else
	if(!session.getAttribute("Mode").toString().equals("Admin") )
	{
		rd=req.getRequestDispatcher("login1.html"); 
	   	rd.forward(req, res);
	}
	
	
	String brand,model;
	brand=req.getParameter("Brand");
	model=req.getParameter("Model");

	try {
	ps=con.prepareStatement("SELECT * FROM CARS_INFO WHERE BRAND=? AND MODEL=?");
	ps.setString(1, brand);
	ps.setString(2, model);
	rs=ps.executeQuery();
	
	if(rs.next())
	{
	for(int i=1;i<=3;i++) {
	String name=rs.getString("IMG"+i);
	File f=new File(name);
	if(!f.delete())
		System.out.println("Failed to delete.....!!!!");
	}
	
	ps=con.prepareStatement("DELETE FROM CARS_INFO WHERE BRAND=? AND MODEL=?");
	ps.setString(1, brand);
	ps.setString(2, model);
	ps.executeUpdate();
	status="delete success";
	rd=req.getRequestDispatcher("AdminStatus.jsp?status="+status);
	rd.forward(req, res);
	}
	
	else {
		status="invalid delete";
		rd=req.getRequestDispatcher("AdminStatus.jsp?status="+status);
		rd.forward(req, res);
	}
	
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	
	}

}
