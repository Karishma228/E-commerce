<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Dbcon.dbcon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.FileInputStream" %>
<%@page import="java.io.IOException" %>
<%@page import="java.io.PrintWriter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<style>
.mydiv{
font-size:20px;
text-decoration:none;
float:right;
}
</style>
<div class="mydiv">
<a href="sellermain.jsp"><button class="btn btn-danger">Go back</button></a>
</div><br><br><br>
<body>
<% String location=session.getAttribute("loccus").toString();
String id=request.getParameter("name").toString();%>

<div class="container">
<div class="row">


  

   
	
       <%
       
       Connection con;
       
       
       con=dbcon.create();
       PreparedStatement ps=con.prepareStatement("SELECT * FROM `onpur`.`addveg` where location='"+location+"' and vid='"+id+"'");
     
       ResultSet rs=ps.executeQuery();
       
       while(rs.next())
       {
    
    	 
   
    	
    	String image=rs.getString(10);
    	  
    	   
       %>
<div class="col-md-4">
<div class="card">
	

	  <div class="card-body">
	 
	  <p class="card-text"><img class="card-img-top" src="product/<%=image%>" width="40" height="150" alt="Card image cap"></p>
	  <p class="card-text">Date :<%=rs.getString(2)%></p>    
   <p class="card-text"> product Type: <%=rs.getString(5)%></p>
    <p class="card-text">product Name:<%=rs.getString(6)%></p>
    <p class="card-text">Quantity:<%=rs.getString(7)%></p>
    
    <p class="card-text">Price per KG :<%=rs.getString(8)%></p>
       

     
     
    
      </div>
      </div>
      </div>

	<%} %>
	</div>
 </div>
</body>
</html>