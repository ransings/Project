<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.sr.dao.JdbcCon"%>
<%@page import="java.sql.Connection"%>
<%
if(session.getAttribute("Mode")==null )
{
	RequestDispatcher rd=request.getRequestDispatcher("login2.html"); 
	rd.forward(request, response);
	
}

%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Car Comparison</title>
<link rel="stylesheet" href="style/Comparison.css">
</head>
<body  >

                                                                    <!-- Header Section -->
<div class="Header">
<div class="Logo">
<br> <br>
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
																		<!-- Getting Initial information -->
																		
<%
int fId=0,sId=0;
Connection con=JdbcCon.getConnection();
PreparedStatement ps=null;
ResultSet res=null;

fId=Integer.parseInt(request.getParameter("Id1"));
sId=Integer.parseInt(request.getParameter("Id2"));
%>
																	
																	

																	<!-- Main Division -->

<div class="MainDiv">

<div class="FirstCar">
<%
ps=con.prepareStatement("SELECT * FROM CARS_INFO WHERE ID=?");
ps.setInt(1, fId);
res=ps.executeQuery();
res.next();
%>

<img src='<%=res.getString("IMG1") %>' class="FirstImg"/>
<br> <br>

<label style='margin-left:42%;'>Brand :</label>
<label style='margin-left: 5px;font-size: 25px;color: #80ff00;'> <%= res.getString("Brand") %>  </label>
<br>
<label style='margin-left:41.5%'>Model :</label>
<label style='margin-left: 5px;font-size: 25px;color: #80ff00;'> <%= res.getString("MODEL") %>  </label>
<br>
<label >Available Colors :</label><br>
<label style='margin-left: 5px;font-size: 25px;color: #80ff00;'> <%= res.getString("COLOR") %>  </label>
<br>
<label style='margin-left:43.5%;'>Price :</label>
<label style='margin-left: 5px;font-size: 25px;color: #80ff00;'>Rs. <%= res.getString("PRICE") %>  </label>
<br>
<label style='margin-left:29%;'>Arrival Type :</label>
<label style='margin-left: 5px;font-size: 25px;color: #80ff00;'> <%= res.getString("TYPE") %>  </label>

</div>

<div class="SecondCar" style='line-height: 80px;'>
<%
ps=con.prepareStatement("SELECT * FROM CARS_INFO WHERE ID=?");
ps.setInt(1, sId);
res=ps.executeQuery();
res.next();
%>

<img src='<%=res.getString("IMG1") %>' class="FirstImg"/>
<br> <br>

<label style='margin-left:42%;'>Brand :</label>
<label class='Label2'> <%= res.getString("Brand") %>  </label>
<br>
<label style='margin-left:41.5%'>Model :</label>
<label class='Label2'> <%= res.getString("MODEL") %>  </label>
<br>
<label >Available Colors :</label><br>
<label class='Label2';'> <%= res.getString("COLOR") %>  </label>
<br>
<label style='margin-left:43.5%;'>Price :</label>
<label class='Label2'>Rs. <%= res.getString("PRICE") %>  </label>
<br>
<label style='margin-left:29%;'>Arrival Type :</label>
<label class='Label2'> <%= res.getString("TYPE") %>  </label>
</div>
<br>
<a href="Main.jsp?Page=1" class="Link">View Cars</a>
</div>


</body>
</html>