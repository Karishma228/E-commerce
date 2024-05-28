<%@ page import="Dbcon.dbcon" %>
    <%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Bill</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<style>
body{ 
background: linear-gradient(linear-gradient(to right, #ffc107 0%, #7955481f 100%));}
table,td,th {
  border: 2px solid black;
  
}
table {
  border-collapse: collapse;
  width: 90%;
}

td {
  text-align: center;
 height: 40px;
}
th{
 height: 30px;
 color: #2191c7f0;
}
.mydiv{
text-decoration:none;
float:right;
font-size:40px;

}
</style>
</head>
<button type="button" class="btn btn-primary" onclick="history.back()" style="float:right"> Back</button>
<% String email=session.getAttribute("semail").toString(); %>
<body>
<%



try{
	int total=0;
	int sno=0;
	Connection con=dbcon.create();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("SELECT sum(total) FROM onpur.cart where  status='Payed' and semail='"+email+"'");
	while(rs.next()){
		total=rs.getInt(1);
	}
	ResultSet rs2=st.executeQuery("SELECT * FROM onpur.cart where status='Payed'");
	while(rs2.next()){
		
	

%>
<div class="mydiv">
</div>
<br>



<%-- <div class="left-div"><h3>Card Type: <%=rs2.getString(11) %> </h3></div> --%>


<%break; } %>


<br>


<table id="customers">
<h3> Order Details</h3>
<tr>
<th>S.no</th>
<th>Food Name</th>
<th>category</th>
<th>price</th>
<th>quantity</th>
<th>Payed Type</th>
<th>Customer</th>

</tr>
<%
ResultSet rs1=st.executeQuery("SELECT * FROM onpur.cart  where  status='Payed' and semail='"+email +"'");
while(rs1.next()){
	sno=sno+1;

%>

<tr>
<td><%out.println(sno); %></td>
<td><%=rs1.getString(5) %></td>
<td><%=rs1.getString(6) %></td>
<td><%=rs1.getString(11) %></td>
<td><%=rs1.getString(4) %></td>
<td><%=rs1.getString(15) %></td>
<td><%=rs1.getString(9) %></td>

</tr>
<tr>
<%} %>
</table>
<h3>Total Amount: <%out.println(total); %></h3>

<a onclick="window.print();">  <button>Print</button></a>
<br><br><br><br>
<%
}

catch(Exception e)
{
	System.out.println(e);
}%>
</body>
</html>