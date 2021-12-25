<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.sr.dao.JdbcCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forgot Password</title>
<link rel="stylesheet" href="style/ForgotPassword.css">
</head>
<body>
																<!-- Header -->
<div class="Header">
<div class="Logo">
<br><br>
<label> Car Dekho System </label><br>
<label class="Desc">You Can Watch And Compare Cars Using Our Site</label>
</div>

</div>


<div class="title">
<label id="title">Forgot Password</label>
</div>


<% 
int Page=1;
Page=Integer.parseInt(request.getParameter("Page"));
if(Page==1){
	out.print("<div class='main'>");
out.print("<form action='ForgotPassword.jsp' method='post'>");
out.print("<br><br><br><br><Label id='userid'>UserId:</Label>");
out.print("<input type='email' name='Mail' id='Mail'><br>");
out.print("<input type='hidden' name=Page value='2'>");
out.print("<input type='submit' value='Submit' id='submit'>");
out.print("</div>");
}
else
if(Page==2){
	String Mail=request.getParameter("Mail");
	int otp=(int)(10000*Math.random());
	System.out.print(otp);

	out.print("<div class='main'>");
	out.print("<form action='ForgotPassword.jsp' method='post'>");
	out.print("<br><br><Label id='otp'>OTP:</Label>");
	out.print("<input type='number' name='otp'><br>");
	
	out.print("<Label id='new'>New Password:</Label>");
	out.print("<input type='password' name='new'><br>");
	
	out.print("<Label id='new1'>Confirm Password:</Label>");
	out.print("<input type='password' name='new1'><br>");
	
	out.print("<input type='hidden' name='Page' value='3'>");
	out.print("<input type='hidden' name='Mail' value='"+Mail+"'>");
	out.print("<input type='hidden' name='Otp' value='"+otp+"'>");
	
	out.print("<input type='submit' value='Submit' id='submit'>");
	out.print("</div>");

}
else if(Page==3){
	String mail=request.getParameter("Mail");
	int otp=Integer.parseInt(request.getParameter("otp"));
	int otp1=Integer.parseInt(request.getParameter("otp"));
	String newp=request.getParameter("new");
	String newp1=request.getParameter("new1");
	String status=null;
	String link="login2.html",linkTitle="Login";
	
	if(!newp.equals(newp1))
	status="Both New Password Must Match";
	else if(otp!=otp1)
		status="Invalid OTP";
	else{
		Connection con=JdbcCon.getConnection();
		PreparedStatement ps=con.prepareStatement("Update users set Password=? where Mail=?");
		ps.setString(1, newp);
		ps.setString(2, mail);
		int fl=ps.executeUpdate();
		if(fl!=0)
		status="Password Changed Successfully";
		
		else{
			status="Failed To Update Password";
			link="ForgotPassword.jsp?Page=1";
			linkTitle="Try Again";
		}

	}
	
	out.print("<Label id='msg'>"+status+"</Label>");
	out.print("<br><a href='"+link+"' id='home'>"+linkTitle+"</a>");
	/*  RequestDispatcher rd=request.getRequestDispatcher("login2.html");
	rd.forward(request, response);  */
//end of else	
}


%>



</body>
</html>