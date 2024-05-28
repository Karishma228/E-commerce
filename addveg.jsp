<html lang="en">
<%@ page import="java.util.*"%>
 <%@page import="embed.*" %>
 <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
 <%@page import="jssc.SerialPort" %>

<%@page import="jssc.SerialPortException" %>
<%@page import="jssc.SerialPortList" %>
<%@page import="jssc.SerialPortEvent" %>
<head>
<script type="text/javascript" src="https://github.com/rubyeffect/easy_fill/tree/master/lib/easy_fill-0.0.1.min.js"></script>
  <title>Reach Me</title>
  <link rel="stylesheet" type="text/css" href="appointment.css" />
  <link rel="stylesheet" href="css1/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min1.css">
</head>
<Style>
body{
background-image:url("image/r11.jpg");
background-size:cover;
background-color: #c8b6ff;



}


.centr{
  margin: 50px auto;
}

.m-btm {
    text-align: center;
  margin-bottom: 35px;
}

.mtn{
  text-align: center;
}

.d-bl{
  display: block;
  margin-bottom: 25px;
}

#btnal {
  background: teal;
  color: aqua;
  border-radius: 8px;
  padding: 0.88rem;
  font-size: 0.83rem;
  cursor: pointer;
}

#btnal.vertical-shake {
  animation: vertical-shaking 0.37s infinite;
}

#btnal.horizontal-shake {
  animation: horizontal-shaking 0.37s infinite;
  animation-play-state: running; /* Default state is running */
}

#btnal.rise-shake {
  animation: jump-shaking 0.80s infinite;
}


@keyframes vertical-shaking {
  0% {
    transform: translateY(0) 
  }
  25% {
    transform: translateY(10px) 
  }
  50% {
    transform: translateY(-10px) 
  }
  70% { 
    transform: translateY(10px) 
  }
    75% {
        transform: translateX(0px)
    }
  100% {
    transform: translateY(0) 
  }
}

@keyframes horizontal-shaking {
  0% { 
    ransform: translateX(0) 
  }
  25% {
    transform: translateX(10px) 
  }
  50% {
    transform: translateX(-11px) 
  }
  70% {
    transform: translateX(10px) 
  }
75% {
        transform: translateX(0px)
    }
  100% {
  transform: translateX(0px) 
}
}

@keyframes jump-shaking {
  0% {  
    transform: translateX(0) 
}
  25% { 
    transform: translateY(-9px) 
}
  35% { 
    transform: translateY(-9px) rotate(18deg) 
}
  55% { 
    transform: translateY(-9px) rotate(-18deg) 
}
  65% { 
    transform: translateY(-9px) rotate(18deg) 
}
  70% { 
    transform: translateY(-9px) rotate(-18deg) 
}
75% {
    transform: translateY(0) rotate(0)
    }
  100% { 
    transform: translateY(0) rotate(0) 
}
}





































































</Style>
<%String location=session.getAttribute("slocal").toString(); %>
 <%
Random r=new Random(); 
		 String key2="1234567890";
		 					char c1=key2.charAt(r.nextInt(key2.length()));
		 					char c2=key2.charAt(r.nextInt(key2.length()));
		 					char c3=key2.charAt(r.nextInt(key2.length()));
		 					char c4=key2.charAt(r.nextInt(key2.length()));
		 					char c5=key2.charAt(r.nextInt(key2.length()));
		 					char c6=key2.charAt(r.nextInt(key2.length()));
		 					char c7=key2.charAt(r.nextInt(key2.length()));
		 					char c8=key2.charAt(r.nextInt(key2.length()));
		 					char c9=key2.charAt(r.nextInt(key2.length()));
		 					char c10=key2.charAt(r.nextInt(key2.length()));
		 					String t5=""+c1+""+c2+""+c3+""+c4; 
		 					
		 					
		 					

		 				   embedd ab=new embedd();
		 				   
		 				 	ab.connect();  
		 				 



		 				      	 embedd a=new embedd();	

		 				      	 
		 				      	String c = a.r;
		 				      	System.out.println("ans is " + c); 
		 				      	
		 				          

		 				      	String in = "";
		 				      	String outt = "";
		 				      	String loc = "";

		 				      	if (c.contains("null")) {
		 				      	    String value = c.replace("null", "");

		 				      	    if (value.contains("*") && value.contains("#")) {
		 				      	        String data[] = value.split("[*#]");
		 				      	        in = data[1];
		 				      	    }

		 				      	    if (value.contains("$") && value.contains("@")) {
		 				      	        String data1[] = value.split("[$@]");
		 				      	        outt = data1[1]; 
		 				      	    }

		 				      	    if (value.contains("&") && value.contains("!")) {
		 				      	        String data2[] = value.split("[&!]");
		 				      	        loc = data2[1]; 
		 				      	    }
		 				      	} else {
		 				      	    if (c.contains("*") && c.contains("#")) {
		 				      	        String data[] = c.split("[*#]");
		 				      	        in = data[1]; 
		 				      	    }

		 				      	    if (c.contains("$") && c.contains("@")) {
		 				      	        String data1[] = c.split("[$@]");
		 				      	        outt = data1[1]; 
		 				      	    }

		 				      	    if (c.contains("&") && c.contains("!")) {
		 				      	        String data2[] = c.split("[&!]");
		 				      	        loc = data2[1]; 
		 				      	    }      
		 				      	}     

		 				      	System.out.println("IN: " + in);
		 				      	System.out.println("OUT: " + outt);
		 				      	System.out.println("LOC: " + loc);
		 				         	a.toclose();  
		 				       
		 				         
		 				      %>

		 		
