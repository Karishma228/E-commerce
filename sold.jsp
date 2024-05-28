<%@ page import="Dbcon.dbcon" %>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.*"%>
<%


String quantity=request.getParameter("qaunty");
String email=request.getParameter("email");
String cid=request.getParameter("cartid");
String pid=request.getParameter("pid");


String status="sold";

try{
	Connection con=dbcon.create();
	PreparedStatement ps=con.prepareStatement("UPDATE onpur.cart set status=? where  cartid=? ");
	ps.setString(1, status);
	ps.setString(2, cid);
	

	ps.executeUpdate();

	PreparedStatement ps2=con.prepareStatement("UPDATE onpur.addveg set tquan=tquan-? where email=? and id=?");
    ps2.setString(1,quantity);
    ps2.setString(2,email);
    ps2.setString(3,pid);

   
    ps2.executeUpdate();
    response.sendRedirect("sellermain.jsp");
}
catch(Exception e){
System.out.println(e);	
}


%>