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
<title>Status</title>
<link rel="stylesheet" href="style/Status.css">
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
<%
String status=request.getParameter("status");

	if(status.equalsIgnoreCase("Success"))
		out.println("<Label id='Label1'>Password Changed Successfully</label>");
	else 
		if(status.equalsIgnoreCase("otp"))
		out.println("<Label id='Label1'>Invalid Otp</Label>");
		else 
			if(status.equalsIgnoreCase("confirm"))
			out.println("<Label id='Label1'>Both New passwords Must Match </Label>");
			else 
				if(status.equalsIgnoreCase("current"))
				out.println("<Label id='Label1'>Invalid Password Try Again</Label>");
				else 
					if(status.equalsIgnoreCase("feedback"))
					out.println("<Label id='Label1'>Thank You For Your Feedback</Label>");

%>


</div>



</body>
</html>