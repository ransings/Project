<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.sr.dao.JdbcCon"%>
<%@page import="java.sql.Connection"%>
<%if(session.getAttribute("Mode")==null){
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
<title>User Home</title>
<link rel="stylesheet" href="style/UserConsole.css">
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
<label id="Label1">User Console</label><br>

<%
Connection con=JdbcCon.getConnection();
PreparedStatement ps=con.prepareStatement("SELECT * FROM USERS WHERE ID=?");
Object ob=session.getAttribute("Id");
int Aid=Integer.parseInt(ob.toString());
ps.setInt(1, Aid);

ResultSet rs=ps.executeQuery();
rs.next();
%>

<label class="Label1">Name:</label>
<label class="Label2"><%= rs.getString("LNAME")+" "+rs.getString("FNAME")+" "+rs.getString("MNAME") %></label><br>

<label class="Label1">Age:</label>
<label class="Label2"><%= rs.getString("AGE") %></label><br>

<label class="Label1">Gender:</label>
<label class="Label2"><%= rs.getString("GENDER") %></label><br>

<label class="Label1">E-Mail:</label>
<label class="Label2"><%= rs.getString("MAIL") %></label><br>

<label class="Label1">Phone No:</label>
<label class="Label2"><%= rs.getString("CONTACT") %></label>

</div>



</body>
</html>