`
<body>

<% String email=session.getAttribute("semail").toString(); %>
   <div class="container">
  
   
 <div class="centr">
  <div class="mtn">
 
  <button class="rise-shake" id="btnal">Add Product </button>
</div>
   <div class="centr">
    
    <form method="post" action="vegaddsevlet" enctype="multipart/form-data">
     <div class="row">
       <div class="card col-sm-5" style="padding-bottom:10px;background-color: #333;color:#fff;padding:10px;margin-left:30%;width: 38em;margin-bottom: 25px">
        <div class="form-group">
         <div class="form-group">
          <label for="address"  style="color:#fff;">Date :</label>
          <input type="date" class="form-control" id="address"  name="date" required>
        </div>
          <label for="full_name" style="color:#fff;"> Owner Name:</label>
          <input type="text" class="form-control" id="full_name" placeholder="Enter Full Name" name="name" required>
        </div>
        <div class="form-group">
          <label for="email"  style="color:#fff;">Email:</label>
          <input type="email" class="form-control" id="email" placeholder="Enter Email" name="email" value="<%=email%>" readonly>
                  </div>
 
 <div class="form-group">
          <label for="email"  style="color:#fff;">Location:</label>
          <input type="text" class="form-control" id="email" placeholder="Enter Location" name="location" >
          
        </div>
           <div class="form-group">
          <label for="password1"  style="color:#fff;">Address </label>
          <textarea type="text" class="form-control" id="password1" placeholder="Enter Cuurent Address" name="add" required></textarea>
        </div>
        
       
        <div class="form-group"> 
          <label for="email"  style="color:#fff;">product Type:</label>
          <select class="form-control" name="cid" placeholder="select Product">
                        <option value="veg">VEGITABLE</option>
                        <option value="fruits">FRUITS</option>
                        <option value="grains">GRAINS</option>
                        <option value="rice">RICE</option>
             
              </select>
        <div class="form-group">
          <label for="address"  style="color:#fff;">Product Name</label>
          <input type="text" class="form-control" id="address" placeholder="Enter Name" value="<%=in%>" name="add" required>
        </div>
         <div class="form-group">
          <label for="password1"  style="color:#fff;">Total Quantity </label>
          <input type="text" class="form-control" id="password1" value="<%=outt%>" placeholder="Enter quantity" name="city" required>
        </div>
          <div class="form-group">
          <label for="phone_no"  style="color:#fff;"><i class="fa fa-inr"></i>Price Per KiloGram</label>
          <input type="text" class="form-control" id="phone_no" value="<%=loc%>" placeholder="Enter price " name="price" required>
        </div>
        <div class="form-group">
          <label for="phone_no"  style="color:#fff;">Payment</label>
        <select class="form-control" name="state" placeholder="select Product">
                        <option value="DELIVERY">DELIVERY</option>
                        <option value="NO-DELIVERY">NO-DELIVERY</option>
                        
        
              </select>
        </div>
           
        
        <div class="form-group">
          <label for="card_photo"  style="color:#fff;">Upload your Container photo:</label>
          <input type="file" class="form-control" placeholder="Enter password" name="photo" accept="image/*" onchange="preview_image(event)" required>
        </div>
        
        <center><button  class="btn btn-primary btn-block"  style="width:50%;" onclick="return Validate()">Register</button></center><br>
               
      </div>
    </div>
    <hr>
     
  </form>
</div>
</body>

<script type='text/javascript'>
  function preview_image(event)
  {
    var reader = new FileReader();
    reader.onload = function()
    {
      var output = document.getElementById('output_image');
      output.src = reader.result;
    }
    reader.readAsDataURL(event.target.files[0]);
  }
  </script>


</html>