<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy, java.io.File" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<html> 
<head>
<%@ include file="top.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
String savePath = application.getRealPath("/");
int size = 10*1024*1024; 
String encType="UTF-8";
MultipartRequest multi = new MultipartRequest(request, savePath, size, encType, new DefaultFileRenamePolicy());
 
File file = multi.getFile("filename");
String fileName = file.getName();
//String realPath = application.getRealPath("/")+"\\"+fileName;
String realPath=application.getRealPath("/")+"\\"+"fileName";
	Connection conn = null;		
	PreparedStatement pstmt = null;
	
	String url = "jdbc:mysql://localhost:3306/mydb";        
	String dbuser = "root";                                       
	String dbpass = "admin"; 
		
	try{
		Class.forName("com.mysql.jdbc.Driver");            
		conn=DriverManager.getConnection(url,dbuser,dbpass);
		
		String sql = "update member set imgPath='"+file.getName() +"' where id='"+session_id+"'";        
		pstmt = conn.prepareStatement(sql); 
		pstmt.executeUpdate();
		pstmt.close();
		
		sql = "update groupTable set imgPath='"+file.getName() +"' where id='"+session_id+"'";        
		pstmt = conn.prepareStatement(sql); 
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		%>
<script language=javascript>
   alert("프로필 사진 변경이 완료되었습니다."); 
   location.href="personal.jsp"
</script>
		<%
	}catch(SQLException ex){
		out.println("에러: "+ex);		
	}finally{
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){} 
		if(conn != null) try{conn.close();}catch(SQLException sqle){}   
	}		
%>
</head>
</html>