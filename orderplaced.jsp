<%@ page import="Dbcon.dbcon" %>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.UUID"%> 

<%
String pid=request.getParameter("pid");
String id=request.getParameter("userid");
String qty=request.getParameter("qty");
String uid=request.getParameter("orderid");
String pdate=request.getParameter("pdate");
String status="Billing";



try{
	Connection con=dbcon.create();
	PreparedStatement ps=con.prepareStatement("UPDATE onpur.cart set status=?,deliverydate=DATE_ADD(orderDate, INTERVAL 4 day) where  orderid=? ");
	ps.setString(1, status);
	ps.setString(2, uid);
	

	ps.executeUpdate();

	PreparedStatement ps2=con.prepareStatement("UPDATE onpur.productdetails set quantity=quantity-? where pdate=?");
    ps2.setString(1,qty);
    ps2.setString(2,pdate);
        
   
    ps2.executeUpdate();
    response.sendRedirect("bill.jsp");
}
catch(Exception e){
System.out.println(e);	
}

%>