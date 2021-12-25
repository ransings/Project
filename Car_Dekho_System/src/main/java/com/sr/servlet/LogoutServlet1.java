package com.sr.servlet;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.*;

public class LogoutServlet1 extends HttpServlet{

	@Override
protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	HttpSession session=req.getSession(false);
	RequestDispatcher rd=null;
	PrintWriter out=res.getWriter();
	res.setContentType("text/html");
	
	
	if(session==null){
		
		out.print("<center><font color=white>You must Login First</font></center>");
		rd=req.getRequestDispatcher("login2.html");
		rd.include(req, res); 
		
	}
	else if(session.getAttribute("Mode").toString().equals("Admin")) {
		out.print("<center><font color=white>Logged Out Successsfully</font></center>");
		session.invalidate();		
		rd=req.getRequestDispatcher("login1.html");
		rd.include(req, res);
		
	}
	else if(session.getAttribute("Mode").toString().equals("User")){
		out.print("<center><font color=white>Logged Out Successsfully</font></center>");
		session.invalidate();	
		rd=req.getRequestDispatcher("login2.html");
		rd.include(req, res);
		
	}
	
	
	
}

}
