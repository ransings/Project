package com.sr.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.sr.dao.JdbcCon;

public class UploadServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
res.setContentType("text/html");
	PrintWriter out=res.getWriter();
	RequestDispatcher rd=null;
 
	//getting Admin
	HttpSession session=req.getSession(false);
	if(session==null){
		out.print("<center><font color=white>You must Login First</font></center>");
		rd=req.getRequestDispatcher("login1.html"); 
		rd.include(req, res);
}	else
	if(!session.getAttribute("Mode").toString().equals("Admin") )
	{
		out.print("<center><font color=white>You must Login First</font></center>");
		rd=req.getRequestDispatcher("login1.html"); 
		rd.include(req, res);
}
	
ServletFileUpload sf=new ServletFileUpload(new DiskFileItemFactory());
Connection con=null;
PreparedStatement ps=null;


	

try {
	con=JdbcCon.getConnection();
ps=con.prepareStatement("INSERT INTO CARS_INFO VALUES(CAR_SEQ.NEXTVAL,?,?,?,?,?,?,?,?)");
String name=null;
	List<FileItem> files=sf.parseRequest(req);
	int i=1;
	
	for(FileItem item : files) {
		
		
		if(item.isFormField()) {
			if(i==1) {
				name=item.getString();
				ps.setString(i,item.getString());
						}
			else if(i==2)
				{
				name=name+"-"+item.getString();
				ps.setString(i,item.getString());
				}
			else if(i!=4)
			{
				ps.setString(i,item.getString());
			}
			else
				{
				ps.setFloat(i,Float.parseFloat(item.getString()));
				}
			i++;
		} 
		else {
		File file=new File("D:\\Workspace\\Advance java\\Car_Dekho_System\\src\\main\\photos\\"+name+"-"+(i-4)+".jpg");
		item.write(file);
		ps.setString(i,"D:\\Workspace\\Advance java\\Car_Dekho_System\\src\\main\\photos\\"+name+"-"+(i-4)+".jpg");
		
	i++;
	
	

		
}
	
//for
	}
	
	
	if(ps.executeUpdate()>0) {
	String status="uploaded";
	rd=req.getRequestDispatcher("AdminStatus.jsp?status="+status);
	rd.include(req, res);
	}
	
		
//try
}
catch (Exception e) {
	
	e.printStackTrace();
}




}

}
