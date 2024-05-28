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
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" /> 
<link href="css1/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" /> 
<script src="text/javascript" src='js/jquery-3.6.0.min.js'></script>
<script src="text/javascript" src='js/bootstrap.min.js'></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/font-awesome.min1.css">
</head>
<style>
body{
background-color:#274c77;


}

table, td, th {
  border: 1px solid black;
}

table {
  border-collapse: collapse;
  width: 70%;
  margin-rigth: 70px;
}

td{
  text-align: center;
  padding-top: 1.0em;
    padding-bottom: 1.0em;
}

th{
border: 3px solid black;
}

</style>
<body>
<center>
  <div class="container-fluid">  

<br>
<br>
<br>
<br>
<br>


<table style="color:white">
 <thead>
    <tr>
      <th scope="col">COMPANY NAME</th>
      <th scope="col">EMAIL</th>
      <th scope="col">MOBILE NUMBER</th>
      
          
      
    </tr>
  </thead>
 


	
       <%
       
       Connection con;
       
       
       con=dbcon.create();
       PreparedStatement ps=con.prepareStatement("SELECT * FROM `onpur`.`cusreg` ");
       
       ResultSet rs=ps.executeQuery();
       
       while(rs.next())
       {
    	      	  
    	   
       %>
	

	

    
     <tr>
     <td style="text-align: center;"><%=rs.getString(2)%></td>
      <td style="text-align: center;"><%= rs.getString(3) %></td>
       <td style="text-align: center;"><%=  rs.getString(4) %></td>
     
     </tr>
	<%} %>






</table>

</div>
</center>
</body>
</html>