<!DOCTYPE html>

<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.sr.dao.JdbcCon"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete User</title>
<link rel="stylesheet" href="style/Report.css">
</head>
<%
if(session.getAttribute("Mode")==null){
	 RequestDispatcher rd=request.getRequestDispatcher("login1.html"); 
	   	rd.forward(request, response);
}else
if(!session.getAttribute("Mode").toString().equals("Admin") )
{
	
RequestDispatcher rd=request.getRequestDispatcher("login1.html"); 
  	rd.forward(request, response);
}

%>

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
<form action="AdminController" method="post">
<p class="form">

<button name="Operation" type="submit" value="ChangePassword">Change Password</button>
<br>

<button name="Operation" type="submit" value="AddCar">Add Car</button>
<br>

<button name="Operation" type="submit" value="RemoveCar">Remove Car</button>
<br>

<button name="Operation" type="submit" value="UpdateCar">Update Car</button>
<br>

<button name="Operation" type="submit" value="ViewCar">View Car</button>
<br>

<button name="Operation" type="submit" value="ViewFeedback">View Feedback</button>
<br>

<button name="Operation" type="submit" value="DeleteUser">Remove User</button>
<br>

<button name="Operation" type="submit" value="Report">Total Cars</button>
<br>
</p>
</form>
</div>

																				<!-- Delete User -->
																				
<div class="Delete">
<label id="Title">Cars Report</label>
<%

Connection con=JdbcCon.getConnection();   
int total=0;
//Finding Count
PreparedStatement ps=con.prepareStatement("SELECT DISTINCT BRAND FROM CARS_INFO");
ResultSet res=ps.executeQuery();
PreparedStatement ps1=null;		
ResultSet res1=null;
%>
<table class='Table'>
<tr>
<th>Brand</th>
<th>Total Cars</th>
</tr>

<%



	while(res.next()){
		ps1=con.prepareStatement("SELECT COUNT(*) AS CARS FROM CARS_INFO WHERE BRAND='"+res.getString("Brand")+"'");
		res1=ps1.executeQuery();
		res1.next();
		out.print("<tr>");
		out.print("<td>"+res.getString("Brand")+"</td>");
		out.print("<td>"+res1.getString("CARS")+"</td");
		out.print("</tr>");
		total=1;
	}
if(total==0)
	out.println("<tr> <td colspan='3'>No Record Found </td></tr>");

%>

</table>
</div>
																				

</body>
</html>