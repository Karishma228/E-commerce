<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="Dbcon.dbcon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.FileInputStream" %>
<%@page import="java.io.IOException" %>

<html ng-app="ionicApp">



 <head>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
    
    <title>Rate Stars</title>

    <link href="//code.ionicframework.com/nightly/css/ionic.css" rel="stylesheet">
    <script src="//code.ionicframework.com/nightly/js/ionic.bundle.js"></script>
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Acme&display=swap');

.content{
    display: flex;
    align-items: center;
    width:100%;
    
}

body{
 background-image:url("image/ooo.jpg"); 
   background-size:cover;
  overflow:hidden; 


}






.container{
width:50%;
height:30%;

}

.mid{
    display: flex;
       
}
.active{
  background-color: gold;
    transform: scale(1.2);
}
button{
background-color:blue;
width:150px;
height:50px;
border-radius:10px;
}
.card-body{
background-color:glass;
height:100%;
}
img{
    height: 50px; width: 50px;
    cursor: pointer;
    background-color: rgba(233, 212, 97, 0.507);
    border-radius: 50%;
    transition: 0.1s linear;
}
img:hover{
    background-color: gold;
    transform: scale(1.2);
}


 </style>
   
  </head>
  <body>
  <center>
  <h1>FEEDBACKS</h1></center>
               
       
  
  
  
  
  
  <div class="head">
  <div class="heading" >
  

    <div class="content">
        <div class="container">
            
             <%
       
       Connection con;
       
       
       con=dbcon.create();
       PreparedStatement ps=con.prepareStatement("SELECT * FROM `onpur`.`feed`");
       ResultSet rs=ps.executeQuery();
       
       while(rs.next())
       {
     String rat=rs.getString(2);
     System.out.println(rat);
     String rate[]=rat.split(".");
    
    	
    	   
       %>
       
  
    <div class="col-md-4">
<div class="card">
	

	  <div class="card-body">	   

<p>Email:<%=rs.getString(1)%></p>
<div class="rate">
<script>
       
    	   const element = rat;
    	   document.writeln(rat);
    	  
    	   
    	   if (<%=rs.getString(2)%>=="1.angry") {
    	   
    	     document.getElementById("1").className = "active";
    	   } 
    	   else if (<%=rs.getString(2)%>=="2.moderate") {
      	  
      	     document.getElementById("2").className= "active";
      	   }
    	   else if (<%=rs.getString(2)%>.equals("3.neutral")) {
      	   
      	     document.getElementById("3").className = "active";
      	   }
    	   else if (<%=rs.getString(2)%>.equals("4.smile")) {
    		   
    		    
      	    const rar=document.getElementById("4");
      	    rar.className = "active";
      	   }else {
    	   
    	     document.getElementById("5").className.value = "active";
    	   }
    	 </script>
            <div class="mid">
                <div class="media"><img src="https://cdn-icons-png.flaticon.com/128/3260/3260838.png" name="rat"  alt="angry" id="1"  class="" ></div>
                <div class="media"><img src="https://cdn-icons-png.flaticon.com/128/42/42901.png" name="rat"   alt="moderate" id="2" class="" ></div>
                <div class="media"><img src="https://cdn-icons-png.flaticon.com/128/3260/3260877.png" name="rat"   alt="neutral" id="3" class="" ></div>
                <div class="media"><img src="https://cdn-icons-png.flaticon.com/128/569/569501.png" name="rat"  alt="smile" id="4" class="" ></div>
                <div class="media"><img src="https://cdn-icons-png.flaticon.com/128/1356/1356639.png" name="rat"   alt="happy" id="5" class="" ></div>
            </div>
            
  

<p>Feedback: 	<%=rs.getString(2)%></p>
<p>Description:<%=rs.getString(3)%>



    
      </div>
      </div>
      </div>

	<%} %>
	</div>
 </div></div>
  </body>
</html>
<!-- <script>
function myFunction() {
  const element = document.getElementById("1");
  
  if (element.className == "") {
    element.className = "active";
    document.getElementById("val").value="1.angry";
  } else {
    element.className = "";
    document.getElementById("val").value="";
  }
}
function myFunctio() {
	  const element = document.getElementById("2");
	  
	  if (element.className == "") {
	    element.className = "active";
	    document.getElementById("val").value="2.moderate";
	  } else {
	    element.className = "";
	    document.getElementById("val").value="";
	  }
	}
	 
function myFuncti() {
	  const element = document.getElementById("3");
	  
	  if (element.className == "") {
	    element.className = "active";
	    document.getElementById("val").value="3.neutral";
	  } else {
	    element.className = "";
	    document.getElementById("val").value="";
	  }
	}
	 
function myFunct() {
	  const element = document.getElementById("4");
	  
	  if (element.className == "") {
	    element.className = "active";
	    document.getElementById("val").value="4.smile";
	  } else {
	    element.className = "";
	    document.getElementById("val").value="";
	  }
	}
	 
function myFunc() {
	  const element = document.getElementById("5");
	  
	  if (element.className == "") {
	    element.className = "active";
	    document.getElementById("val").value="5.happy";
	  } else {
	    element.className = "";
	    document.getElementById("val").value="";
	  }
	}
	 
 
</script> -->
