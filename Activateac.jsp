<%@ page import="Dbcon.dbcon" %>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.*"%>
<%



String email=request.getParameter("email");


String status="Activate";
try{
	Connection con=dbcon.create();
	Statement st=con.createStatement();
	st.executeUpdate("UPDATE `onpur`.`selreg` set status='"+status+"' where email='"+email+"' ");
	response.sendRedirect("adminhome.jsp?valid");
}
catch(Exception e){
	response.sendRedirect("error.jsp?inval id");
System.out.println(e);
}
%>