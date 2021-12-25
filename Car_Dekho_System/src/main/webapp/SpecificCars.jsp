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
<title>Cars By Brand</title>
<link rel="stylesheet" href="style/SpecificCars.css">
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
PreparedStatement ps=null;
ResultSet res=null;
int count=0,n=1;
String Brand=null;



Brand=request.getParameter("brand");

	
	
	//printing Data
	out.println("<div class='MainDiv'>");
	ps=con.prepareStatement(" select * from(select rownum as rn,id,brand,model,img1 from cars_info)where Brand=?");
	ps.setString(1, Brand);
	res=ps.executeQuery();

	while(res.next()){
		
		if(n%2!=0){
			out.println("<div class='LeftDiv'>");
			out.println("<img class='LeftImg' src='"+res.getString("IMG1")+"'/>");
			out.println("<br><br><a href='Details.jsp?Id="+res.getString("ID")+"' class='LeftName'>"+res.getString("BRAND")+"-"+res.getString("MODEL")+"</a>");
			out.println("</div>");
		    n++;
		//if
		}
		else{
			out.println("<div class='RightDiv'>");
	    out.println("<img class='RightImg' src='"+res.getString("IMG1")+"'/>");
		out.println("<br><br><a href='Details.jsp?Id="+res.getString("ID")+"' class='RightName'>"+res.getString("BRAND")+"-"+res.getString("MODEL")+"</a>");

	    out.println("</div>");
		n++;
		
	//else
		}
		if(n>10)
		break;
		
//while
		}
		
	




%>

</body>
</html>