<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Dbcon.dbcon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.FileInputStream" %>
<%@page import="java.io.IOException" %>
<%@page import="java.io.PrintWriter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css1/bootstrap.min.css">
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>





<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<style>
body{



}




.mydiv{
font-size:20px;
text-decoration:none;
float:right;
}
</style>
<div class="mydiv">
<a href="customerhome.jsp"><button class="btn btn-danger">Go back</button></a>
</div><br><br><br>
<body>

<% String location=session.getAttribute("loccus").toString();
String email=session.getAttribute("cemail").toString();
String id=request.getParameter("name").toString();%>

<div class="container">
<div class="row">



       <%
       
       Connection con;
       
       
       con=dbcon.create();
       PreparedStatement ps=con.prepareStatement("SELECT * FROM `onpur`.`addveg` where local='"+location+"' and vid='"+id+"' and statu='approved' and Dtype='NO-DELIVERY'");
     
       ResultSet rs=ps.executeQuery();
       
       while(rs.next())
       {
    
    	 
    		String stat=rs.getString(16);
    	
    	String image=rs.getString(10);
    	  
    	   
       %>
<div class="col-md-4">
<div class="card">
	

	  <div class="card-body">
	 
	  <p class="card-text"><img class="card-img-top" src="Local/<%=image%>" width="40" height="150" alt="Card image cap"></p>
	  <p class="card-text">Date :<%=rs.getString(2)%></p>    
   <p class="card-text"> product Type: <%=rs.getString(6)%></p>
    <p class="card-text">product Name:<%=rs.getString(7)%></p>
    <p class="card-text"> Total Quantity:<%=rs.getString(8)%></p>
    <p class="card-text">Price per KG :<%=rs.getString(9)%></p>
    <p class="card-text">Address :<%=rs.getString(5)%></p>   
   <p class="card-text">Status :<%=rs.getString(16)%></p>   
  
  <p class="card-text">Product status :<%=rs.getString(17)%></p>   
  
  
  
  
  
  
  
    <a href="cart.jsp?id=<%=rs.getString(1)%>&&email=<%=rs.getString(4)%>&&vid=<%=rs.getString(6)%>&&pname=<%=rs.getString(7)%>&&price=<%=rs.getString(9)%>&&pic=<%=rs.getString(10)%>&&cemail=<%=email%>&&Dtype=<%=rs.getString(13)%>&&add=<%=rs.getString(5)%>"><button style="width:100px; border-radius:20px;background-color:lightblue;margin-left:190px;">Add to cart</button></a>
 





 <%-- <a href="Qr code.jsp?id=<%=stat%>"><button style="width:100px; border-radius:20px;background-color:lightblue;margin-left:190px;">Check Verification</button></a> --%>
 
  
  
  
  <!--qr code  -->
  

   <div id="image" ></div>
  

  
  <div id="code" style=" height:20px;  margin-top:10px"></div>
 
  
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
</script>
 
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
      </div>
      
      </div>
      </div>
      

	<%} %>
	</div>
 </div>













</body>
</html>