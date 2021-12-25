
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
<title>AdminConsole</title>
<link rel="stylesheet" href="style/AdminPassword.css">
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
<form action="PasswordChange" method="post">

<label id="Label1">Password Change</label><br>

<label class="Label1">Current Password:</label><input type="text" name='current' /> <br>

<label class="Label2">New Password:</label><input type="password" name="new"/> <br>

<label class="Label3">Confirm Password:</label><input type="password" name="new1"> <br>

<label class="Label4">Enter Otp:</label><input type="number" name="otp"> <br>


<%
int otp=(int)(10000*Math.random());
System.out.println("Otp is "+otp);
%>
<input type="hidden" name="otp1" value='<%=otp%>'>
<input type="hidden" name="mode" value="Admin">

<input type="submit" value="Change">

</form>



</div>


</body>
</html>