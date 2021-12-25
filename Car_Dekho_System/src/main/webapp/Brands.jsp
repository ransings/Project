<%@page import="java.util.Enumeration"%>
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
<title>Brands</title>
<link rel="stylesheet" href="style/Brands.css">
</head>
<body >


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


<%
Connection con=JdbcCon.getConnection();
PreparedStatement ps=null,ps1=null;
ResultSet res=null,res1=null;
int count=0,n=1;


//Finding No Of Records from Database
ps=con.prepareStatement("select count(*) from brands");
res=ps.executeQuery();
while(res.next()){
	count=res.getInt(1);
}


//Printing pages of site

	
	
	//printing Data
	out.println("<div>");
	ps=con.prepareStatement(" select distinct brand from cars_info");
	res=ps.executeQuery();

	while(res.next()){
		
		ps1=con.prepareStatement("Select * from Brands where Name='"+res.getString("Brand")+"'");
		res1=ps1.executeQuery();
		if(res1.next()){
		
		if(n%2==0){
			out.println("<div class='second'>");
			out.println("<img  src='"+res1.getString("IMG")+"'></img>");
			out.println("<br><br><a href='SpecificCars.jsp?brand="+res1.getString("Name")+"&Page=1' id='Name'>"+res1.getString("Name")+"</a>");
			out.println("</div>");
		    n++;
		//if
		}
		else
		if(n%3==0){
			out.println("<div class='third'>");
			out.println("<img  src='"+res1.getString("IMG")+"'></img>");
			out.println("<br><br><a href='SpecificCars.jsp?brand="+res1.getString("Name")+"&Page=1' id='Name'>"+res1.getString("Name")+"</a>");
			out.println("</div>");
		    n++;
		
	//else
		}
		else{
			out.println("<div class='first'>");
			out.println("<img  src='"+res1.getString("IMG")+"'></img>");
			out.println("<br><br><a href='SpecificCars.jsp?brand="+res1.getString("Name")+"&Page=1' id='Name'>"+res1.getString("Name")+"</a>");
			out.println("</div>");
		    n++;
			
		}
		out.print("</div>");
		if(n==4)
		n=1;
		//end if
		}
//while
		}
		


%>

</body>
</html>