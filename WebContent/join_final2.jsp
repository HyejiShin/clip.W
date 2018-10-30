<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.Date" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>단체 회원가입 최종 확인</title>
<link rel="stylesheet" type="text/css" href="main_style.css">
</head>
<body>

<%	
	String userID=request.getParameter("userID");
	
	Connection myConn = null;
  	Statement stmt = null;	
  	String mySQL = null;

  	String dburl  = "jdbc:mysql://localhost:3306/mydb";
  	String user="root";
  	String passwd="admin";
  	String driver = "com.mysql.jdbc.Driver";

  	Class.forName(driver);	
  	myConn= DriverManager.getConnection(dburl, user, passwd);
    
  	stmt = myConn.createStatement();  
    mySQL = "select * from member where id='"+userID+"'";
    
    ResultSet myResultSet = stmt.executeQuery(mySQL);
    
    if (myResultSet.next()) {%>
    	<script>
    		alert("ID is not available. Please put id again!");
    		history.back();
    	</script>
    <%
    return;
    }
    else {
    	mySQL="select * from groupTable where id='"+userID+"'";
    	myResultSet=stmt.executeQuery(mySQL);
    	if(myResultSet.next()){
    	%>
    		<script>
    			alert("ID is not available. Please put id again!");
    			history.back();
    		</script>
    	<%
    	return;
    	}
	
	} stmt.close();
      myConn.close();

	request.setCharacterEncoding("UTF-8");
	
	Connection conn = null;		
	PreparedStatement pstmt = null;
	
	String url = "jdbc:mysql://localhost:3306/mydb";        
	String dbuser = "root";                                       
	String dbpass = "admin"; 
	
	String formId = request.getParameter("userID");
	String formName = request.getParameter("name");
	String formPass = request.getParameter("pwd");
	String formBirth = request.getParameter("birth");
	String formCel = request.getParameter("cel");
	String formJob = request.getParameter("job");
	String formIntro = request.getParameter("intro");
		
	try{
		Class.forName("com.mysql.jdbc.Driver");            
		conn=DriverManager.getConnection(url,dbuser,dbpass);
		
		String sql = "INSERT INTO groupTable values(?, ?, ?, ?, ?, ?, ?, ?, ?)";        
		pstmt = conn.prepareStatement(sql); 
		pstmt.setString(1, formId);
		pstmt.setString(2, formPass);
		pstmt.setString(3, formName);
		pstmt.setString(4, formBirth);
		pstmt.setString(5, formCel);
		pstmt.setString(6, formJob);
		pstmt.setString(7,"");
		pstmt.setString(8, formIntro);
		pstmt.setString(9, "images/me.jpg");
		pstmt.executeUpdate();
		%>
<script language=javascript>
   alert("Congraturation! Welcom to clip.W");
   location.href="login.jsp"; 
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