<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%	
	String userID=request.getParameter("userID");
	String userPassword=request.getParameter("userPassword");
	
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
    mySQL = "select * from member where id='"+userID+"'and pw='"+ userPassword +"'";
    
    ResultSet myResultSet = stmt.executeQuery(mySQL);
    
    if (myResultSet.next()) {
    	session.putValue("user", myResultSet.getObject(3));
    	session.putValue("id", myResultSet.getObject(1));
        response.sendRedirect("main.jsp");
    }
    else {
    	mySQL="select * from groupTable where id='"+userID+"'and pw='"+userPassword+"'";
    	myResultSet=stmt.executeQuery(mySQL);
    	if(myResultSet.next()){
    		session.putValue("user", myResultSet.getObject(3));
    		session.putValue("id", myResultSet.getObject(1));
            response.sendRedirect("main.jsp");
    	}	%>
<script>
  alert("ID or PWD is not correct!");
  location.href = "login.jsp"; 
</script>
<%  
    	
	} stmt.close();
      myConn.close();
%>