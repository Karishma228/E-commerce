<%@ page import="Dbcon.dbcon" %>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.*"%>
<%
String rat=request.getParameter("rat");
System.out.println("name"+rat);

String email=request.getParameter("email");
System.out.println("email"+email);

String exp=request.getParameter("exp");
System.out.println("Description"+exp);



try{
	Connection con=dbcon.create();
	PreparedStatement ps=con.prepareStatement("INSERT INTO `onpur`.`feed` VALUES(?,?,?)");
	ps.setString(1, email);
	ps.setString(2, rat);
	ps.setString(3, exp);
	
	ps.executeUpdate();
	response.sendRedirect("customerhome.jsp?msg=vaild");
}
catch(Exception e)
{
	System.out.print(e);
	response.sendRedirect("signup.jsp?msg=invaild");
}
%>