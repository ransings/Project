package com.sr.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sr.dao.JdbcCon;

public class UpdateServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    res.setContentType("text/html");
    PrintWriter out=res.getWriter();
    Connection con=JdbcCon.getConnection();
    PreparedStatement ps=null;
    RequestDispatcher rd=null;
    String status=null;
    
    //getting Admin
HttpSession session=req.getSession(false);

if(session==null){
	out.print("<center><font color=white>You must Login First</font></center>");
 rd=req.getRequestDispatcher("login1.html"); 
 rd.include(req, res);
}else
if(!session.getAttribute("Mode").toString().equals("Admin") )
{
	out.print("<center><font color=white>You must Login First</font></center>");
rd=req.getRequestDispatcher("login1.html"); 
rd.include(req, res);
}
    
    String brand,model,nBrand,nModel,color,price;
    int i=0;
    brand=req.getParameter("Brand");
    model=req.getParameter("Model");
    nBrand=req.getParameter("Nbrand");
    nModel=req.getParameter("Nmodel");
    color=req.getParameter("Color");
    price=req.getParameter("Price");
    
    try {
    	ps=con.prepareStatement("update Cars_INFO set BRAND=?,MODEL=?,COLOR=?,PRICE=? where BRAND=? AND MODEL=?");
    	ps.setString(1, nBrand);
    	ps.setString(2, nModel);
    	ps.setString(3, color);
    	ps.setString(4, price);
    	ps.setString(5, brand);
    	ps.setString(6, model);
    	i=ps.executeUpdate();
    }
    catch (Exception e) {
		e.printStackTrace();
	}
    

    if(i>0)
    {
    	status="success update";
    	rd=req.getRequestDispatcher("AdminStatus.jsp?status="+status);
    	rd.include(req, res);
    }
	
	}

}
