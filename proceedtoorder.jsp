 <%@ page import="Dbcon.dbcon" %>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.*"%>
 <%@ page import="java.util.UUID"%> 
<%String id=request.getParameter("id");
String userid=request.getParameter("user");
String order=request.getParameter("uid");

String status="Ordered"; %>
<%UUID uuid=UUID.randomUUID(); %>
<%
try{
	Connection con=dbcon.create();
	Statement st=con.createStatement();
	st.executeUpdate("UPDATE onpur.cart set status='"+status+"',orderid='"+order+"' where cemail='"+userid+"' and status='Add To Cart' ");
	response.sendRedirect("customerhome.jsp?valid");
}
catch(Exception e){
	response.sendRedirect("error.jsp?inval id");
System.out.println(e);
}
%>

