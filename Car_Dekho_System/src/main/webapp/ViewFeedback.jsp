<!DOCTYPE html>


<%@page import="java.sql.ResultSet"%>
<%@page import="com.sr.dao.JdbcCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Feedbacks</title>
<link rel="stylesheet" href="style/ViewFeedback.css">
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
<label id="Title">View Feedbacks</label>
<%
int Page=Integer.parseInt(request.getParameter("Page"));
if(Page==1){
Connection con=JdbcCon.getConnection();                                                                                 //Finding Count
PreparedStatement ps=con.prepareStatement("SELECT COUNT(*) AS TOTAL FROM FEEDBACK");
PreparedStatement ps1=null;
ResultSet res1=null;
ResultSet res=ps.executeQuery();
res.next();
int total=res.getInt("TOTAL");
													 							   /* Fetching Records */						

ps=con.prepareStatement("SELECT USERID,FEEDBACK FROM FEEDBACK");
res=ps.executeQuery();


out.print("<table class='Table'>");
out.print("<tr><th>UserId</th>");
out.print("<th>Name Of User</th> <th>Action</th></tr>");

if(total==0)
	out.println("<tr> <td colspan='3'>No Record Found </td></tr>");
else{
	while(res.next()){
		ps1=con.prepareStatement("SELECT FNAME,MNAME,LNAME FROM USERS WHERE ID=?");
		ps1.setInt(1, res.getInt("USERID"));
		res1=ps1.executeQuery();
		res1.next();
		out.print("<tr>");
		out.print("<td>"+res.getString("USERID")+"</td>");
		out.print("<td>"+res1.getString("LNAME")+" "+res1.getString("FNAME")+" "+res1.getString("MNAME")+"</td>");
		out.print("</td><td> <a href='ViewFeedback.jsp?Page=2&Id="+res.getInt("USERID")+"' id='link'>View</a> </td>");
		out.print("</tr>");
	}
	//end of else
}
//end of page 1
}

else if(Page==2){
	int Id=Integer.parseInt(request.getParameter("Id"));
	
	Connection con=JdbcCon.getConnection();
	PreparedStatement ps=con.prepareStatement("SELECT FEEDBACK FROM FEEDBACK WHERE USERID=?");
	ps.setInt(1, Id);
	ResultSet res=ps.executeQuery();
	res.next();
	
	out.print("<p id='feedback'>"+res.getString("Feedback")+"</p>");
	out.print("<a href='DeleteFeedback?Id="+ Id +"' id='delete'>Delete</a>");
	
	
	}
%>

</table>
</div>
																				

</body>
</html>