<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import=" Dbcon.dbcon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css1/bootstrap.min.css">
</head>
<style>
body{
background-color:	#A9A9A9;
}

table, td, th {
  border: 1px solid #972121;
}
th{
color: #482929;
}

table {
  border-collapse: dotted;
  width: 95%;
  margin-rigth: 70px;
}

td{
  text-align: center;
  padding-top: 1.0em;
    padding-bottom: 1.0em;
}

th{
border: 3px solid white;
}

</style>
<div class="mydiv">
<button class="btn btn-danger" onclick="history.back()" Style="float:right;">Back</button>
</div><br><br>

<body>
<%String email=session.getAttribute("semail").toString();%>
<center>
  <div class="container-fluid">  
<table class="table">
 <thead>
    <tr>
      <th scope="col">PRODUCT NAME</th>

     
      <th scope="col">PRODUCT PRICE</th>
        <th scope="col">ORDER QUANTITY</th>
           <th scope="col">TOTAL</th>
           <th scope="col">CUSTOMER</th>
      <th scope="col">STATUS</th>
       
     
    </tr>
  </thead>
 


	
       <%
       
       Connection con;
       
       
       con=dbcon.create();
       PreparedStatement ps=con.prepareStatement("SELECT * FROM `onpur`.`cart`  where semail='"+email+"' and status='Ordered' and Dtype='NO-DELIVERY'");
       
       ResultSet rs=ps.executeQuery();
       
       while(rs.next())
       {
    	  String emails=rs.getString(2);  
    	String cname=  rs.getString(1); 

       
       %>
	

	


     <tr>
     <td style="text-align: center;"><%=rs.getString(6)%></td>
      <td style="text-align: center;"><%= rs.getString(7) %></td>
       <td style="text-align: center;"><%=  rs.getString(4) %></td>
       <td style="text-align: center;"><%=  rs.getString(9) %></td>
       <td style="text-align: center;"><%=  rs.getString(11) %></td>


        <td><a href="sold.jsp?cartid=<%=rs.getString(1)%>&&email=<%=email%>&&qaunty=<%=rs.getString(4)%>&&pid=<%=rs.getString(2)%>"><button class="btn btn-primary">SOLD</button></a></td>
  
    
     </tr>
	<%}%>






</table>

</div>
</center>
</body>
</html>