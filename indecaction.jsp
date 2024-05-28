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
</head>
<% String userid=session.getAttribute("cemail").toString();
String id=request.getParameter("id");
String indec=request.getParameter("quantity");
int price=0;
int total=0;
int quantity=0;
int final_total=0; 
try{
	
	Connection con=dbcon.create();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from onpur.cart where cemail='"+userid+"' and cartid='"+id+"'");
	while(rs.next()){
		price=rs.getInt(7);
		total=rs.getInt(11);
		quantity=rs.getInt(4);
		
	}
	if(quantity==1 && indec.equals("dec"))
	response.sendRedirect("mycart.jsp");
	else if(quantity !=1 && indec.equals("dec")){
		total=total-price;
		quantity=quantity-1;
		st.executeUpdate("update onpur.cart set total='"+total+"', quantity='"+quantity+"' where cemail='"+userid+"' and cartid='"+id+"'");
		response.sendRedirect("mycart.jsp");
	}
	else{
		total=total+price;
		quantity=quantity+1;
		st.executeUpdate("update onpur.cart set total='"+total+"', quantity='"+quantity+"' where cemail='"+userid+"' and cartid='"+id+"'");
		response.sendRedirect("mycart.jsp");
	}
}
catch(Exception e){
	System.out.println(e);
}
%>
<body>

</body>
</html>