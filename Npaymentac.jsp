<%@ page import="Dbcon.dbcon" %>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.*"%>
<%
String orderid=request.getParameter("pid");
String cname=request.getParameter("amt");
String ptype=request.getParameter("ptype");
String Status="Payed";
try{
	Connection con=dbcon.create();
	Statement st=con.createStatement();
	st.executeUpdate("UPDATE onpur.cart set paytype='"+ptype+"',status='"+Status+"' where  status='sold'  and orderid='"+orderid+"' ");
	
	response.sendRedirect("receivedorder.jsp?valid");
}
catch(Exception e){
	response.sendRedirect("error.jsp?inval id");
System.out.println(e);
}
%>