<%@page import="org.omg.CORBA.Request"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.sr.dao.JdbcCon"%>
<%@page import="java.sql.PreparedStatement"%>
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
<title>Compare Car</title>
<link rel="stylesheet" href="style/Selector.css">
</head>
<body >
                                                    <!-- Header -->
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
                                                          <!-- Printing Title -->
<div class="Title">
<label class="Compare"> Select Car For Comparison</label>
</div>
<%
Connection con=JdbcCon.getConnection();
PreparedStatement ps=null;
ResultSet res=null;
int count=0,n=1,pageNo=0,id1=0;

id1=Integer.parseInt(request.getParameter("Id"));
//Finding No Of Records from Database
ps=con.prepareStatement("select count(*) from cars_info where ID!=?");
ps.setInt(1, id1);
res=ps.executeQuery();
while(res.next()){
	count=res.getInt(1);
}

pageNo=Integer.parseInt(request.getParameter("Page"));

//Printing pages of site

	int recNo=0;
	//finding id of printable records
	recNo=(pageNo-1)*10+1;
	
	
	//printing Data
	out.println("<div class='MainDiv'>");
	ps=con.prepareStatement(" select * from(select rownum as rn,id,brand,model,img1 from cars_info)where rn>=? And rn<"+(recNo+10)+" And id!=?");
	ps.setInt(1, recNo);
	ps.setInt(2, id1);
	res=ps.executeQuery();

	while(res.next()){
		
		if(n%2!=0){
			out.println("<div class='LeftDiv'>");
			out.println("<img class='LeftImg' src='"+res.getString("IMG1")+"'/>");
			out.println("<br><br><a href='Comparison.jsp?Id2="+res.getString("ID")+"&Id1="+id1+"' class='LeftLink'>"+res.getString("BRAND")+"-"+res.getString("MODEL")+"</a>");
			out.println("</div>");
		    n++;
		//if
		}
		else{
			out.println("<div class='RightDiv'>");
	    out.println("<img class='RightImg' src='"+res.getString("IMG1")+"'/>");
		out.println("<br><br><a href='Comparison.jsp?Id2="+res.getString("ID")+"&Id1="+id1+"' style='margin:0px 0px 0px 260px;color:White;font-size:20px;'>"+res.getString("BRAND")+"-"+res.getString("MODEL")+"</a>");

	    out.println("</div>");
		n++;
		
	//else
		}
		if(n>10)
		break;
		
//while
		}
		
//printing page window

			
		int lastPage=count/10;
		if(count%10!=0)
			lastPage++;
		
		//printing Page info
		out.println("<div class='PageDiv'><br>");
			out.println("<Label class='Page'>Page</label>");
		for(int i=1;i<=lastPage;i++){
			if(pageNo==i)
			out.println("<a style='margin-left:7px;border-color:Black;background-color:white;color:lime;padding:1.5px 3px 1.5px 3px;font-weight:bold;' href='#'>"+pageNo+"</a>");
			else
		    out.println("<a style='margin-left:7px;border-color:Black;background-color:white;color:Black;padding:1.5px 3px;font-weight:bold;' href='Selector.jsp?Id="+id1+"&Page="+i+"'>"+i+"</a>");
	//for
		}
		
%>
</body>
</html>