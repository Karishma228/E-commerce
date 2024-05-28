<%@ page import="Dbcon.dbcon" %>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.*"%>

<%@ page import="Bean.dcartbean" %> 
<%@ page import="Imple.Imple" %> 
<%@ page import="Inter.Inter" %> 
 <%@ page import="java.io.IOException"%>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.annotation.WebServlet"%>
<%@ page import="javax.servlet.http.HttpServlet"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%


String id=request.getParameter("id");
String semail=request.getParameter("email");
String vid=request.getParameter("vid");
String pname=request.getParameter("pname");
String price=request.getParameter("price");
String pic=request.getParameter("pic");
String cemail=request.getParameter("cemail");
String dtype=request.getParameter("Dtype");
String add=request.getParameter("add");
String quantity=request.getParameter("quantity");


		dcartbean ap=new dcartbean();
	
		ap.setProductid(id);
		ap.setSemail(semail);
		ap.setVid(vid);
		ap.setPname(pname);
		ap.setPrice(price);
		ap.setPic(pic);
		ap.setCemail(cemail);
		ap.setTotal(price);
		ap.setDtype(dtype);
		ap.setAdd(add);
		ap.setQuantity(quantity);
		
		       
	     
		    
		
		Inter r=new Imple();
		int m=r.dcar(ap);
		if(m==1){
			response.sendRedirect("Dview.jsp?name=vid");
			}
		else{
			response.sendRedirect("error1.jsp");
		}
		
%>
</body>
</html>