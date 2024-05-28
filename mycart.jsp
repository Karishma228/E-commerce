<%@ page import="Dbcon.dbcon" %>
    <%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.*"%>
 <%@ page import="java.util.UUID"%> 
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Insert title here</title>
<style>

body{
background-image:url("images/rm.jpg");
background-size:cover;
}



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
 color: #5a189a;
}

a{
    text-decoration:none;
color:deeppink;
font-weight:bold;
font-size:20px;
}</style>

</head>
<body>
<table>
<center>
<div class="back">
<button class="btn btn-primary" onclick="history.back()">Back</button>
</div>
</center>
<thead>
<% 
String userid=session.getAttribute("cemail").toString();
int ftotal=0;
int sno=0;

%>
<% 
try{
	Connection con=dbcon.create();
	Statement st=con.createStatement();
	ResultSet rs1=st.executeQuery("SELECT sum(total) FROM onpur.cart where cemail='"+userid+"' and status='Add to cart' and Dtype='NO-DELIVERY' ");
	
	while(rs1.next())
	{
		ftotal=rs1.getInt(1);
		System.out.println(ftotal);
		
	}
}
catch(Exception e){
	
}

%>
<%UUID uuid=UUID.randomUUID(); %>
<tr>
<th scope="col" Style="background-color:green;">Total: <%out.println(ftotal);   %></th>
 <%if(ftotal>0){	 %><th scope="col"><a href="proceedtoorder.jsp?id=<%=ftotal%>&&user=<%=userid%>&&uid=<%=uuid%>">Proceed to order</a></th><%} %> 
</tr>
</thead>
<thead>
<tr>
<th scope="col">Product name</th>
<th scope="col">Quantity</th>
<th scope="col">price</th>
<th scope="col">Category</th>
<th scope="col">Sub Total</th>
<th scope="col">Product</th>
<th scope="col">Remove</th>
</tr>
</thead>
<tbody>
<%

try{
Connection con=dbcon.create();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("SELECT * FROM onpur.cart where cemail='"+userid+"' and status='Add to cart' and Dtype='NO-DELIVERY'");
while(rs.next())
	
{
%>

<tr>


<td><%=rs.getString(6)  %></td>
<td><a href="indecaction.jsp?id=<%=rs.getString(1)%>&quantity=inc"><i class="fa fa-plus-square"></i>
								</a><%=rs.getString(4) %><a href="indecaction.jsp?id=<%=rs.getString(1)%>&quantity=dec"><i class="fa fa-minus-square"></i></a></td>
<td><i class="fa fa-inr"></i><%=rs.getString(7) %></td>
<td><%=rs.getString(5) %></td>
<td><%=rs.getString(11) %></td>
	  <td><img class="card-img-top" src="Local/<%=rs.getString(8) %>" width="90" height="100" alt="Card image cap"></td>

<td><a href="removefromcart.jsp?id=<%=rs.getString(1) %>">Remove<i class='fa fa-trash-alt'></i></a></td>
</tr>

<%

}
}
catch(Exception e)
{ 
System.out.println(e);
}
%>
</tbody>
</table>
</body>
</html>