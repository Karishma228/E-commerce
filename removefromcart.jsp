<%@ page import="Dbcon.dbcon" %>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.*"%>
<%
String user=session.getAttribute("cemail").toString();

String id=request.getParameter("id");





try{
	Connection con=dbcon.create();
	Statement st=con.createStatement();
	st.executeUpdate("delete  from  onpur.cart where cemail='"+user+"' and cartid='"+id+"' ");
	response.sendRedirect("mycart.jsp?valid");
}
catch(Exception e){
	response.sendRedirect("error.jsp?inval id");
System.out.println(e);
}
%>