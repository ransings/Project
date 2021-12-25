<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.sr.dao.JdbcCon"%>
<%@page import="java.sql.Connection"%>
<%
if(session.getAttribute("Mode")==null){
	 RequestDispatcher rd=request.getRequestDispatcher("login2.html"); 
	   	rd.forward(request, response);
}else
if(!session.getAttribute("Mode").toString().equals("User") )
{
	
 RequestDispatcher rd=request.getRequestDispatcher("login2.html"); 
   	rd.forward(request, response);
}
%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Feedback</title>
<link rel="stylesheet" href="style/Feedback.css">
</head>
<body>
																<!-- Header -->
<div class="Header">
<div class="Logo">
<br><br>
<label> Car Dekho System </label><br>
<label class="Desc">You Can Watch And Compare Cars Using Our Site</label>
</div>
<div class="HomeD">
<a class="Home" href="HomeServlet">Home</a>
</div>
<div class="LogOutD">
<a href="LogoutServlet1" class="LogOut">LogOut</a>
</div>
</div>

																		<!-- Menu -->

<div class="menu">
<form action="UserController" method="post">
<p class="form">

<button name="Operation" type="submit" value="ChangePassword">Change Password</button>
<br>

<button name="Operation" type="submit" value="ViewCar">View All Cars</button>
<br>

<button name="Operation" type="submit" value="Brands">Popular Brands</button>
<br>

<button name="Operation" type="submit" value="Upcoming">Upcoming Cars</button>
<br>

<button name="Operation" type="submit" value="Feedback">Feedback</button>
<br>
</p>
</form>
</div>

<div class="Body">
<label id="Label1">Feedback</label><br>

<%
Object ob=session.getAttribute("Id");
int Aid=Integer.parseInt(ob.toString());
int params=0;
Enumeration<String>  names=request.getParameterNames();
while(names.hasMoreElements()){
	params++;
	names.nextElement();
}
	

if(params==1){
	out.print("<form action='Feedback.jsp' method='post'>");
	out.print("<textarea name='fb'></textarea><br>");
	out.print("<input type='submit' value='Submit' id='submit'>");
	out.print("<input type='Hidden' name='param' value='2'/>");

}
else{
	String fb=request.getParameter("fb");
	Connection con=JdbcCon.getConnection();
	PreparedStatement ps=con.prepareStatement("Select USERID from feedback where userid=?");
	ps.setInt(1, Aid);
	ResultSet rs=ps.executeQuery();

	if(rs.next())
	{	
		ps=con.prepareStatement("Update FEEDBACK set FEEDBACK=? where USERID=?");
		ps.setString(1, fb);
		ps.setInt(2, Aid);
		ps.executeUpdate();
		
		RequestDispatcher rd=request.getRequestDispatcher("Status.jsp?status=feedback");
		rd.forward(request, response);
			}
	else{
		ps=con.prepareStatement("INSERT INTO FEEDBACK VALUES(?,?)");
		ps.setInt(1, Aid);
		ps.setString(2, fb);
		ps.executeQuery();
		
		RequestDispatcher rd=request.getRequestDispatcher("Status.jsp?status=feedback");
		rd.forward(request, response);
	}
}

%>



</div>



</body>
</html>