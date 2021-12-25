
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
<link rel="stylesheet" href="style/adminconsole.css">
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

<label id="Label1">Admin Console</label><br>


<%
Connection con=JdbcCon.getConnection();
PreparedStatement ps=con.prepareStatement("SELECT * FROM ADMIN WHERE ID=?");
Object ob=session.getAttribute("Id");
int Aid=Integer.parseInt(ob.toString());
ps.setInt(1, Aid);

ResultSet rs=ps.executeQuery();
rs.next();
%>

<label class="Label1">Name:</label>
<label class="Label2"><%= rs.getString("NAME") %></label><br>

<label class="Label1">Age:</label>
<label class="Label2"><%= rs.getString("AGE") %></label><br>

<label class="Label1">Gender:</label>
<label class="Label2"><%= rs.getString("GENDER") %></label><br>

<label class="Label1">E-Mail:</label>
<label class="Label2"><%= rs.getString("EMAIL") %></label>
</div>


</body>
</html>