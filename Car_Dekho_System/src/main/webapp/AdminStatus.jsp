
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.sr.dao.JdbcCon"%>
<%@page import="java.sql.Connection"%>
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

<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Status</title>
<link rel="stylesheet" href="style/AdminStatus.css">
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

<div class="Body">


<%
String status=request.getParameter("status");


switch(status)
{
case "uploaded":
	out.println("<Label id='Label1'>Car Added Successfully</label>");
	break;
	
case "success":
	out.println("<Label id='Label1'>Password Changed Successfully</label>");
    break;
    
case "otp":
	out.println("<Label id='Label1'>Invalid Otp</Label>");
	break;
	
case "confirm":
	out.println("<Label id='Label1'>Both New passwords Must Match </Label>");
	break;
	
case "current":
	out.println("<Label id='Label1'>Invalid Password Try Again</Label>");
	break;
	
case "delete success":
	out.println("<Label id='Label1'>Car Deleted SuccessFully.</Label>");
	break;
	
case "invalid delete":
	out.println("<Label id='Label1'>Invalid Car Information</Label>");
	break;
	
case "success update":
	out.println("<Label id='Label1'>Car Updated Successfully</Label>");
	break;
	
case "feedback fail":
	out.println("<Label id='Label1'>Failed to Delete Feedback Try Again</Label>");
	break;
	
case "feedback success":
	out.println("<Label id='Label1'>Feedback Deleted Successfully</Label>");
	break;
	
default:
	out.println("<Label id='Label1'>Invalid selection</Label>");
	
}

%>

</div>


</body>
</html>