<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.Date" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="top.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Conform modify success</title>
<link rel="stylesheet" type="text/css" href="main_style.css">

</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	Connection conn = null;		
	PreparedStatement pstmt = null;
	
	String url = "jdbc:mysql://localhost:3306/mydb";        
	String dbuser = "root";                                       
	String dbpass = "admin"; 
	
	
	String formId = request.getParameter("userID");
	String formName = request.getParameter("name");
	String formPass = request.getParameter("pwd");
	String formGender = request.getParameter("gender");
	String formBirth = request.getParameter("birth");
	String formCel = request.getParameter("cel");
	String formPos = request.getParameter("position");
	String formIntro = request.getParameter("intro");
		
	try{
		Class.forName("com.mysql.jdbc.Driver");            
		conn=DriverManager.getConnection(url,dbuser,dbpass);		
		
		String sql = "update member set pw='"+formPass+"' where id='"+session_id+"'";        
		pstmt = conn.prepareStatement(sql); 
		pstmt.executeUpdate();
		
		sql = "update member set name='"+formName+"' where id='"+session_id+"'";        
		pstmt = conn.prepareStatement(sql); 
		pstmt.executeUpdate();
		
		sql = "update member set gender='"+formGender+"' where id='"+session_id+"'";        
		pstmt = conn.prepareStatement(sql); 
		pstmt.executeUpdate();
		
		sql = "update member set birth='"+formBirth+"' where id='"+session_id+"'";        
		pstmt = conn.prepareStatement(sql); 
		pstmt.executeUpdate();
		
		sql = "update member set phone='"+formCel+"' where id='"+session_id+"'";        
		pstmt = conn.prepareStatement(sql); 
		pstmt.executeUpdate();
		
		sql = "update member set job='"+formPos+"' where id='"+session_id+"'";        
		pstmt = conn.prepareStatement(sql); 
		pstmt.executeUpdate();
		
		sql = "update member set self_intro='"+formIntro+"' where id='"+session_id+"'";        
		pstmt = conn.prepareStatement(sql); 
		pstmt.executeUpdate();

		pstmt.close();
		%>
<script language=javascript>
   alert("COMMIT successful");
   location.href="personal.jsp"; 
</script>
		<%		
	}catch(SQLException ex){
		out.println("ERROR: "+ex);		
	}finally{
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){} 
		if(conn != null) try{conn.close();}catch(SQLException sqle){}   
	}	
	
%>

</body>
</html>