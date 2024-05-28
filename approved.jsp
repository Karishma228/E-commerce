<%@ page import="Dbcon.dbcon" %>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.*"%>
<%@ page import="Bean.Block"%>
<%@ page import="Bean.mining"%>
<%@ page import="Servlet.AES"%>
<%@ page import="Bean.difficultylevel"%>
<%@ page import="java.math.BigInteger"%>



<%
	String name=request.getParameter("id");



String status="approved";

	
	String prehash="";
		String afterhash="";
	Connection con=dbcon.create();
		try {
	System.out.println("ygdgdgdsgdg");
	PreparedStatement pa= con.prepareStatement("SELECT * FROM `onpur`.`addveg`");
	ResultSet rs=pa.executeQuery();
	
	
	
	
	
	
	
	
	
	
	
	
	while(rs.next()){
		prehash=rs.getString(14);
		afterhash=rs.getString(18);
		
	
		System.out.println("yyyy:"+afterhash);
	
	}
		
		
		
	 AES s=new AES();
	 
		
	 
	 
		Block genesisBlock = new Block("Hi im the first block", "0");

		String phas=genesisBlock.hash;
		
		Block secondBlock = new Block("Yo im the second block",genesisBlock.hash);
		System.out.println("Hash for block 2 : " + secondBlock.hash);
		String aphas=secondBlock.hash; 
		String d= s.encrypt99(aphas);	
		 int initialDifficulty = 3;
	        mining blockchain = new mining(initialDifficulty);

	        // Adding blocks to the blockchain
	        blockchain.addBlock(aphas);
	        

	        // Validating the blockchain
	        blockchain.isChainValid();
	
	    	System.out.println("yyyy:"+afterhash);
	
	    	
	    	String difficultyTargetHex = aphas;

	        // Convert the difficulty target to a BigInteger
	        BigInteger difficultyTarget = new BigInteger(difficultyTargetHex, 16);
difficultylevel dd=new difficultylevel();
	        // Calculate the difficulty level
	     
	        
	       

	        // Print the result
	   
	        
	        
	      BigInteger referenceDifficultyTarget = new BigInteger("00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF", 16);

    // Calculate the difficulty level as a ratio of the reference difficulty target
    double difficultyRatio = referenceDifficultyTarget.doubleValue() / difficultyTarget.doubleValue();

    // Adjust the difficulty level as needed (this is a simple example)
  
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        System.out.println("Difficulty Level: " + difficultyRatio);
	    	
	    	
	    	
	    	
	    	
	    	
	    	
	    	
	
	Connection conn=dbcon.create();
	Statement st=conn.createStatement();
	st.executeUpdate("UPDATE `onpur`.`addveg` set statu='"+status+"', statusv='Blockchain verified By Admin', st='Verified By Admin', phash='"+d+"', ahash='"+aphas+"', encryptform='"+d+"'  where id='"+name+"' ");
	response.sendRedirect("Approval.jsp?valid");
		
		
		
		
		
		
		
		
		
		
		
		
		
		}	 
		 catch (SQLException e1) {
	// TODO Auto-generated catch block
	e1.printStackTrace();
		}
%>