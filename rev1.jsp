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
<Style>
body{
background-color: #2f3e46;


}



p{
Color:red;
text-align:center;}
</Style>
<button type="button" class="btn btn-primary" onclick="history.back()" style="float:right;">back</button>
 <%String mail=session.getAttribute("cemail").toString(); %>
<body>
<div class="container">
             <p>View Page </p>
  <table class="table table-dark table-hover">
    <thead>
      <tr>
        <th>Product name</th>
        <th> Price</th>
        <th>Seller</th>
        
             <th>Feedback</th>

       
      </tr>
    </thead>
     <%
       
       Connection con;
       
       
       con=dbcon.create();
       PreparedStatement ps=con.prepareStatement("SELECT * FROM `onpur`.`cart` where status='sold' and cemail='"+mail+"' and Dtype='DELIVERY'");
       
       ResultSet rs=ps.executeQuery();
       
       while(rs.next())
       {
    
    	 
   
    	
    	
    	  
    	   
       %>
    <tbody>
      <tr>
        <td><%=rs.getString(6)%></td>
        <td><%=rs.getString(7)%></td>
        <td><%=rs.getString(3)%></td>
    
       
       
        	 
        <td><a href="rev.jsp?pid=<%=rs.getString(12) %>&&amt=<%=rs.getString(11) %>&&cartid=<%=rs.getString(1)%>"><button class="btn btn-primary">Feedback</button></a>
      </tr>
    </tbody>
    	<%} %>
  </table>
</div>
</body>

</html>