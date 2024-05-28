<%@ page import="Dbcon.dbcon" %>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.*"%>
<%@page import="java.io.FileInputStream" %>
    <%@page import="java.io.IOException" %>
    <%@page import="java.io.PrintWriter" %>
    <%@page import="javax.swing.JDialog" %>
    <%@page import="javax.swing.JOptionPane" %>
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement" %>
<%@ page import="Dbcon.dbcon" %>
<%@ page import="java.sql.*"%>























<%
String type=request.getParameter("ptype");

if(type.equals("Cash On Delivery")){
	
	
	
	
	
	

	String cartid=request.getParameter("cartid"); 
session.setAttribute("carttid", cartid);
	
	String cname=request.getParameter("amt");
	String ptype=request.getParameter("ptype");
	String Status="Payed";
	try{
		Connection connn=dbcon.create();
		Statement st=connn.createStatement();
		st.executeUpdate("UPDATE onpur.cart set ptype='"+ptype+"',status='"+Status+"' where  status='Ordered' and cartid='"+cartid+"'  ");
		
		response.sendRedirect("creceivedorder.jsp?valid");
	}
	catch(Exception e){
		response.sendRedirect("error.jsp?inval id");
	System.out.println(e);
	}
}

else
{
System.out.println("failed");
	
	/* JOptionPane.showMessageDialog(null, "Sorry Your key is wrong"); */
	
	response.sendRedirect("paymentcreate.jsp?");
}		



%>











<%-- <% String status="Downloaded"; 
String id=request.getParameter("id");
/* String key1=request.getParameter("t6"); */
%>

<%
String key1=request.getParameter("t6");

%>

<form onload="">
<input type="hidden" value="<%=key1%>" onload="myFunction(this.value)">
</form>






<%
System.out.println("download0000000000000000000===="+key1);  

String key2=request.getParameter("headkey");

System.out.println("download0000000000000000000===="+key2);  
JOptionPane joptionpane =new JOptionPane("CLICK OK");


JDialog jdialog= joptionpane.createDialog("Alert");

jdialog.setAlwaysOnTop(true);

jdialog.show();

String newkey =JOptionPane.showInputDialog("Enter Your filekey");

Connection con;
con=dbcon.create();
if(newkey.equals(key1))

{
	
	String orderid=request.getParameter("pid");
	String cname=request.getParameter("amt");
	String ptype=request.getParameter("ptype");
	String Status="Payed";
	try{
		Connection conn=dbcon.create();
		Statement st=con.createStatement();
		st.executeUpdate("UPDATE onpur.cart set ptype='"+ptype+"',status='"+Status+"' where  status='sold'  and orderid='"+orderid+"' ");
		
		response.sendRedirect("receivedorder.jsp?valid");
	}
	catch(Exception e){
		response.sendRedirect("error.jsp?inval id");
	System.out.println(e);
	}
}

else
{
System.out.println("failed");
	
	JOptionPane.showMessageDialog(null, "Sorry Your key is wrong");
	
	response.sendRedirect("Error.jsp");
}		


%>

<script>

function myFunction(data) {

var size = 248;
if(data == "") {
	console.log("out")
    $("#alert").append("<p style='color:#fff;font-size:20px'>Please Enter A Url Or Text</p>"); // If Input Is Blank
    return false;
} else {
    if( $("#image").is(':empty')) {
		console.log("in")
	  //QR Code Image
      $("#image").append("<img src='http://chart.apis.google.com/chart?cht=qr&chl=" + data + "&chs=" + size + "' alt='qr' />");
	  
	  //This Provide An Image Download Link
      $("#link").append("<a style='color:#fff;' href='http://chart.apis.google.com/chart?cht=qr&chl=" + data + "&chs=" + size + "'>Download QR Code</a>");
	  
	  //This Provide the Image Link Path In Text
     // $("#code").append("<p style='color:#fff;'><strong>Image Link:</strong> http://chart.apis.google.com/chart?cht=qr&chl=" + data + "&chs=" + size + "</p>");
      return true;
	} else {
		console.log("else out")
      $("#image").html("");
      $("#link").html("");
      $("#code").html("");
	  
      //QR Code Image
      $("#image").append("<img src='http://chart.apis.google.com/chart?cht=qr&chl=" + data + "&chs=" + size + "' alt='qr' />");
	  
	  //This Provide An Image Download Link
      $("#link").append("<a style='color:#fff;' href='http://chart.apis.google.com/chart?cht=qr&chl=" + data + "&chs=" + size + "'>Download QR Code</a>");
	  
	  //This Provide the Image Link Path In Text
      $("#code").append("<p style='color:#fff;'><strong>Image Link:</strong> http://chart.apis.google.com/chart?cht=qr&chl=" + data + "&chs=" + size + "</p>");
      return false;
    }
  }
}
</script> --%>









<%-- <%

String orderid=request.getParameter("pid");
String cname=request.getParameter("amt");
String ptype=request.getParameter("ptype");
String Status="Payed";
try{
	Connection con=dbcon.create();
	Statement st=con.createStatement();
	st.executeUpdate("UPDATE onpur.cart set ptype='"+ptype+"',status='"+Status+"' where  status='sold'  and orderid='"+orderid+"' ");
	
	response.sendRedirect("receivedorder.jsp?valid");
}
catch(Exception e){
	response.sendRedirect("error.jsp?inval id");
System.out.println(e);
}
%> --%>