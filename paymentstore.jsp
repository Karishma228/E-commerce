 <%@ page import="Dbcon.dbcon" %>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.*"%>
 <%@ page import="java.util.UUID"%> 
<%







String s=session.getAttribute("carttid").toString();
String id=request.getParameter("cartid");
String number=request.getParameter("number");
String expirymonth=request.getParameter("expirymonth");
String expiryyear=request.getParameter("expiryyear");
String cvv=request.getParameter("cvv");
String generate=request.getParameter("generate");
String otp=request.getParameter("otp");


String status="Payed"; 


if(generate.equals(otp)){

try{
	Connection con=dbcon.create();
	Statement st=con.createStatement();
	st.executeUpdate("UPDATE onpur.cart set status='"+status+"', ptype='Net banking', cardnumber='"+number+"', expirydate='"+expirymonth+"', expiryyear='"+expiryyear+"', cvv='"+cvv+"' where cartid='"+s+"' ");
	response.sendRedirect("deliveryhome.jsp?valid");

}catch(Exception e){
		response.sendRedirect("error.jsp?inval id");
	System.out.println(e);
	}
}




else
{
System.out.println("failed");
	
	/* JOptionPane.showMessageDialog(null, "Sorry Your key is wrong"); */
	
	response.sendRedirect("error.jsp?");
}		

%>

