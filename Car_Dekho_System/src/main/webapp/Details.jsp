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
<link rel="stylesheet" href="style/Details.css">
<title>Car Detail</title>
</head>
<body>
  
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
                                                 <!-- Getting Initial Info -->
   <%
   int id=Integer.parseInt(request.getParameter("Id"));
   Connection con=JdbcCon.getConnection();
   PreparedStatement ps=con.prepareStatement("SELECT * FROM CARS_INFO WHERE ID=?");
   ResultSet res=null;
   
   ps.setInt(1, id);
   res=ps.executeQuery();   
   res.next();
   %>
                                                                     <!-- Content -->
<div class="Main">

<div id="Name">
<br><br>
 <label class="Name">
 <%
 out.print(res.getString("BRAND")+" "+res.getString("MODEL"));
 %>
 </label>          
 </div>
                                                       <!-- Displaying First Image -->
<div class="First">
<%
out.println("<img style='width:100%;height:100%;' src='"+res.getString("IMG1")+"'>");
%>
</div>
                                                                  <!-- Displaying Second Image -->
<div class="Second">
<%
out.println("<img style='width:100%;height:100%;' src='"+res.getString("IMG2")+"'>");
%>
</div>
                                                                  <!-- Displaying Third Image -->
<div class="Third">
<%
out.println("<img style='width:100%;height:100%;' src='"+res.getString("IMG3")+"'>");
%>
</div>

<fieldset>
<legend>More Information</legend>

<br><br><label class="Man">Manufacturer:</label>
 <label class="label2"><%= res.getString("Brand") %></label>
<br><label class="Mod">Model:</label>
  <label class="label2"><%= res.getString("Model") %></label>
<br> <label class="Col">Available Colors:</label>
 <label class="label2"><%= res.getString("COLOR") %></label>
 <br> <label class="Pri">Price:</label>
  <label class="label2">Rs. <%= res.getString("PRICE") %></label>
<br> <label class="Arr">Arrival Type:</label>
  <label class="label2"><%= res.getString("TYPE") %> </label>

</fieldset>
<p>
<%
out.print("<a href='Selector.jsp?Id="+res.getString("ID")+"&Page=1' class='Compare'>Compare</a>");
%>
</p>
</div>

</form>

</body>
</html>