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
p{
Color:red;
text-align:center;}
</Style>
<button type="button" class="btn btn-primary" onclick="history.back()" style="float:right;">back</button>
 <%String mail=session.getAttribute("semail").toString(); %>
<body>
<div class="container">
             <p>View Page </p>
  <table class="table table-dark table-hover">
    <thead>
      <tr>
        <th>Quantity</th>
        <th> Cat</th>
        <th>Item name</th>
         <th>Total</th>
        <th>Customer </th>
             <th>Request</th>

       
      </tr>
    </thead>
     <%
       
       Connection con;
       
       
       con=dbcon.create();
       PreparedStatement ps=con.prepareStatement("SELECT * FROM `onpur`.`cart` where status='Payed' and semail='"+mail+"' and Dtype='DELIVERY'");
       
       ResultSet rs=ps.executeQuery();
       
       while(rs.next())
       {
    
    	 
   
    	
    	
    	  
    	   
       %>
    <tbody>
      <tr>
        <td><%=rs.getString(4)%></td>
        <td><%=rs.getString(5)%></td>
        <td><%=rs.getString(6)%></td>
    
        <td><%=rs.getString(11)%></td>
         <td><%=rs.getString(9)%></td>
       
        	 
        <td><a href="solds.jsp?cartid=<%=rs.getString(1) %>&&qaunty=<%=rs.getString(4) %>&&email=<%=mail%>&&pid=<%=rs.getString(2) %>"><button class="btn btn-primary" onclick="myFunction()" >DELIVERY</button></a>
      </tr>
    </tbody>
    	<%} %>
  </table>
</div>
</body>
<script>
function myFunction() {
  alert("Successfully Delivered");
}
</script>
</html>