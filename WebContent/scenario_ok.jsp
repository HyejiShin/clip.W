<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import = "com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy, java.io.File" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>scenario_ok</title>
<style>
	.m_scenario {
		background-color: #f62217; 
		}
	
	body {
		background-color: #333;
		}
	
	.page_title {
		color: #f62217;
		font-size: 40px;
		}
	
	th {
		text-align: center; 
		background: lightgray 
		}
	
	hr {
		color: #f62217;
		}
	
	.btn_write_post{
		color: white;
		font-size: 15px;
		font-weight: 700;
		background-color: #f62217;
		border: 5px solid #f62217;
		padding: 7px;
	}
</style>
</head>

<body>
	<%@ include file="top.jsp" %>
	<link rel="stylesheet" type="text/css" href="main_style.css" />
	<% 
try{
	Connection myConn = null;
  	Statement stmt = null;	
  	String mySQL = null;
	int max=0;
	Date time=new Date();
  	
	String savePath = application.getRealPath("/");
	int size = 10*1024*1024; 
	String encType="UTF-8";
	MultipartRequest multi = new MultipartRequest(request, savePath, size, encType, new DefaultFileRenamePolicy());
	 
	File file = multi.getFile("filename");
	String fileName = file.getName();
  	
  	String dburl  = "jdbc:mysql://localhost:3306/mydb";
  	String user="root";
  	String passwd="admin";
  	String driver = "com.mysql.jdbc.Driver";
  	
	String formTitle = multi.getParameter("title");
	String formContent = multi.getParameter("content");

  	Class.forName(driver);	
  	myConn= DriverManager.getConnection(dburl, user, passwd);

  	mySQL = "INSERT INTO scenario(title,writer,content,filePath,uDate) VALUES (?,?,?,?,?)";
    PreparedStatement pstmt = myConn.prepareStatement(mySQL);
  	
  	pstmt=myConn.prepareStatement(mySQL);
	pstmt.setString(1, formTitle);
	pstmt.setString(2, session_name);
	pstmt.setString(3, formContent);
	pstmt.setString(4, fileName);
	pstmt.setDate(5, new java.sql.Date(time.getTime()));
	pstmt.executeUpdate();
	%>
	<script>
		alert("COMMIT WRITE!");
		location.href='scenario.jsp';
	</script>
	<%
    pstmt.close();
    stmt.close();
    myConn.close();
}catch(Exception e){
	out.println(e.toString());
}
%>
</body>
</html>