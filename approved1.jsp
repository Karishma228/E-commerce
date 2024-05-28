<%@ page import="Dbcon.dbcon" %>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.*"%>
<%


String name=request.getParameter("id");



String status="qa";
try{
	Connection con=dbcon.create();
	Statement st=con.createStatement();
	st.executeUpdate("UPDATE `onpur`.`addveg` set statu='"+status+"' where id='"+name+"' ");
	response.sendRedirect("productview.jsp?valid");
}
catch(Exception e){
	response.sendRedirect("error.jsp?inval id");
System.out.println(e);
}
%>