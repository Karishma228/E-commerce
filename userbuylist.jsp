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
<link rel="stylesheet" href="css1/bootstrap.min.css">
</head>
<% String email=session.getAttribute("client").toString(); %>
<body>
<center>
<a href="usermain.jsp"><button type="button" class="btn btn-primary">back</button></a><br>
</center>
<div class="container">
              <div class="table-responsive-sm">  
  <table class="table table-bordered">
  <thead>
<% 
String userid=session.getAttribute("client").toString();
int ftotal=0;
int sno=0;
%>
<% 
try{
	Connection con=dbcon.create();
	Statement st=con.createStatement();
	ResultSet rs1=st.executeQuery("SELECT sum(total) FROM onpur.cart where userid='"+userid+"' and status='Billing'");
	
	while(rs1.next())
	{
		ftotal=rs1.getInt(1);
		System.out.println(ftotal);
	}
}
catch(Exception e){
	
}
%>
<tr>
<th scope="col" Style="background-color:green;">Total: <%out.println(ftotal);   %></th>
 <%if(ftotal>0){	 %><%} %> 
</tr>
</thead>
    <thead class="bg-warning">
      <tr>
         
        <th>Food Name</th>
        <th>Quantity</th>
      <th>Price</th>
        
        
      </tr>
    </thead>
     <%
       
       Connection con;
       
       
       con=dbcon.create();
       PreparedStatement ps=con.prepareStatement("SELECT * FROM `onpur`.`cart` where userid='"+email+"' and status='Billing'");
       
       ResultSet rs=ps.executeQuery();
       
       while(rs.next())
       {
       
    	 
   
    	
    	String image=rs.getString(6);
    	  
    	   
       %>
    <tbody>
      <tr class="bg-info">
        <td><%=rs.getString(7)%></td>
        <td><%=rs.getString(4)%></td>
  <td><%=rs.getString(3)%></td>

      
     
        
        
      </tr>
    </tbody>
    	<%} %>
  </table>
</div>
</div>
</body>
</html>